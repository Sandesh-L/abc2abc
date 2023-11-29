/*
 * parseabc.c - code to parse an abc file. This file is used by the
 * following 4 programs :
 * abc2midi - program to convert abc files to MIDI files.
 * abc2abc  - program to manipulate abc files.
 * yaps     - program to convert abc to PostScript music files.
 * Copyright (C) 1999 James Allwright
 * with changes by Seymour Shlien and others 2000-2020
 * Further modified by James Allwright 2020
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */


/* Macintosh port 30th July 1996 */
/* DropShell integration   27th Jan  1997 */
/* Wil Macaulay */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h> /* for strcasecmp */
#include <ctype.h>
#include "abc.h"
#include "parseabc.h"
#include "string_utils.h"
#include "music_utils.h"
#include "parser_interface.h"
#include "barlines.h"
#include "parser_utils.h"
// #include "toabc.h"

/* fields permitted in various places as specified by abc standard 2.2 */
#define PERMITTED_FILE_HEADER_FIELDS "ABCDFGHILMmNORrSUZ"
#define PERMITTED_TUNE_HEADER_FIELDS "ABCDFGHIKLMmNOPQRrSTUVWXZ"
#define PERMITTED_TUNE_BODY_FIELDS "IKLMmNPQRrsTUVWw+"
#define PERMITTED_INLINE_FIELDS "IKLMmNPQRrUV"

/* uncomment the appropriate statement to enable/disable debug. */
//#define DEBUG(x) x
#define DEBUG(x)

/* The full list of predefined decorations is ".~HLMOPSTuv"
 * However, all but . are handled as redefinable
 */
const char single_char_decorations[] = ".";

extern programname fileprogram;
/* This is the latest abc version that the program supports */
const char *program_abcversion = "2.0"; /* [SS] 2014-08-11 */
char tune_abcversion[40];       /* version found in abc - currently not used */


typedef struct dec_table_entry
{
  char *name;
  decoration_type_t value;
} dec_table_entry_t;

static const dec_table_entry_t decorators_table[] = {
  /* existing decorations only expressible as single characters */
  {"staccato", DEC_STACCATO},
  {"ornament", DEC_ORNAMENT},
  /* new decorations defined in the standard */
  {"trill", DEC_TRILL},
  {"trill(", DEC_OPEN_TRILL},
  {"trill)", DEC_CLOSE_TRILL},
  {"lowermordent", DEC_LOWERMORDENT},
  {"uppermordent", DEC_UPPERMORDENT},
  {"mordent", DEC_MORDENT},
  {"pralltriller", DEC_PRALLTRILLER},
  {"roll", DEC_ROLL},
  {"turn", DEC_TURN},
  {"turnx", DEC_TURNX},
  {"invertedturn", DEC_INVERTEDTURN},
  {"invertedturnx", DEC_INVERTEDTURNX},
  {"arpeggio", DEC_ARPEGGIO},
  {">", DEC_EMPHASIS},
  {"accent", DEC_EMPHASIS},
  {"emphasis", DEC_EMPHASIS},
  {"^", DEC_MARCATO},
  {"marcato", DEC_MARCATO},
  {"fermata", DEC_FERMATA},
  {"invertedfermata", DEC_INVERTEDFERMATA},
  {"tenuto", DEC_TENUTO},
  {"+", DEC_PLUS},
  {"plus", DEC_PLUS},
  {"snap", DEC_SNAP},
  {"slide", DEC_SLIDE},
  {"wedge", DEC_WEDGE},
  {"upbow", DEC_UPBOW},
  {"downbow", DEC_DOWNBOW},
  {"open", DEC_OPEN},
  {"thumb", DEC_THUMB},
  {"breath", DEC_BREATH},
  {"crescendo(", DEC_OPEN_CRESCENDO},
  {"<(", DEC_OPEN_CRESCENDO},
  {"crescendo)", DEC_CLOSE_CRESCENDO},
  {"<)", DEC_CLOSE_CRESCENDO},
  {"diminuendo(", DEC_OPEN_DIMINUENDO},
  {">(", DEC_OPEN_DIMINUENDO},
  {"diminuendo)", DEC_CLOSE_DIMINUENDO},
  {">)", DEC_CLOSE_DIMINUENDO},
  {"segno", DEC_SEGNO},
  {"coda", DEC_CODA},
  {"shortphrase", DEC_SHORTPHRASE},
  {"mediumphrase", DEC_MEDIUMPHRASE},
  {"longphrase", DEC_LONGPHRASE},
  {"editorial", DEC_EDITORIAL},
  {"courtesy", DEC_COURTESY},
  /* text decorations */
  {"pppp", DEC_PPPP},
  {"ppp", DEC_PPP},
  {"pp", DEC_PP},
  {"p", DEC_P},
  {"mp", DEC_MP},
  {"mf", DEC_MF},
  {"f", DEC_F},
  {"ff", DEC_FF},
  {"fff", DEC_FFF},
  {"ffff", DEC_FFFF},
  {"sfz", DEC_SFZ},
  {"D.S.", DEC_DS},
  {"D.S.alcoda", DEC_DS_AL_CODA},
  {"D.S.alfine", DEC_DS_AL_FINE},
  {"D.C.", DEC_DC},
  {"D.C.alcoda", DEC_DC_AL_CODA},
  {"D.C.alfine", DEC_DC_AL_FINE},
  {"dacoda", DEC_DACODA},
  {"dacapo", DEC_DACAPO},
  {"fine", DEC_FINE},
  {"0", DEC_ZERO},
  {"1", DEC_ONE},
  {"2", DEC_TWO},
  {"3", DEC_THREE},
  {"4", DEC_FOUR},
  {"5", DEC_FIVE},

};
#define NUM_DECORATIONS (sizeof(decorators_table) / sizeof(dec_table_entry_t))

/* bar counting code */
static void add_to_barcount(struct fract *barcount, int num, int denom,
  int unitlen)
{
  barcount->num = (num * barcount->denom) + (barcount->num * denom * unitlen);
  barcount->denom = (denom * unitlen) * barcount->denom;
  reduce (&barcount->num, &barcount->denom);
}

/*
 * addunits must be called for each single note or rest and
 * at each chord end.  When called at chordoff time, make
 * sure that inchord is still true. [PHDM] 2013-03-10
 */
/* add fraction n/m to count */
static void addunits (void *vstatus, int n, int m)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  voice_context_t *current_voice;
  int to_add_num;
  int to_add_denom;

  if ((status->ingrace) || (status->parserinchord)) {
    return;
  }
  current_voice = &status->voice_state[status->voicenum - 1];
  to_add_num = n;
  to_add_denom = m;
  if (status->tuplenotes > 0) {       /* [PHDM] 2013-03-10 */
    to_add_num = n *status->tuplefactor.num;
    to_add_denom = m *status->tuplefactor.denom;
  }
  add_to_barcount(&current_voice->barcount, to_add_num, to_add_denom,
    current_voice->unitlen);
}

/* initialize a timesig structure to default values */
void init_timesig(timesig_details_t *timesig)
{ 
  timesig->type = TIMESIG_FREE_METER;
  timesig->num = 4;
  timesig->denom = 4;
  timesig->complex_values[0] = 4;
  timesig->num_values = 1;
}

void init_voice_contexts (parser_status_t * status)
{
  int i;
  cleftype_t default_clef;

  /* we use treble clef when no clef is explicitly specified */
  get_standard_clef ("treble", &default_clef); /* default to treble clef */
  for (i = 0; i < MAX_VOICES; i++) {      /* [SS} 2015-03-15 */
    voice_context_t *voice;

    voice = &status->voice_state[i];
    voice->name[0] = '\0';
    voice->expect_repeat = 0;
    voice->repeat_count = 0;
    voice->barcount.num = 0;
    voice->barcount.denom = 1;
    voice->last_bar_type = DOUBLE_BAR;
    voice->extended_bar = 0;
    init_timesig(&voice->timesig);
    copy_clef(&voice->clef, &default_clef);
    if (status->rep_handling != PASS2_SUBSTITUTE_NEW_BARS)
    {
      voice->bars_in_tune = NULL;
    }
    voice->current_bar = voice->bars_in_tune;
  }
}

/* copy one timesig_details_t struct to another */
void copy_timesig(timesig_details_t *destination, timesig_details_t *source)
{
  int i;

  destination->type = source->type;
  destination->num = source->num;
  destination->denom = source->denom;
  for (i = 0; i < 8; i++)
  {
    destination->complex_values[i] = source->complex_values[i];
  }
  destination->num_values = source->num_values;
}

/* called at the start of each tune */
static void newtune_reset_parser (parser_status_t * status)
{
  int i;

  init_timesig(&status->master_timesig);
  get_standard_clef ("treble", &status->master_clef); /* default to treble clef */
  /* set timesig and unitlen to invalid values to indicate unset */
  status->has_timesig = 0;
  status->master_unitlen = -1;
  status->voicenum = 1;
  status->has_voice_fields = 0;
  status->num_voices = 1;
  status->chord_len1.num = 0;
  status->chord_len1.denom = 1;
  status->parserinchord = 0;
  status->notesinchord = 0;
  status->ingrace = 0;
  status->tuplenotes = 0;
  status->tuplefactor.num = 0;
  status->tuplefactor.denom = 0;
  status->inline_field = 0;
  status->slur = 0;
  status->tune_ready = 0;
  status->dec_context.num_decorations = 0;
  for (i = 0; i < MAX_DECORATIONS; i++) {
    status->dec_context.decorations_to_apply[i].type = DEC_UNKNOWN;
    status->dec_context.decorations_to_apply[i].abbrev = ' ';
    status->dec_context.decorations_to_apply[i].str = NULL;
  }
  init_voice_contexts (status);
  status->textinbody = 0;
}

/* release all the memory associated with decoration context
 * and set it to have no decorations
 */
static void free_decorations(decoration_context_t *dec_context)
{
  int i;

  for (i = 0; i < dec_context->num_decorations; i++) {
    if (dec_context->decorations_to_apply[i].str != NULL) {
      free(dec_context->decorations_to_apply[i].str);
      dec_context->decorations_to_apply[i].str = NULL;
    }
  }
  dec_context->num_decorations = 0;
}

/* called at the start of each tune. If we are doing two passes, this
 * function is only called at the start of the first pass.
 */
static void newtune_reset_pass1(parser_status_t * status)
{
  if (status->new_reps) {
    status->rep_handling = PASS1_MAKE_BAR_LIST;
  } else {
    status->rep_handling = NO_NEW_REPS;
  }
}

/* called at the start of the program */
void init_parser_status (parser_status_t * status)
{
  int i;

  status->plus_is_chord = 0;
  status->plus_is_dec = 0;
  status->repcheck = 1;
  status->barcheck = 1;
  status->rep_handling = NO_NEW_REPS;
  status->new_reps = 0;
  init_text_lines(&status->original_tune);

  status->inputline = malloc (512);
  status->inputline[0] = '\0';
  status->state = OUTSIDE_TUNE;
  status->new_refno = 0;
  for (i = 0; i < SIZE_ABBREVIATIONS; i++) {
    status->abbreviation[i].type = DEC_UNKNOWN;
    status->abbreviation[i].string = NULL;
  }
  status->lastfieldcmd = ' ';

  /* used by abc2midi */
  status->setmicrotone.num = 0;
  status->setmicrotone.denom = 0;
  status->temperament = 0;

  status->error_obj.lineno = 0;
  init_text_lines (&status->error_obj.error_text);
  status->error_ch = 0;
  status->src_line = NULL;
  status->tune_data = NULL;
  status->func = NULL;
  status->dummy_funcs = new_dummy_functions ();
  status->main_funcs = NULL;
  newtune_reset_parser (status);
}

/* report an error with where it occurred in the line */
static void report_error_place (parser_status_t * status, char *error_msg)
{
  int min, max;

  min = 0;
  max = strlen(status->src_line) - 1;
  if ((status->error_ch < min) || (status->error_ch > max)) {
    printf("error_ch is outside valid range\n");
    exit(1);
  }
  report_error_ch(status->src_line, status->error_ch,
                  &status->error_obj, error_msg);
}

/* report a warning with where it occurred in the line */
static void report_warning_place(parser_status_t * status, char *warning_msg)
{
  report_warning_ch(status->src_line, status->error_ch,
                  &status->error_obj, warning_msg);
}

/* free up all the memory associated with parser_status_t
 * must also free up any memory associated with the backend
 * in status->tune_data before calling this function
 */
void free_parser_status (parser_status_t * status)
{
  if (status->inputline != NULL) {
    free (status->inputline);
  }
  if (status->dummy_funcs != NULL) {
    free(status->dummy_funcs);
    status->dummy_funcs = NULL;
  }
  if (status->main_funcs != NULL) {
    free(status->main_funcs);
    status->main_funcs = NULL;
  }
  status->func = NULL; /* points at nothing */
  free_text_lines (&status->original_tune);
  free_text_lines (&status->error_obj.error_text);
}

/* when we come to a barline or a change of voice, grace note regions
 * and chord regions cannot continue beyond these points, so report
 * an error.
 */
void parser_checkpoint (parser_status_t * status)
{
  if (status->ingrace) {
    report_error (&status->error_obj, "Grace note section { } not closed");
  }
  if (status->parserinchord) {
    report_error (&status->error_obj, "Chord [ ]  not closed");
  }
  /* reset the variables so that we only report the error once */
  status->ingrace = 0;
  status->parserinchord = 0;
}

/* when we come to the end of a tune, check that all the status
 * variables are in a sensible state and generate an error message
 * if not. We reset the variables at the start of each tune, so
 * we don't reset anything here
 */
void parser_check_tune_completed (parser_status_t * status)
{
  parser_checkpoint (status);
  if (status->slur) {
    report_error (&status->error_obj, "Slur section ( ) or s s not closed");
  }
}

/* read integer from string without advancing character pointer */
int readnumf (parser_status_t * status, const char *num)
{
  int err_id;
  int value;

  value = p_readnumf(num, &err_id);
  switch (err_id) {
    case ERR_MISSING_NUMBER :
      report_error (&status->error_obj, "Missing Number");
      break;
    case ERR_NUMBER_TOO_BIG :
      report_error (&status->error_obj, "Number exceeds allowed maximum");
      break;
    default :
      break;
  }
  return value;
}

/* reads signed integer from string without advancing character pointer */
int readsnumf (parser_status_t * status, const char *s)
{
  int err_id;
  int value;

  value = p_readsnumf(s, &err_id);
  switch (err_id) {
    case ERR_MISSING_NUMBER :
      report_error (&status->error_obj, "Missing Number");
      break;
    case ERR_NUMBER_TOO_BIG :
      report_error (&status->error_obj, "Number exceeds allowed maximum");
      break;
    default :
      break;
  }
  return value;
}

int check_power_of_two(parser_status_t * status, int denom)
{
  int t;
  char error_message[80];

  t = denom;
  while (t > 1) {
    if (t % 2 != 0) {
      snprintf(error_message, 80, "%d b is not a power of 2", denom);
      report_error (&status->error_obj, error_message);
      return 0;
    } else {
      t = t / 2;
    }
  }
  return denom;
}


/* read the numerator of a time signature in M: field
 *
 * abc standard 2.2 allows M:(a + b + c + ...)/d
 * This indicates how note lenths within a bar are to be grouped.
 * abc standard also allows a+b+c/d to mean the same thing but this 
 * goes against the convention that division takes precendence
 * over addition i.e. a+b+c/d normally means a + b + (c/d).
 */
static int read_complex_has_timesig(parser_status_t *status,
                 const char **place, timesig_details_t *timesig)
{
  int n;
  int total;
  int count;
  int has_bracket = 0;

  if (**place == '(') {
    *place = *place + 1;
    has_bracket = 1;
    skipspace(place);
  }
  count = 0;
  total = 0;
  skipspace(place);
  while ((**place != '\0') && (isdigit(**place))) {
    n = readnump(place);
    timesig->complex_values[count] = n;
    total = total + n;
    count = count + 1;
    if (count > 8) {
      report_error(&status->error_obj, "Too many parts to complex time (maximum 8)");
      return 0;
    }
    skipspace(place);
    if (**place == '+') {
      *place = *place + 1;
      skipspace(place);
    }
  }
  if (**place == ')') {
    *place = *place + 1; /* advance over ')' */
    skipspace(place);
    if (!has_bracket) {
      report_warning(&status->error_obj, "Missing ( in complex time");
    }
    has_bracket = 0;
  }
  if (has_bracket) {
    report_warning(&status->error_obj, "Missing ) in complex time");
  }
  /* we have reached the end of the numerator */
  timesig->num_values = count;
  timesig->num = total;
  if (timesig->num_values == 1)
  {
    timesig->type = TIMESIG_NORMAL;
  } else {
    timesig->type = TIMESIG_COMPLEX;
  }
  return 1;
}

/* read time signature (meter) from M: field */
void readsig (parser_status_t * status, const char **sig, timesig_details_t *timesig)
{
  int valid_num;

  if ((strncmp (*sig, "none", 4) == 0) || 
      (strncmp (*sig, "None", 4) == 0)) {
    timesig->num = 4;
    timesig->denom = 4;
    timesig->type = TIMESIG_FREE_METER;
    return;
  }
  /* [SS] 2012-08-08  cut time (C| or c|) is 2/2 not 4/4 */
  if (((**sig == 'C') || (**sig == 'c')) &&
      (*(*sig + 1) == '|')) {
    timesig->num = 2;
    timesig->denom = 2;
    timesig->type = TIMESIG_CUT;
    return;
  }
  if ((**sig == 'C') || (**sig == 'c')) {
    timesig->num = 4;
    timesig->denom = 4;
    timesig->type = TIMESIG_COMMON;
    return;
  }
  valid_num = read_complex_has_timesig(status, sig, timesig);
  if (!valid_num) {
    /* An error message will have been generated by read_complex_has_timesig */
    timesig->num = 4;
    timesig->denom = 4;
    timesig->type = TIMESIG_FREE_METER;
    return;
  }

  if ((int)**sig != '/') {
    report_warning (&status->error_obj, "No / found, assuming denominator of 1");
    timesig->denom = 1;
  } else {
    *sig = *sig + 1;
    skipspace(sig);
    if (!isdigit(**sig)) {
      report_warning (&status->error_obj, "Number not found for M: denominator");
    }
    timesig->denom = readnump (sig);
  }
  if ((timesig->num == 0) || (timesig->denom == 0)) {
    report_error (&status->error_obj, "Expecting fraction in form A/B");
  } else {
    timesig->denom =  check_power_of_two(status, timesig->denom);
  }
}

/* read length part of a note and advance character pointer */
void readlen (parser_status_t * status, int *a, int *b, const char **p)
{
  *a = readnump (p);
  if (*a == 0) {
    *a = 1;
  }
  *b = 1;
  if (**p == '/') {
    *p = *p + 1;
    *b = readnump (p);
    if (*b == 0) {
      *b = 2;
      /* limit the number of '/'s we support */
      while ((**p == '/') && (*b < 1024)) {
        *b = *b * 2;
        *p = *p + 1;
      }
      if (*b >= 1024) {
        report_error (&status->error_obj, "Below minimum note denominator");
      }
    }
  }
  *b = check_power_of_two(status, *b);
}

static void read_L_unitlen(parser_status_t *status, int *num, int *denom, const char **place)
{
  if (!isdigit(**place)) {
    report_warning(&status->error_obj, "No digit at the start of L: field");
  }
  *num = readnump (place);
  if (*num == 0) {
    *num = 1;
  }
  if ((int)**place != '/') {
    report_error (&status->error_obj, "Missing / ");
    *denom = 1;
  } else {
    *place = *place + 1;
    skipspace(place);
    *denom = readnump (place);
  }
  if ((*num == 0) || (*denom == 0)) {
    report_error (&status->error_obj, "Expecting fraction in form A/B");
  } else {
    *denom =  check_power_of_two(status, *denom);
  }
}

/* read length part of a note and advance character pointer */
void read_microtone_value (int *a, int *b, const char **p)
{
  int t;

  *a = readnump (p);
  if (*a == 0) {
    *a = 1;
  }
  *b = 1;
  if (**p == '/') {
    *p = *p + 1;
    *b = readnump (p);
    if (*b == 0) {
      *b = 2;
      while (**p == '/') {
        *b = *b * 2;
        *p = *p + 1;
      }
    }

  }
  t = *b;
  while (t > 1) {
    if (t % 2 != 0) {
      /*event_parsing_warning (&status->error_obj, "divisor not a power of 2"); */
      t = 1;
    } else {
      t = t / 2;
    }
  }
}

int ismicrotone (parser_status_t * status, const char **p, int dir)
{
  int a, b;

  read_microtone_value (&a, &b, p);
  if (b != 1) {
    status->func->microtone (status, dir, a, b);
    return 1;
  }
  status->setmicrotone.num = 0;
  status->setmicrotone.denom = 0;
  return 0;
}

/* part of K: parsing - looks for a clef in K: field                 */
/* format is K:string where string is treble, bass, baritone, tenor, */
/* alto, mezzo, soprano or K:clef=arbitrary                          */
int isclef (parser_status_t * status, char *s, cleftype_t * new_clef,
            int *gotoctave, int *octave, int expect_clef)
{
  int gotclef;

  gotclef = 0;
  new_clef->octave_offset = 0;
  gotclef = get_standard_clef (s, new_clef);
  if (!gotclef && expect_clef) {
    /* do we have a clef in letter format ? e.g. C1, F3, G3 */
    gotclef = get_other_clef_details (s, new_clef);
    if (new_clef->basic_clef == basic_clef_none) {
      report_warning (&status->error_obj,
                      "Found clef=none, but a clef is required. Ignoring");
      gotclef = 0;
    }
  }
  if (expect_clef && !gotclef) {
    char error_message[80];

    snprintf (error_message, 80, "clef %s not recognized", s);
    report_warning (&status->error_obj, error_message);
  }
  return (gotclef);
}

/* part of parsekey, extracts word from input line */
/* besides the space, the symbols _, ^, and = are used */
/* as separators in order to handle key signature modifiers. */
/* [SS] 2010-05-24 */
const char *readword (char word[], const char *s)
{
  const char *p;
  int i;

  p = s;
  i = 0;
  /* [SS] 2015-04-08 */
  while ((*p != '\0') && (*p != ' ') && (*p != '\t') && ((i == 0) ||
                                                         ((*p != '=')))) {
    if (i > 1 && *p == '^')
      break;                    /* allow for double sharps and flats */
    if (i > 1 && *p == '_')
      break;
    if (i < 29) {
      word[i] = *p;
      i = i + 1;
    }
    p = p + 1;
  }

  word[i] = '\0';
  return (p);
}

/* convert word to lower case */
void lcase (char *s)
{
  char *p;

  p = s;
  while (*p != '\0') {
    if (isupper (*p)) {
      *p = *p + 'a' - 'A';
    }
    p = p + 1;
  }

}

void print_num_voices (parser_status_t * status)
{
  int i;
  if (status->num_voices == 0) {
    return;
  }
  printf ("voice mapping:\n");
  for (i = 0; i < status->num_voices; i++) {
    if (i % 4 == 3) {
      printf ("\n");
    }
    printf ("%s  %d   ", status->voice_state[i].name, i + 1);
  }
  printf ("\n");
}

int interpret_voice_label (parser_status_t * status, const char *s, int num, int *is_new)
/* We expect a numeric value indicating the voice number.
 * The assumption is that these will ocuur in the order in which voices
 * appear, so that we have V:1, V:2, ... V:N if there are N voices.
 * The abc standard 2.2 allows strings instead of these numbers to
 * represent voices.
 * This function should be called with either
 * an empty string and a valid num or
 * a valid string and num set to 0.
 *
 * If num is non-zero, we check that it is valid and return it.
 * If the number is one above the number of voices currently in use,
 * we allocate a new voice.
 *
 * If num is zero and the string is not empty, we check if string
 * has been assigned to one of the existing voices. If not, we
 * allocate a new voice and assign the string to it.
 *
 * If we exceed MAX_VOICES voices, we report an error.
 *
 * we return a voice number in the range 1 - status->num_voices
*/
{
  int i;
  char code[32];
  char msg[80];                 /* [PHDM] 2012-11-22 */
  const char *c;
  c = readword (code, s);

  if (num > 0) {
    /* we have a numeric voice number */
    if (num > status->num_voices + 1) {
      char error_message[80];

      /* allocate the next available new voice */
      snprintf (error_message, 80, "V:%d out of sequence, treating as V:%d",
                num, status->num_voices);
      report_warning (&status->error_obj, error_message);
      num = status->num_voices + 1;
    }
    /* declaring a new voice */
    if (num == status->num_voices + 1) {
      *is_new = 1;
      if (status->num_voices >= MAX_VOICES) {
        report_warning (&status->error_obj,
                        "Number of available voices exceeded");
        return 1;
      }
      status->num_voices = status->num_voices + 1;
      status->voice_state[status->num_voices - 1].name[0] = '\0';
    } else {
      /* we are using a previously declared voice */
      *is_new = 0;
    }
    return num;
  }
/* [PHDM] 2012-11-22 */
  if (*c != '\0' && *c != ' ' && *c != ']') {
    sprintf (msg, "invalid character `%c' in Voice ID", *c);
    report_error (&status->error_obj, msg);
  }
/* [PHDM] 2012-11-22 */

  if (code[0] == '\0') {
    report_warning (&status->error_obj, "Empty V: field, treating as V:1");
    *is_new = 0;
    return 1;
  }
  /* Has supplied name been used for one of the existing voices ? */
  if (status->has_voice_fields) {
    for (i = 0; i < status->num_voices; i++) {
      /* abc standard 2.2 says only the first 20 characters are significant */
      if (strncmp (code, status->voice_state[i].name, 20) == 0) {
        *is_new = 0;
        return i + 1;
      }
    }
  }
  /* if we have got here, we have a new voice */
  if ((status->num_voices + 1) > MAX_VOICES) { /* [SS] 2015-03-16 */
    report_error (&status->error_obj, "Number of available voices exceeded");
    return 1;
  }
  /* First V: field is a special case. We are already on voice 1,
   * so we don't increment the number of voices, but we will set
   * status->has_voice_fields on returning from this function.
   */
  if (status->has_voice_fields) {
    *is_new = 1;
    status->num_voices++;
  } else {
    *is_new = 0; /* we have already started as voice 1 */
  }
  /* abc standard 2.2 says only the first 20 characters are significant */
  strncpy (status->voice_state[status->num_voices - 1].name, code, 20);
  status->voice_state[status->num_voices - 1].name[20] = '\0';
  return status->num_voices;
}

/* The following three functions parseclefs, parsetranspose,
 * parseoctave are used to parse the K: field which not
 * only specifies the key signature but also other descriptors
 * used for producing a midi file or postscript file.
 *
 * The char* word contains the particular token that
 * is being interpreted. If the token can be understood,
 * other parameters are extracted from char ** s and
 * s is advanced to point to the next token.
 */

/* extracts string clef= something */
int parseclef (parser_status_t * status, const char **s, char *word, int *gotclef,
               char *clefstr, cleftype_t * newclef, int *gotoctave, int *octave)
{
  int successful;
  skipspace (s);
  *s = readword (word, *s);
  successful = 0;
  if (strcasecmp (word, "clef") == 0) {
    skipspace (s);
    if (**s != '=') {
      report_error (&status->error_obj, "clef must be followed by '='");
    } else {
      *s = *s + 1;
      skipspace (s);
      *s = readword (clefstr, *s);
      /* we found clef=, so we expect this to be followed by a clef */
      if (isclef (status, clefstr, newclef, gotoctave, octave, 1)) {
        *gotclef = 1;
      }
    }
    successful = 1;
  } else if (isclef (status, word, newclef, gotoctave, octave, 0)) {
    /* look for a clef, but we didn't see clef=, so there might not be one */
    *gotclef = 1;
    strcpy (clefstr, word);
    successful = 1;
  }

  return successful;
}



/* parses string transpose= number */
int parsetranspose (parser_status_t * status, const char **s, char *word,
                    int *gottranspose, int *transpose)
{
  if (strcasecmp (word, "transpose") != 0)
    return 0;
  skipspace (s);
  if (**s != '=') {
    report_error (&status->error_obj, "transpose must be followed by '='");
  } else {
    *s = *s + 1;
    skipspace (s);
    *transpose = readsnump (s);
    *gottranspose = 1;
  }
  return 1;
}

/* parses string octave= number */
int parseoctave (parser_status_t * status, const char **s, char *word, int *gotoctave,
                 int *octave)
{
  if (strcasecmp (word, "octave") != 0)
    return 0;
  skipspace (s);
  if (**s != '=') {
    report_error (&status->error_obj, "octave must be followed by '='");
  } else {
    *s = *s + 1;
    skipspace (s);
    *octave = readsnump (s);
    *gotoctave = 1;
  }
  return 1;
}

/* parse a string contained in quotes.
 * strings may contain the close quote character because
 * x umlaut is encoded as \"x, which complicates parsing.
 * this is an unfortunate feature of the abc syntax.
 *
 * on entry, start points to the opening double quote.
 * returns pointer to last character before closing quote.
 */
const char *umlaut_get_buffer(const char *start, char *buffer, int bufferlen)
{
  const char *p;
  int last_ch;
  int i;

  p = start;
  i = 0;
  last_ch = ' ';
  while ((*p != '\0') &&
         !((*p == '"') && (last_ch != '\\'))) {
    if (i < bufferlen - 2) {
      buffer[i] = *p;
      i = i + 1;
    }
    last_ch = *p;
    p = p + 1;
  }
  buffer[i] = '\0';
  return p;
}

/* construct string using vstring */
const char *umlaut_build_string(const char *start, struct vstring *gchord)
{
  int lastch = ' ';
  const char *p;

  p = start;
  //initvstring (&gchord);
  /* need to allow umlaut sequence in guitar chords.
   * e.g. \"a, \"u
   */
  while (!((*p == '\0') ||
          ((*p == '"') && (lastch != '\\')))) {
    vstring_addch( gchord, *p);
    lastch = *p;
    p = p + 1;
  }
  //printf("umlaut_build_string has >%s<\n", gchord->st);
  return p;
}

/* parses name="string" in V: command
   for compatability of abc2abc with abcm2ps
   used for both name="..." and sname="..."
*/
int parsename (parser_status_t * status, const char **s, int *gotname,
           char *namestring, int maxsize)
{
  int i;

  i = 0;
  skipspace (s);
  if (**s != '=') {
    report_error (&status->error_obj, "name must be followed by '='");
  } else {
    *s = *s + 1;
    skipspace (s);
    if (**s == '"') {           /* string enclosed in double quotes */
      namestring[i] = (char)**s;
      *s = *s + 1;
      *s = umlaut_get_buffer(*s, &namestring[1], maxsize-1);
      *s = *s + 1; /* skip over closing double quote */
      strcat(namestring, "\"");
    } else {                    /* string not enclosed in double quotes */
      while (i < maxsize && **s != ' ' && **s != '\0') {
        namestring[i] = (char)**s;
        *s = *s + 1;
        i++;
      }
      namestring[i] = '\0';
    }
    *gotname = 1;
  }
  return 1;
}

/* parse string middle=X in V: command
 for abcm2ps compatibility
*/
int
parsemiddle (parser_status_t * status, const char **s, char *word, int *gotmiddle,
             char middlestring[], int maxsize)
{
  int i;
  i = 0;
  if (strcasecmp (word, "middle") != 0)
    return 0;
  skipspace (s);
  if (**s != '=') {
    report_error (&status->error_obj, "middle must be followed by '='");
  } else {
    *s = *s + 1;
    skipspace (s);
/* we really ought to check the we have a proper note name; for now, just copy non-space
characters */
    while (i < maxsize && **s != ' ' && **s != '\0') {
      middlestring[i] = (char)**s;
      *s = *s + 1;
      ++i;
    }
    middlestring[i] = '\0';
    *gotmiddle = 1;
  }

  return 1;
}


/* parses any left overs in V: command (eg. stafflines=1) */
/* [SS] 2011-04-18 */
int parseother (const char **s, char *word, int *gotother, char other[], int maxsize)
{
  if (word[0] != '\0') {
    if ((int)strlen (other) < maxsize) /* [SS] 2015-10-08 added (int) */
      strncat (other, word, maxsize);
    if (**s == '=') {           /* [SS] 2011-04-19 */
      *s = readword (word, *s);
      if ((int)strlen (other) < maxsize) /* [SS] 2015-10-08 added (int) */
        strncat (other, word, maxsize);
    }
    strncat (other, " ", maxsize); /* in case other codes follow */
    *gotother = 1;
    return 1;
  }

  return 0;
}

/* code from Seymour Shlien to handle microtones in key signature */
/* not working yet ! */
static void process_microtones (parser_status_t * status,
                                int *parsed, char word[],
                                char modmap[], int modmul[],
                                struct fract modmicrotone[])
{
  int success;
  int a, b;                     /* for microtones [SS] 2014-01-06 */
  char c;
  int j;

  /* shortcuts such as ^/4G instead of ^1/4G not allowed here */
  success = sscanf (&word[1], "%d/%d%c", &a, &b, &c);
  if (success == 3) {           /* [SS] 2016-04-10 */
    *parsed = 1;
    j = (int)c - 'A';
    if (j > 7) {
      j = (int)c - 'a';
    }
    if (j > 7 || j < 0) {
      report_error (&status->error_obj, "Not a valid microtone");
      return;
    }
    if (word[0] == '_')
      a = -a;
    /* printf("%s fraction microtone  %d/%d for %c\n",word,a,b,c); */
  } else {
    success = sscanf (&word[1], "%d%c", &a, &c); /* [SS] 2020-06-25 */
    if (success == 2) {
      b = 0;
      /* printf("%s integer microtone %d%c\n",word,a,c); */
      if (status->temperament != 1) { /* [SS] 2020-06-25 2020-07-05 */
        report_error (&status->error_obj,
                      "do not use integer microtone without calling %%MIDI temperamentequal");
      }
      *parsed = 1;
    }
  }
  /* if (parsed ==1)  [SS] 2020-09-30 */
  if (success > 0) {
    j = (int)c - 'A';
    if (j > 7) {
      j = (int)c - 'a';
    }
    if (j > 7 || j < 0) {
      report_error (&status->error_obj, "Not a valid microtone");
      return;
    }
    if (word[0] == '_') {
      a = -a;
    }
    modmap[j] = word[0];
    modmicrotone[j].num = a;
    modmicrotone[j].denom = b;
    /* printf("%c microtone = %d/%d\n",modmap[j],modmicrotone[j].num,modmicrotone[j].denom); */
  }
}

int findmode (char *modestr, int *sf, int *modeindex)
{
  music_mode_t newmode;
  if (strcmp(modestr, "m") == 0) {
    *modeindex = mode_m;
    *sf = *sf + get_sfshift_for_mode(mode_m);
    return 1;
  }
  newmode = get_music_mode(modestr);
  if (newmode == mode_unknown) {
    return 0;
  }
  if (newmode == mode_exp) {
    /* abc 2.2 standard has "exp" mode where accidentals
     * are specified explicitly and the base note A-G#
     * specifies the tonic for the scale, not a key
     * signature to be modified
     */
    *sf = 0;
    *modeindex = newmode;
    return 1;
  } else {
    /* we have one of the normal modes */
    *sf = *sf + get_sfshift_for_mode(newmode);
    *modeindex = newmode;
    return 1;
  }
}

/* parse contents of K: field */
/* this works by picking up a strings and trying to parse them */
/* returns 1 if valid key signature found, 0 otherwise */
int parsekey (parser_status_t * status, const char *str)
{
  const char *s;
  char word[30];
  int parsed;
  int modnotes;                 /* [SS] 2010-07-29 */
  int foundmode;
  char root[3];
  char modestr[30];
  char msg[80];
  const char *moveon;
  int sf = -1;
  char modmap[7];
  int modmul[7];
  struct fract modmicrotone[7];
  int i, j;
  int cgotoctave, coctave;
  int modeindex;
  struct key_params params;

  /* initialize key params */
  params.gotkey = 0;
  params.gotclef = 0;
  params.clefname[0] = '\0';
  //params.new_clef = NULL;
  init_new_clef (&params.new_clef);
  params.gotoctave = 0;
  params.octave = 0;
  params.gottranspose = 0;
  params.transpose = 0;
  params.explicit_accidentals = 0;
  /* end of initialization */

  params.clefname[0] = (char)0;
  modestr[0] = (char)0;
  s = str;
  cgotoctave = 0;
  coctave = 0;
  /* default modeindex to empty string, treated as major */
  modeindex = MODE_DEFAULT_MAJOR;
  modnotes = 0;
  for (i = 0; i < 7; i++) {
    modmap[i] = ' ';
    modmul[i] = 1;
    modmicrotone[i].num = 0;    /* [SS] 2014-01-06 */
    modmicrotone[i].denom = 0;
  }
  word[0] = '\0';               /* in case of empty string [SDG] 2020-06-04 */
  parsed = 0;
  while (*s != '\0') {
    parsed =
      parseclef (status, &s, word, &params.gotclef, params.clefname, &params.new_clef, &cgotoctave,
                 &coctave);
    if (parsed) {
      if (status->state == INHEAD)
      {
        /* clef is master clef to initialize all voices */
        copy_clef (&status->master_clef, &params.new_clef);
      }
      if (status->state == INBODY) {
        /* make clef an attribute of current voice */
        copy_clef (&status->voice_state[status->voicenum - 1].clef, &params.new_clef);
      }
    }
    /* parseclef also scans the s string using readword(), placing */
    /* the next token  into the char array word[].                   */
    if (!parsed)
      parsed = parsetranspose (status, &s, word, &params.gottranspose, &params.transpose);

    if (!parsed) {
      parsed = parseoctave (status, &s, word, &params.gotoctave, &params.octave);
    }

    if ((parsed == 0) && (strcasecmp (word, "Hp") == 0)) {
      sf = 2;
      params.gotkey = 1;
      parsed = 1;
    }

    if ((parsed == 0) && (strcasecmp (word, "none") == 0)) {
      params.gotkey = 1;
      parsed = 1;
      sf = 0;
    }

    if (strcasecmp (word, "exp") == 0) {
      params.explicit_accidentals = 1;
      parsed = 1;
    }

/* if K: not 'none', 'Hp' or 'exp' then look for key signature
 * like Cmaj Amin Ddor ...
 * The key signature is expressed by sf which indicates the
 * number of sharps (if positive) or flats (if negative)       */

    if ((parsed == 0) && ((word[0] >= 'A') && (word[0] <= 'G'))) {
      params.gotkey = 1;
      parsed = 1;
      root[0] = word[0];
      if ((word[1] == '#') || (word[1] == 'b')) {
        root[1] = word[1];
        root[2] = '\0';
      } else {
        root[1] = '\0';
      }
      /* parse key itself */
      sf = get_sf_for_root(root);
      j = strlen(root);
      foundmode = 0;
      if ((int)strlen (word) == j) {
        /* word is just the root note, see if there is space
         * followed by a mode */
        skipspace (&s);
        moveon = readword (modestr, s);
        lcase (modestr);
        foundmode = findmode (modestr, &sf, &modeindex);
        if (foundmode) {
          s = moveon;
        } else {
          modestr[0] = '\0';
        }
      } else {
        /* look for mode after root note with no intervening space */
        strcpy (modestr, &word[j]);
        lcase (modestr);
        foundmode = findmode (modestr, &sf, &modeindex);
        if (!foundmode) {
          sprintf (msg, "Unknown mode '%s'", &word[j]);
          report_error (&status->error_obj, msg);
          modeindex = 0;
        }
      }
    }
    if (params.gotkey) {
      if (sf > 7) {
        report_warning (&status->error_obj, "Unusual key representation");
        sf = sf - 12;
      }
      if (sf < -7) {
        report_warning (&status->error_obj, "Unusual key representation");
        sf = sf + 12;
      }
    }


    /* look for key signature modifiers
     * For example K:D _B
     * which will include a Bb in the D major key signature
     *                                                      */

    if ((word[0] == '^') || (word[0] == '_') || (word[0] == '=')) {
      modnotes = 1;
      if ((strlen (word) == 2) && (word[1] >= 'a') && (word[1] <= 'g')) {
        j = (int)word[1] - 'a';
        modmap[j] = word[0];
        modmul[j] = 1;
        parsed = 1;
      } else {                  /*double sharp or double flat */
        if ((strlen (word) == 3) && (word[0] != '=')
            && (word[0] == word[1]) && (word[2] >= 'a')
            && (word[2] <= 'g')) {
          j = (int)word[2] - 'a';
          modmap[j] = word[0];
          modmul[j] = 2;
          parsed = 1;
        }
      }
    }


/*   if (explicit_accidentals)  for compatibility with abcm2ps 2010-05-08  2010-05-20 */
    if ((word[0] == '^') || (word[0] == '_') || (word[0] == '=')) {
      modnotes = 1;
      if ((strlen (word) == 2) && (word[1] >= 'A') && (word[1] <= 'G')) {
        j = (int)word[1] - 'A';
        modmap[j] = word[0];
        modmul[j] = 1;
        parsed = 1;
      } else if                 /*double sharp or double flat */
        ((strlen (word) == 3) && (word[0] != '=') && (word[0] == word[1])
         && (word[2] >= 'A') && (word[2] <= 'G')) {
        j = (int)word[2] - 'A';
        modmap[j] = word[0];
        modmul[j] = 2;
        parsed = 1;
      }
    }
    /* microtone? */
    /* shortcuts such as ^/4G instead of ^1/4G not allowed here */
    /* parsed =0; [SS] 2020-09-30 */
    process_microtones (status, &parsed, word, modmap, modmul, modmicrotone);
  }
  if ((parsed == 0) && (strlen (word) > 0)) {
    sprintf (msg, "Ignoring string '%s' in K: field", word);
    report_warning (&status->error_obj, msg);
  }
  if (cgotoctave) {
    params.gotoctave = 1;
    params.octave = coctave;
  }
  if (modnotes & !params.gotkey) {     /*[SS] 2010-07-29 for explicit key signature */
    sf = 0;
    params.explicit_accidentals = 1;                /* [SS] 2010-07-29 */
  }
  status->func->key (status, sf, str, modeindex, modestr, modmap, modmul, modmicrotone,
                     &params);
  return (params.gotkey);
}

/* when we encounter a new V: field, set up the properties of the new
 * voice from the master values set in in the tune header.
 */
static void set_voice_from_master(parser_status_t *status, int voice_num)
{
  voice_context_t *current_voice;

  current_voice = &status->voice_state[voice_num - 1];
  copy_timesig(&current_voice->timesig, &status->master_timesig);
  copy_clef(&current_voice->clef, &status->master_clef);
  current_voice->unitlen = status->master_unitlen;
  current_voice->barno = 1;
}

void parsevoice (parser_status_t * status, const char *s)
{
  voice_context_t *current_voice;
  int num;                      /* voice number */
  struct voice_params vparams;
  char word[64];                /* 2017-10-11 */
  int parsed;
  int coctave, cgotoctave;
  int is_new = 0;
 
  current_voice = &status->voice_state[status->voicenum - 1];
  vparams.transpose = 0;
  vparams.gottranspose = 0;
  vparams.octave = 0;
  vparams.gotoctave = 0;
  vparams.gotclef = 0;
  cgotoctave = 0;
  coctave = 0;
  vparams.gotname = 0;
  vparams.gotsname = 0;
  vparams.gotmiddle = 0;
  vparams.gotother = 0;         /* [SS] 2011-04-18 */
  vparams.other[0] = '\0';      /* [SS] 2011-04-18 */

  init_new_clef (&vparams.new_clef);

  skipspace (&s);
  num = 0;
  if (isdigit (*s)) {
    num = readnump (&s);
  }
  /* do sanity check to make sure we are switching voice at a good point */
  if ((status->master_timesig.type != TIMESIG_FREE_METER) &&
      (current_voice->barcount.num != 0))
  {
    //report_warning(&status->error_obj,
    // "Switching voice in mid-bar not supported");
    current_voice->barcount.num = 0;
    current_voice->barcount.denom = 1;
  }
  num = interpret_voice_label (status, s, num, &is_new);
  if (is_new) {
    /* declaring voice for the first time.
     * initialize with values set in the tune header */
    set_voice_from_master(status, num);
  }
  status->has_voice_fields = 1;
  skiptospace (&s);
  status->voicenum = num;
  skipspace (&s);
  while (*s != '\0') {
    parsed =
      parseclef (status, &s, word, &vparams.gotclef, vparams.clefname,
                 &vparams.new_clef, &cgotoctave, &coctave);
    if (vparams.gotclef) {
      /* make clef an attribute of current voice */
      copy_clef (&status->voice_state[num - 1].clef, &vparams.new_clef);
    }
    if (!parsed) {
      parsed =
        parsetranspose (status, &s, word, &vparams.gottranspose,
                        &vparams.transpose);
    }
    if (!parsed) {
      parsed =
        parseoctave (status, &s, word, &vparams.gotoctave, &vparams.octave);
    }
    if ((!parsed) && (strcasecmp (word, "name") == 0)) {
      parsed =
        parsename (status, &s, &vparams.gotname, &vparams.namestring[0],
                   V_STRLEN);
    }
    if ((!parsed) && (strcasecmp (word, "sname") == 0)) {
      parsed =
        parsename (status, &s, &vparams.gotsname, &vparams.snamestring[0],
                    V_STRLEN);
    }
    if (!parsed) {
      parsed =
        parsemiddle (status, &s, word, &vparams.gotmiddle, vparams.middlestring,
                     V_STRLEN);
    }
    if (!parsed) {
      parsed = parseother (&s, word, &vparams.gotother, vparams.other, V_STRLEN); /* [SS] 2011-04-18 */
    }
  }
  /* [SS] 2015-05-13 allow octave= to change the clef= octave setting */
  /* cgotoctave may be set to 1 by a clef=. vparams.gotoctave is set  */
  /* by octave= */

  if (cgotoctave && vparams.gotoctave == 0) {
    vparams.gotoctave = 1;
    vparams.octave = coctave;
  }
  status->func->voice (status, num, s, &vparams);

}

/* given a string naming a decoration, return the enumerated type
 * value for that decoration
 */
static decoration_type_t identify_str_decoration (char *str)
{
  int i;

  if (str == NULL) {
    return DEC_UNKNOWN;
  }
  for (i = 0; i < NUM_DECORATIONS; i++) {
    if (strcmp (decorators_table[i].name, str) == 0) {
      return decorators_table[i].value;
    }
  }
  return DEC_UNKNOWN;
}


/* add another decoration to the set of decorations to be applied to the
 * next note.
 * string should either be NULL or have had space malloc'ed for it by
 * the calling function.
 */
static void add_decoration (parser_status_t *status, decoration_type_t dec, char ch, char *string)
{
  int i;
  decoration_context_t *dec_context = &status->dec_context;

  if ((dec == DEC_UNKNOWN) && (string == NULL)) {
    return;
  }
  if (dec_context->num_decorations >= MAX_DECORATIONS) {
    report_error (&status->error_obj, "Maximum number of decorations exceeded");
    return;
  }
  /* check for repeated decorations ignoring specials */
  if ((dec != DEC_UNKNOWN) && (dec != DEC_TEXT)) {
    for (i = 0; i < dec_context->num_decorations; i++) {
      if (dec_context->decorations_to_apply[i].type == dec) {
        DEBUG (printf ("Decoration %d repeated\n", dec);)
        DEBUG (printf ("DEC_PART = %d\n", (int)DEC_PART);)
        if (dec == DEC_PART) {
          report_error_place (status,
                        "Applying more than one Part label here");
        } else {
          report_error_place (status,
                        "Applying the same decoration type more than once");
        }
        return;
      }
    }
  }
  dec_context->decorations_to_apply[dec_context->num_decorations].type = dec;
  dec_context->decorations_to_apply[dec_context->num_decorations].abbrev = ch;
  dec_context->decorations_to_apply[dec_context->num_decorations].str = string;
  dec_context->num_decorations = dec_context->num_decorations + 1;
}

/* convert a single character into an index to be used on the abbreviations
 * array
 */
int abbrev_index(char ch)
{
  if ((ch >= 'H') && (ch <= 'W')) {
    return ch - 'H';
  }
  if ((ch >= 'h') && (ch <= 'w')) {
    return ch - 'h' + ('W' - 'H' + 1);
  }
  if (ch == '~') {
    return SIZE_ABBREVIATIONS - 1;
  }
  return -1; /* not a valid character to use */
}

/* when a U: field is encountered, update the value in the
 * table of abbreviations
 */
void record_abbreviation (parser_status_t *status, char symbol, char *string, char container)
{
  int index;

  /* if ((symbol < 'H') || (symbol > 'Z')) [SS] 2016-09-20 */
  index = abbrev_index(symbol);
  if (index == -1) {
    return; /* invalid */
  }
  if (status->abbreviation[index].string != NULL) {
    char warning_msg[80];

    snprintf(warning_msg, 80, "U: redefining %c", symbol);
    report_warning (&status->error_obj, warning_msg);
    free (status->abbreviation[index].string);
  }
  status->abbreviation[index].string = strdup(string);
  if (container == '!') {
    /* standard decoration enclosed in ! ! */
    decoration_type_t type;

    type = identify_str_decoration(string);
    status->abbreviation[index].type = type;
  } else {
    /* must be a string in " " 
     * we now call char_gchord() instead of doing this.
     */
    status->abbreviation[index].type = DEC_TEXT;
  }
}

char *lookup_abbreviation (abbreviation_t abbreviation[], char symbol, decoration_type_t *dec)
/* return string which s abbreviates */
{
  int index;

  index = abbrev_index(symbol);
  if (index == -1) {
    *dec = DEC_UNKNOWN;
    return NULL; /* invalid */
  } else {
    *dec = abbreviation[index].type;
    return (abbreviation[index].string);
  }
}

void free_abbreviations (abbreviation_t abbreviation[])
/* free up any space taken by abbreviations */
{
  int i;

  for (i = 0; i < SIZE_ABBREVIATIONS; i++) {
    if (abbreviation[i].string != NULL) {
      free (abbreviation[i].string);
      abbreviation[i].string = NULL;
    }
  }
}

static void parser_chordon(parser_status_t *status, char open_char)
{
  status->func->chordon (status, open_char);
  status->parserinchord = 1;
  status->notesinchord = 0;
}

static void parser_chordoff(parser_status_t * status, int chord_n, int chord_m,
  char close_char)
{
  status->func->chordoff (status, chord_n, chord_m, close_char);
  status->parserinchord = 0;
  /* do addunits here */
  if (status->notesinchord > 0) {     /* do not count empty chord */
    addunits (status,
              chord_n * status->chord_len1.num,
              chord_m * status->chord_len1.denom);
  }
  status->chord_len1.num = 0;
  status->chord_len1.denom = 1;
  if (status->tuplenotes > 0) {
    status->tuplenotes = status->tuplenotes - 1;
  }
  if (status->notesinchord == 0) {
    report_error (&status->error_obj, "No notes in chord");
  }
  status->notesinchord = 0;
}

static void parser_rest(parser_status_t *status, int n, int m, int x_flag)
{
  if (status->parserinchord) {
    report_warning(&status->error_obj, "rest within a chord ignored");
  }
  else
  {
    status->func->rest (status, &status->dec_context,
                      n, m, x_flag);
    addunits (status, n, m);
    if ((status->tuplenotes > 0) && (!status->parserinchord)) {
      /* do we count a rest as part of a tuple ? standard implies no.
       * One would not normally notate a rest as part of a tuple.
       */
      status->tuplenotes = status->tuplenotes - 1;
    }
    free_decorations(&status->dec_context);
  }
}

/* a gchord has been encountered in the abc. Extract the string with
 * a check for umlauts and then call gchord().
 * return a pointer into the line being processed at the end of
 * the gchord.
 */
const char * process_gchord(parser_status_t *status, const char *field, const char *place)
{
  struct vstring gchord;
  char pos;
  const char *p;

  p = place + 1;
  if (strchr("^_<>@", *p) != NULL) {
    pos = *p;
    p = p + 1;
  } else {
    pos = ' ';
  }
  initvstring (&gchord);
  /* need to allow umlaut sequence in "guitar chords" which
   * are being used for arbitrary text e.g. "_last time"
   */
  p = umlaut_build_string(p, &gchord);
  if (*p == '\0') {
    report_error_ch (field, (int)(p-field), &status->error_obj,
                  "Guitar chord name not properly closed");
  } else {
    p = p + 1;
  }
  status->func->gchord (status, pos, gchord.st);
  freevstring (&gchord);
  return p;
}

/* parse abc note and advance character pointer */
void parsenote (parser_status_t * status, const char **s)
{
  int U_index;
  char *abbr_string;
  
  int mult;
  char accidental, note;
  int octave, n, m;
  char msg[80];
  int microtone;

  mult = 1;
  microtone = 0;
  accidental = ' ';
  note = ' ';
  U_index = abbrev_index(**s);
  while (((**s != '\0') && (U_index != -1)) ||
         (**s == '.')) {
    /* . indicates staccato. The 2.2 standard does not allow this to be
     * redefined. This is an anomoly because all the other single character
     * decorations may be redefined.
     */
    if (**s == '.') {
      /* handle . separately */
      add_decoration (status, DEC_STACCATO, '.', NULL);
      status->func->char_decoration (status, '.');
    } else {
      decoration_type_t dec;

      abbr_string = lookup_abbreviation(status->abbreviation, **s, &dec);
      if (dec == DEC_TEXT) {
        /* redefined symbol is actually a text string */
        if (abbr_string != NULL) {
          status->func->char_gchord(status, **s);
        }
      } else {
        if (abbr_string != NULL) {
          add_decoration (status, dec, **s, NULL);
        } else {
          add_decoration (status, DEC_UNKNOWN, **s, NULL);
        }
        status->func->char_decoration (status, **s);
      }
    }
    *s = *s + 1;
    if (**s != '\0') {
      /* look for next decoration */
      U_index = abbrev_index(**s);
    }
  }
  /*check for decorated chord */
  if (**s == '[') {
    report_warning_place (status,
                    "single character decoration applied to chord");
    parser_chordon(status, '[');
    *s = *s + 1;
    skipspace (s);
  }

/* [SS] 2011-12-08 to catch fermata H followed by a rest */

  if (**s == 'z') {
    *s = *s + 1;
    readlen (status, &n, &m, s);
    parser_rest(status, n, m, 0);
    return;
  }
  if (**s == 'x') {
    *s = *s + 1;
    readlen (status, &n, &m, s);
    parser_rest(status, n, m, 1);
    return;
  }

  /* read accidental */
  switch (**s) {
    case '_':
      accidental = **s;
      *s = *s + 1;
      if (**s == '_') {
        *s = *s + 1;
        mult = 2;
      }
      microtone = ismicrotone (status, s, -1);
      if (microtone) {
        if (mult == 2)
          mult = 1;
        else
          accidental = ' ';
      }
      break;
    case '^':
      accidental = **s;
      *s = *s + 1;
      if (**s == '^') {
        *s = *s + 1;
        mult = 2;
      }
      microtone = ismicrotone (status, s, 1);
      if (microtone) {
        if (mult == 2)
          mult = 1;
        else
          accidental = ' ';
      }

      break;
    case '=':
      accidental = **s;
      *s = *s + 1;
      if (**s == '^') {
        accidental = **s;
        *s = *s + 1;
        microtone = ismicrotone (status, s, 1);
        if (microtone == 0)
          accidental = '^';
      } else if (**s == '_') {
        accidental = **s;
        *s = *s + 1;
        microtone = ismicrotone (status, s, -1);
        if (microtone == 0)
          accidental = '_';
      }
      break;
    default:
      microtone = ismicrotone (status, s, 1); /* [SS] 2014-01-19 */
      break;
  }
  if ((**s >= 'a') && (**s <= 'g')) {
    note = **s;
    octave = 1;
    *s = *s + 1;
    while ((**s == '\'') || (**s == ',')) {
      if (**s == '\'') {
        octave = octave + 1;
        *s = *s + 1;
      }
      if (**s == ',') {
        sprintf (msg, "Bad pitch specifier , after note %c", note);
        report_error_place (status, msg);
        octave = octave - 1;
        *s = *s + 1;
      }
    }
  } else {
    octave = 0;
    if ((**s >= 'A') && (**s <= 'G')) {
      note = **s + 'a' - 'A';
      *s = *s + 1;
      while ((**s == '\'') || (**s == ',')) {
        if (**s == ',') {
          octave = octave - 1;
          *s = *s + 1;
        }
        if (**s == '\'') {
          sprintf (msg, "Bad pitch specifier ' after note %c",
                   note + 'A' - 'a');
          report_error_place (status, msg);
          octave = octave + 1;
          *s = *s + 1;
        }
      }
    }
  }
  if (note == ' ') {
    report_error_place (status, "Malformed note : expecting a-g or A-G");
  } else {
    readlen (status, &n, &m, s);
    status->func->note (status,
                        &status->dec_context,
                        &status->voice_state[status->voicenum - 1].clef,
                        accidental, mult, note, octave, n, m);
    addunits (status, n, m);
    if (status->parserinchord) {
      status->notesinchord = status->notesinchord + 1;
      if (status->notesinchord == 1) {
        status->chord_len1.num = n;
        status->chord_len1.denom = m;
      }
    }
    /* remove pending decorations once we have applied them to a note */
    free_decorations(&status->dec_context);
    if (!microtone) {
      status->func->normal_tone (status); /* [SS] 2014-01-09 */
    }
    /* event for note end. This is used by abc2abc to decide
     * whether to introduce new spacing.
     * This is called with new barcount fraction but old tuplenotes so
     * that it knows whether it is a good place to put a space
     * and also if it is in a tuple.
     */
    status->func->note_end(status);
    if ((status->tuplenotes > 0) && (!status->parserinchord)) {
      status->tuplenotes = status->tuplenotes - 1;
    }
  }
}

const char *getrep (parser_status_t * status, const char *p, char *out)
/* look for number or list following [ | or :| */
{
  const char *q;
  int digits;
  int done;
  int count;

  q = p;
  count = 0;
  done = 0;
  digits = 0;
  while (!done) {
    if (isdigit (*q)) {
      out[count] = *q;
      count = count + 1;
      q = q + 1;
      digits = digits + 1;
      /* [SS] 2013-04-21 */
      if (count > 50) {
        report_error (&status->error_obj, "malformed repeat");
        break;
      }
    } else {
      if (((*q == '-') || (*q == ',')) && (digits > 0)
          && (isdigit (*(q + 1)))) {
        out[count] = *q;
        count = count + 1;
        q = q + 1;
        digits = 0;
        /* [SS] 2013-04-21 */
        if (count > 50) {
          report_error (&status->error_obj, "malformed repeat");
          break;
        }
      } else {
        done = 1;
      }
    }
  }
  out[count] = '\0';
  return (q);
}

int checkend (const char *s)
/* returns 1 if we are at the end of the line 0 otherwise */
/* used when we encounter '\' '*' or other special line end characters */
{
  const char *p;
  int atend;

  p = s;
  skipspace (&p);
  if (*p == '\0') {
    atend = 1;
  } else {
    atend = 0;
  }
  return (atend);
}

/* [SS] 2015-06-01 required for parse_mididef() in store.c */
/* Just like readstr but also allows anything except white space */
// TODO: uncomment the function below
// int readaln (out, in, limit)
//      char out[];
//      char **in;
//      int limit;
/* copy across alphanumeric string */
// {
//   int i;

//   i = 0;
//   while ((!isspace (**in)) && (**in) != 0 && (i < limit - 1)) {
//     out[i] = **in;
//     i = i + 1;
//     *in = *in + 1;
//   }
//   out[i] = '\0';
//   return i;
// }

/* handle any commands that the abc parser understands */
static void handle_parser_comment_commands (parser_status_t * status, const char *s)
{

  /* shouldn't MidiOff and MidiOn be in the MIDI backend ? */
//  if (strncasecmp (s, "%MidiOff", 9) == 0) {
//  }
//  if (strncasecmp (s, "%MidiOn", 8) == 0) {
//  }
  /* [SS] 2020-01-03 */
  if (strncmp (s, "%begintext", 10) == 0) {
    /* non-standard feature from abcm2ps.
     * unfortunately not designed in a way that other programs
     * will handle safely if they don't implement it.
     *
     * Use of this feature causes problems because
     * programs try to interpret any contained text as abc.
     */
    if (status->state == INBODY) {
      report_warning (&status->error_obj,
                      "%%begintext within tune body is non-standard feature");
      status->textinbody = 1;
    }
  }
  if (strcmp (s, "%endtext") == 0) {
    status->textinbody = 0;
  }
  if (strncmp (s, "%temperament", 12) == 0) {
    status->func->temperament (status, s);
  }
}

void parse_precomment (parser_status_t * status, const char *s)
/* handles a comment field */
{
  char package[40];
  const char *p;

  /* read in a version specification if there is one. Currently we
   * don't use this version information elsewhere.
   */
  (void)sscanf (s, "%%abc-version %39s", tune_abcversion); /* [SS] 2014-08-11 */
  if (*s == '%') {
    handle_parser_comment_commands (status, s);
    p = s + 1;
    readstr (package, &p, 40);
    status->func->specific (status, package, p);
  } else {
    status->func->comment (status, s);
  }
}

/* parse tempo descriptor i.e. Q: field */
void parse_tempo (parser_status_t * status, const char *place)
{
  const char *p;
  const char *after_pre;
  int a, b;
  int n;
  int relative;
  char *pre_string;
  char *post_string;
  struct vstring pre;
  struct vstring post;

  relative = 0;
  p = place;
  pre_string = NULL;
  initvstring (&pre);
  if (*p == '"') {
    p = p + 1; /* skip over opening double quote */
    p = umlaut_build_string(p, &pre);
    pre_string = pre.st;
    if (*p == '\0') {
      report_error (&status->error_obj, "Missing closing double quote");
    } else {
      p = p + 1; /* skip over closing double quote */
      place = p;
    }
  }
  after_pre = p;
  /* do we have an "=" ? */
  while ((*p != '\0') && (*p != '='))
    p = p + 1;
  if (*p == '=') {
    p = place;
    skipspace (&p);
    if (((*p >= 'A') && (*p <= 'G')) || ((*p >= 'a') && (*p <= 'g'))) {
      relative = 1;
      p = p + 1;
    }
    readlen (status, &a, &b, &p);
    skipspace (&p);
    if (*p != '=') {
      report_error (&status->error_obj, "Expecting = in tempo");
    }
    p = p + 1;
  } else {
    /* no "=" found - default to 1/4 note */
    a = 1;                      /* [SS] 2013-01-27 */
    b = 4;
    p = after_pre;
  }
  skipspace (&p);
  n = readnump (&p); /* read notes per minute value */
  post_string = NULL;
  initvstring (&post);
  skipspace (&p);
  if (*p == '"') {
    p = p + 1; /* skip over opening double quote */
    p = umlaut_build_string(p, &post);
    post_string = post.st;
    if (*p == '\0') {
      report_error (&status->error_obj, "Missing closing double quote");
    } else {
      p = p + 1; /* skip over closing double quote */
    }
  }
  status->func->tempo (status, n, a, b, relative, pre_string, post_string);
  freevstring (&pre);
  freevstring (&post);
}

/* Second level of processing for a line of lyrics, takes either
 * +: or w: with any + at the start removed.
 * It then strips off any continuation character
 * append is set to
 *   PLUS_FIELD for +:
 *   W_PLUS_FIELD for w: + <lyrics>
 *   0 for regular w: <lyrics>
 */
void preparse2_words(parser_status_t * status, const char *field, int append)
{
  int continuation;
  int l;
  const char *s;
  char *temp_str;

  s = field;
  /* strip off any trailing spaces */
  l = strlen (s) - 1;
  while ((l >= 0) && (*(s + l) == ' ')) {
    l = l - 1;
  }
  if (*(s + l) != '\\') {
    continuation = 0;
  } else {
    /* [SS] 2014-08-14 */
    report_warning (&status->error_obj,
                    "\\n continuation no longer supported in w: line");
    continuation = 1;
    /* remove continuation character */
    l = l - 1;
    while ((l >= 0) && (*(s + l) == ' ')) {
      l = l - 1;
    }
  }
  temp_str = substrdup(s, s + l);
  status->func->words (status, temp_str, append, continuation);
  free(temp_str);
}

/* first level of w: field processing
 * takes a line of lyrics (w: field)  and handles
 * any + after w:
 */
void preparse1_words (parser_status_t * status, const char *field)
{
  int append;
  const char *s;

  /* look for '+' at the start of word field */
  s = field;
  append = 0;
  skipspace(&s);
  if (*s == '+') {
    append = W_PLUS_FIELD;
    s = s + 1;
    skipspace(&s);
  }
  preparse2_words(status, s, append);
}

/* initialize table mapping H-W, h-w and ~ to strings */
void init_abbreviations (abbreviation_t abbreviation[])
{
  int i;

  for (i = 0; i < SIZE_ABBREVIATIONS; i++) {
    abbreviation[i].string = NULL;
    abbreviation[i].type = DEC_UNKNOWN;
  }
}

/* function to resolve unit note length when the
 * L: field is missing in the header
 *
 * From the abc standard 2.2:
 * If there is no L: field defined, a unit note length is set by default,
 * based on the meter field M:. This default is calculated by computing
 * the meter as a decimal: if it is less than 0.75 the default unit note
 * length is a sixteenth note; if it is 0.75 or greater, it is an eighth
 * note. For example, 2/4 = 0.5, so, the default unit note length is a
 * sixteenth note, while for 4/4 = 1.0, or 6/8 = 0.75, or 3/4= 0.75,
 * it is an eighth note. For M:C (4/4), M:C| (2/2) and M:none (free meter),
 * the default unit note length is 1/8.
 *
 */
static void resolve_unitlen(parser_status_t *status)
{
  if (status->master_unitlen == -1)
  {
    if (status->has_timesig == 0) 
    {
      status->func->default_length(status, 8);
      status->master_unitlen = 8;
    }
    else
    {
      if (((4 * status->master_timesig.num)/status->master_timesig.denom) >= 3)
      {
        status->func->default_length(status, 8);
        status->master_unitlen = 8;
      }
      else
      {
        status->func->default_length(status, 16);
        status->master_unitlen = 16;
      }
    }
  }
}

/* starting a new tune, reset the parser status
 * also, if we are running two passes, initialize records for second pass
 */
static void start_new_tune(parser_status_t * status, int refno)
{
  newtune_reset_parser (status);
  if (status->new_reps && (status->rep_handling != PASS2_SUBSTITUTE_NEW_BARS)) {
    status->rep_handling = PASS1_MAKE_BAR_LIST;
    /* reset variables generated on PASS1 and used on PASS2 */
    newtune_reset_pass1(status);
    /* disable output beyond the parser for PASS1 */
    status->func = status->dummy_funcs;
  }
  status->func->refno (status, refno);
}

/* finish the tune. If we are doing two passes, this triggers the
 * second pass.
 */
static void finish_tune(parser_status_t * status)
{
  if (status->rep_handling == PASS1_MAKE_BAR_LIST) {
    /* fix repeats */
    fix_tune_repeats(status);
    /* generate a second pass */
    replay_tune(status);
  }
  status->state = OUTSIDE_TUNE;
}

/* process a U:X=!decoration! field (abbreviation) or
 * U:X="string".
 * this allows a single character X to be used instead of the specified
 * decoration or string in the abc.
 * According to the 2.2 standard, the character may be H-W, h-w or ~.
 *
 * returns 0 if any errors found, 1 on successful completion.
 */
static int process_abbreviation(parser_status_t *status, const char *place)
{
  char symbol;
  char container;
  const char *expansion_start;
  char *expansion;
  char warning_msg[80];

  skipspace (&place);
  symbol = *place;
  if (!(((symbol >= 'H') && (symbol <= 'W'))  ||
        ((symbol >= 'h') && (symbol <= 'w')) ||
         (symbol  == '~'))) {
    snprintf(warning_msg, 80, "bad letter %c in U: must be H-W, h-w or ~", symbol);
    report_warning (&status->error_obj, warning_msg);
    return 0;
  }
  place = place + 1;
  skipspace (&place);
  if (*place != '=') {
    report_error (&status->error_obj, "Missing '=' U: field ignored");
    return 0;
  }
  place = place + 1;
  skipspace (&place);
  if ((*place == '!') || (*place == '"')) {
    container = *place;
    place = place + 1;
    expansion_start = place;
    while ((!iscntrl (*place)) && (*place != container)) {
      place = place + 1;
    }
    if (*place != container) {
      char error_msg[80];

      snprintf(error_msg, 80, "No closing %c in U: field", container);
      report_error (&status->error_obj, error_msg);
      return 0;
    }
  } else {
    report_error (&status->error_obj, "U: field must use ! or \" to enclose symbol definitions");
    return 0;
  }
  if (place - 1 > expansion_start) {
    expansion = substrdup(expansion_start, place - 1);
    record_abbreviation (status, symbol, expansion, container);
    status->func->abbreviation (status, symbol, expansion, container);
    free (expansion);
    return 1;
  } else {
    report_error (&status->error_obj, "Missing term in U: field");
    return 0;
  }
}

/* top-level routine handling all lines containing a field */
void parsefield (parser_status_t * status, char key, const char *field)
{
  const char *place;
  const char *xplace;
  int foundkey;
  int success;

  /* treat X: as a special case as it marks the start of tune header */
  if (key == 'X') {
    int x;

    xplace = field;
    skipspace (&xplace);
    x = readnumf (status, xplace);
    switch (status->state) {
      case OUTSIDE_TUNE:
        /* This is the usual case - we expect this to happen */
        /* start the new tune */
        start_new_tune(status, x);
        status->state = INHEAD;
        break;
      case INHEAD:
        /* We are already in the header (i.e. past the X: ).
         * Treat this as an error.
         */
        report_error (&status->error_obj, "second X: field in header");
        status->func->refno (status, x);
        break;
      case INBODY:
        /* we have got past the last tune header and are in the tune.
         * assume this is meant to start a new tune and the blank line
         * got left out.
         */
        report_error (&status->error_obj, "Missing blank line before new tune");
        /* complete last tune */
        parser_check_tune_completed (status);
        status->func->tune_completed (status);
        status->func->blankline (status);
        finish_tune(status);
        status->tune_ready = 1;
        /* defer starting the new tune until the next parseline call */
        status->state = START_NEW_TUNE;
        status->new_refno = x;
        break;
      default:
        break;
    }
    return;
  }

  if ((status->state == OUTSIDE_TUNE) &&
      (strchr (PERMITTED_FILE_HEADER_FIELDS, key) == NULL)) {
    char message[50];

    snprintf (message, 50, "%c: field not allowed in file header", key);
    report_error (&status->error_obj, message);
    /* pass the field on anyway as abc2abc should print it. Unrecognized
     * fields will be ignored elsewhere.
     */
    status->func->field (status, key, field);
    return;
  }

  /* check field is allowed in tune body according to abc standard 2.2 */
  if ((status->state == INBODY) && (strchr (PERMITTED_TUNE_BODY_FIELDS, key) == NULL)) { /* [SS] 2015-05-11 */
    char message[50];

    snprintf (message, 50, "%c: field not allowed in tune body", key);
    report_error (&status->error_obj, message);
    /* pass the field on anyway as abc2abc should print it. Unrecognized
     * fields will be ignored elsewhere.
     */
    status->func->field (status, key, field);
    return;
  }
  /* now parse the field itself */
  place = field;
  skipspace (&place);
  switch (key) {
    case 'K':
      if (status->state == INHEAD)
      {
        /* First K: is the end of the header and the start of the body.
         * make sure we set up default for unit length
         * if L: fields was missing in the header.
         */
        resolve_unitlen(status);
      }
      foundkey = parsekey (status, place);
      if (status->state == INHEAD) {
        /* initialize voice 1 with values from header */
        set_voice_from_master(status, 1);
      }
      if ((status->state == INHEAD) || (status->state == INBODY)) {
        if (foundkey) {
          status->state = INBODY;
        } else {
          if (status->state == INHEAD) {
            report_error (&status->error_obj,
                          "First K: field must specify key signature");
          }
        }
      } else {
        report_error (&status->error_obj, "No X: field preceding K:");
      }
      break;
    case 'M':
      {
        timesig_details_t timesig;

        readsig (status, &place, &timesig);
        if ((*place == 's') || (*place == 'l')) {
          report_warning (&status->error_obj,
                        "s and l in M: field not supported");
        }
        if ((timesig.num == 0) || (timesig.denom == 0)) {
          report_warning (&status->error_obj, "Invalid time signature ignored");
        } else {
          if (status->state == INHEAD) {
            /* copy timesig into master_timesig */
            copy_timesig(&status->master_timesig, &timesig);
          }
          if (status->state == INBODY) {
            /* update timesig in current voice */
            voice_context_t *current_voice;
 
            current_voice = &status->voice_state[status->voicenum - 1];
            copy_timesig(&current_voice->timesig, &timesig);
          }
          status->func->timesig (status, &timesig);
          status->has_timesig = 1;
        }
        break;
      }
    case 'L':
      {
        int num, denom;

        read_L_unitlen(status, &num, &denom, &place);
        if (num != 1) {
          report_error (&status->error_obj, "L: default length must be 1/X");
        } else {
          if (denom > 0) {
            status->func->length (status, denom);
            if (status->state == INHEAD)
            {
              status->master_unitlen = denom;
            }
            if (status->state == INBODY) {
              voice_context_t *current_voice;

              current_voice = &status->voice_state[status->voicenum - 1];
              current_voice->unitlen = denom;
            }
          } else {
            report_error (&status->error_obj, "L: invalid denominator");
          }
        }
        break;
      }
    case 'T':
      if (status->state != INBODY) {
        /* ordinary T: handled by the field function */
        status->func->field (status, key, place);
        break;
      }
      /* abc standard 2.2 says "T: field can also be used within a tune
       * to name parts of a tune". In this case shouldn't the user be
       * using P: ? Support this by falling through to P: handling
       */
      report_warning (&status->error_obj,
                      "T: found in tune body, treated as P:");
      /* no break here - fall through */
    case 'P':
      if (status->state == INBODY) {
        char *part_str;

        part_str = strdup(place);
        add_decoration (status, DEC_PART, ' ', part_str);
      }
      status->func->part (status, place);
      break;
    case 'I':
      status->func->info (status, place);
      break;
    case 'V':
      parsevoice (status, place);
      break;
    case 'Q':
      parse_tempo (status, place);
      break;
    case 'U':
      success = process_abbreviation(status, place);
      if (!success) {
        status->func->bad_command(status, place);
      }
      break;
    case 'w':
      preparse1_words (status, place);
      break;
    case '+':
      /* implement +: field as meaning w: + <lyrics> */
      preparse2_words(status, place, PLUS_FIELD);
      break;
    case 'd':
      /* decoration line in abcm2ps */
      status->func->field (status, key, place); /* [SS] 2010-02-23 */
      break;
    case 's':
      status->func->field (status, key, place); /* [SS] 2010-02-23 */
      break;
    default:
      status->func->field (status, key, place);
  }
  if (key == 'w') {
    status->lastfieldcmd = 'w'; /* [SS] 2014-08-15 */
  } else {
    status->lastfieldcmd = ' '; /* [SS[ 2014-08-15 */
  }
}

/* parse field within abc line e.g. [K:G] */
const char *parseinlinefield (parser_status_t * status, const char *p)
{
  const char *q;

  status->func->startinline (status);
  q = p;
  while ((*q != ']') && (*q != '\0')) {
    q = q + 1;
  }
  status->inline_field = 1;
  if (*q == ']') {
    char *field;
    int len;
    len = q - p;
    field = (char *)checkmalloc (len + 1);
    strncpy (field, p, len);
    field[len] = '\0';
    parsefield (status, *p, field + 2);
    free (field);
    q = q + 1;
  } else {
    report_error (&status->error_obj, "missing closing ]");
    parsefield (status, *p, p + 2);
  }
  status->inline_field = 0;
  status->func->closeinline (status);
  return (q);
}

/* see if line ends with a comment. If it does, return 1 and allocate
 * strings for comment and for the line before the comment.
 * otherwise return 0;
 */
int get_comment (const char *line, char **comment_line, int *precomment_spaces,
                 char **other_line)
{
  const char *place;
  int len;

  *precomment_spaces = 0;
  /*  work out where comment starts if we have one */
  place = line;
  while ((*place != '\0') && (*place != '%')) {
    place = place + 1;
  }
  if (*place == '%') {
    /* allocate a new string holding the comment */
    *comment_line = strdup (place);
  } else {
    /* no comment found */
    return 0;
  }
  place = place - 1;
  while ((place >= line) && (isspace (*place))) {
    *precomment_spaces = *precomment_spaces + 1;
    place = place - 1;
  }
  /* allocate and assign value to string for the rest of the line */
  len = ((place + 1) - line) + 1;
  *other_line = (char *)malloc (len);
  strncpy (*other_line, line, len);
  (*other_line)[len - 1] = '\0';
  return 1;
}

/* Look for problems in the use of repeats */
static void check_bar_repeats (parser_status_t * status, int bar_type,
                               char *replist)
{
  voice_context_t *cv = &status->voice_state[status->voicenum - 1];

  parser_checkpoint (status);
  switch (bar_type) {
    case SINGLE_BAR:
      break;
    case DOUBLE_BAR:
      break;
    case THIN_THICK:
      break;
    case THICK_THIN:
      break;
    case BAR_REP:
      if (cv->expect_repeat) {
        report_warning_ch (status->src_line, status->error_ch, &status->error_obj, "Expecting repeat, found |:");
      }
      cv->expect_repeat = 1;
      cv->repeat_count = cv->repeat_count + 1;
      break;
    case REP_BAR:
      if (!cv->expect_repeat) {
        char error_message[80];

        if (cv->repeat_count == 0) {
          snprintf (error_message, 80,
                    "Missing repeat at start ? Unexpected :|%s found", replist);
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj, error_message);
        } else {
          snprintf (error_message, 80, "Unexpected :|%s found", replist);
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj, error_message);
        }
      }
      cv->expect_repeat = 0;
      cv->repeat_count = cv->repeat_count + 1;
      break;
    case BAR1:
      if (!cv->expect_repeat) {
        if (cv->repeat_count == 0) {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj,
                          "Missing repeat at start ? found |1");
        } else {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj, "found |1 in non-repeat section");
        }
      }
      break;
    case REP_BAR2:
      if (!cv->expect_repeat) {
        if (cv->repeat_count == 0) {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj,
                          "Missing repeat at start ? found :|2");
        } else {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj, "No repeat expected, found :|2");
        }
      }
      cv->expect_repeat = 0;
      cv->repeat_count = cv->repeat_count + 1;
      break;
    case DOUBLE_REP:
      if (!cv->expect_repeat) {
        if (cv->repeat_count == 0) {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj,
                          "Missing repeat at start ? found ::");
        } else {
          report_warning_ch (status->src_line, status->error_ch, &status->error_obj, "No repeat expected, found ::");
        }
      }
      cv->expect_repeat = 1;
      cv->repeat_count = cv->repeat_count + 1;
      break;
  }
}

static void report_bar_error(parser_status_t *status,
   voice_context_t *current_voice)
{
  char msg[80];

  if (current_voice->extended_bar) {
    strcpy(msg, "Extended bar");
  } else {
    strcpy(msg, "Bar");
  }
  sprintf (msg + strlen(msg), " %d is %d/%d not %d/%d", current_voice->barno,
    current_voice->barcount.num, current_voice->barcount.denom,
    current_voice->timesig.num, current_voice->timesig.denom);
  report_error_place (status, msg);
}

static void check_bar_len(parser_status_t * status,
  voice_context_t *current_voice, int bar_type)
{
  int relative_barlen;
  int relative_timesig;

  relative_barlen = current_voice->barcount.num * current_voice->timesig.denom;
  relative_timesig = current_voice->timesig.num * current_voice->barcount.denom;
  if (relative_barlen > relative_timesig) {
    /* bar is too long  - definitely an error */
    report_bar_error(status, current_voice);
    current_voice->barcount.num = 0;
    current_voice->barcount.denom = 1;
    current_voice->extended_bar = 0;
  } else if (relative_barlen == relative_timesig) {
    /* bar is just right - reset bar count */
    current_voice->barcount.num = 0;
    current_voice->barcount.denom = 1;
    current_voice->extended_bar = 0;
  } else if ((relative_barlen < relative_timesig) &&
             (current_voice->barcount.num >0)) {
    /* bar is too short 
     * don't report zero length bars as this can be caused by a bar
     * at the end of one line and the start of the next */
    if (current_voice->barno == 1) {
      /* treat first short bar as an anacrusis */
      current_voice->barcount.num = 0;
      current_voice->barcount.denom = 1;
      current_voice->extended_bar = 0;
    } else {
      /* report error for complete bars with a single bar line at each end */
      if ((bar_type == SINGLE_BAR) &&
          (current_voice->last_bar_type == SINGLE_BAR))
      {
        /* short regular bar this is an error */
        report_bar_error(status, current_voice);
        current_voice->barcount.num = 0;
        current_voice->barcount.denom = 1;
        current_voice->extended_bar = 0;
      }
      /* more complicated cases here : bar is too short but this might be
       * due to repeat markers not co-inciding with regular bars
       * if we have a repeat marker, keep on accumulating bar count,
       * if last bar was a repeat marker, zero bar count
       */
      else if (bar_type == SINGLE_BAR) {
        /* and last bar is not SINGLE_BAR */
        report_bar_error(status, current_voice);
        current_voice->barcount.num = 0;
        current_voice->barcount.denom = 1;
        current_voice->extended_bar = 0;
      } else {
        current_voice->extended_bar = 1;
      }
      /* otherwise assume we have a repeat or other special bar type
       * which may not be a regular bar -
       * don't reset barcount and wait to till next bar to do the check */
    }
  }
}

/* we have a bar symbol. Perform checks then call the backend function */
static void check_and_call_bar (parser_status_t * status,
                                decoration_context_t *dec_context,
                                int original_bar_type,
                                char *replist)
{
  voice_context_t *current_voice;
  int last_barcount_num;
  int bar_type;

  bar_type = original_bar_type;
  current_voice = &status->voice_state[status->voicenum - 1];
  last_barcount_num = current_voice->barcount.num;
  if (status->repcheck) {
    check_bar_repeats (status, bar_type, replist);
  }
  if (status->rep_handling == PASS1_MAKE_BAR_LIST)
  {
    /* on PASS1 build a list of bar symbols */
    insert_bar_record(status, bar_type);
  }
  if (status->rep_handling == PASS2_SUBSTITUTE_NEW_BARS)
  {
    /* on PASS2 make any replacement we have decided is needed */
    bar_type = get_next_bar_type(status);
  }
  if (bar_type != VIRTUAL_BAR) {
    /* do not generate an event for virtual bar (start of music line) */
    status->func->bar (status, dec_context, bar_type, replist);

    if ((status->barcheck) &&
        (current_voice->timesig.type != TIMESIG_FREE_METER)) {
       check_bar_len(status, current_voice, bar_type);
    }
    if (last_barcount_num > 0) {
      /* do not increment barno if there was nothing in the bar */
      current_voice->barno = current_voice->barno + 1;
    }
  }
  current_voice->last_bar_type = bar_type;
}

/* Start of a tuple has been  encountered (e.g. triplet) */
/* Meaning is "play next r notes at q/n of notated value" */
/* where all 3 exist, otherwise r defaults to n and ratio */
/* is deduced from standard rules if q is missing */
static int compute_tuplefactor(parser_status_t *status, int n, int q, int r)
{
  voice_context_t *current_voice;
  int new_tuplenotes;

  current_voice = &status->voice_state[status->voicenum - 1];

  get_tuple_parameters(&status->tuplefactor.num, &status->tuplefactor.denom,
    &new_tuplenotes, current_voice->timesig.num, n, q, r);
  return new_tuplenotes;
}

/* process any inline fields at the start of a music line.
 * This results in V: fields not generating extra blank lines of music.
 */
const char *process_inlines(parser_status_t * status, const char *field)
{
  const char *p;
  int space_count;
  p = field;
  space_count = skipspace (&p);
  status->func->space (status, space_count);
  while ((*p == '[') && isalpha (*(p+1)) && (*(p + 2) == ':')) {
  // HERE
    parser_checkpoint (status);
    p = p + 1;
    status->inline_field = 1;
    p = parseinlinefield (status, p);
    space_count = skipspace (&p);
    status->func->space (status, space_count);
  }
  return p;
}

const char *handle_decoration(parser_status_t * status, const char *field, char *endchar, const char *p)
{
  struct vstring instruction;
  const char *s;
  char endcode;

  endcode = *p;
  p = p + 1;
  s = p;
  initvstring (&instruction);
  while ((*p != endcode) && (*p != '\0')) {
    vstring_addch( &instruction, *p);
    p = p + 1;
  }
  if (*p != endcode) {
    p = s;
    if (checkend (s)) {
      status->func->lineend (status, '!', 1);
      *endchar = '!';
    } else {
      report_error_ch (field, (int)(p-field), &status->error_obj,
                    "'!' or '+' in middle of line ignored");
    }
  } else {
    decoration_type_t dec;

    dec = identify_str_decoration (instruction.st);
    if (dec == DEC_UNKNOWN) {
      char *new_dec_str;

      new_dec_str = strdup(instruction.st);
      add_decoration (status, dec, ' ', new_dec_str);
    } else {
      add_decoration (status, dec, ' ', NULL);
    }
    status->func->str_decoration (status, instruction.st);
    p = p + 1;
  }
  freevstring (&instruction);
  return p;
}

/* parse a line of abc notes */
void parsemusic (parser_status_t * status, const char *field)
{
  const char *p;
  char endchar;
  int starcount;
  char playonrep_list[80];
  int space_count;

  status->func->startmusicline (status);
  /* generate a "VIRTUAL_BAR" at the start of each line of music
   * This may be turned into a start repeat when we fix repeats.
   */
  check_and_call_bar (status, &status->dec_context,
                      VIRTUAL_BAR, "");
  endchar = ' ';
  p = field;
  skipspace (&p);
  while (*p != '\0') {
    if (*p == '.' && *(p + 1) == '(') { /* [SS] 2015-04-28 dotted slur */
      p = p + 1;
      status->func->sluron (status, 1);
      p = p + 1;
    }

    // HERE
    if (((*p >= 'a') && (*p <= 'g')) || ((*p >= 'A') && (*p <= 'G')) ||
        (abbrev_index(*p) != -1) ||
        (strchr ("_^=", *p) != NULL)
        || (strchr (single_char_decorations, *p) != NULL)) {
      status->src_line = field;
      status->error_ch = (int)(p - field);
      parsenote (status, &p);
      // conversion_note(status);
    } else {
      switch (*p) {
        case '"':
          p = process_gchord(status, field, p);
          break;
        case '|':
          status->error_ch = (int)(p - field);
          status->src_line = field;
          p = p + 1;
          switch (*p) {
            case ':':
              check_and_call_bar (status, &status->dec_context,
                                  BAR_REP, "");
              free_decorations(&status->dec_context);
              p = p + 1;
              break;
            case '|':
              check_and_call_bar (status, &status->dec_context,
                                 DOUBLE_BAR, "");
              free_decorations(&status->dec_context);
              p = p + 1;
              break;
            case ']':
              check_and_call_bar (status, &status->dec_context,
                                  THIN_THICK, "");
              free_decorations(&status->dec_context);
              p = p + 1;
              break;
            default:
              p = getrep (status, p, playonrep_list);
              check_and_call_bar (status, &status->dec_context,
                                 SINGLE_BAR,
                                 playonrep_list);
              free_decorations(&status->dec_context);
          }
          break;
        case ':':
          status->error_ch = (int)(p - field);
          status->src_line = field;
          p = p + 1;
          switch (*p) {
            case ':':
              check_and_call_bar (status, &status->dec_context,
                                 DOUBLE_REP, "");
              free_decorations(&status->dec_context);
              p = p + 1;
              break;
            case '|':
              p = p + 1;
              p = getrep (status, p, playonrep_list);
              check_and_call_bar (status, &status->dec_context,
                                 REP_BAR,
                                 playonrep_list);
              free_decorations(&status->dec_context);
              if (*p == ']')
                p = p + 1;      /* [SS] 2013-10-31 */
              break;
            default:
              report_error_ch (field, (int)(p-field), &status->error_obj, "Single colon in bar");
              break;
          }
          break;
        case ' ':
        case TAB:
          space_count = skipspace (&p);
          status->func->space (status, space_count);
          break;
        case '(':
          p = p + 1;
          {
            int t, q, r;

            t = 0;
            q = 0;
            r = 0;
            t = readnump (&p);
            if ((t != 0) && (*p == ':')) {
              p = p + 1;
              q = readnump (&p);
              if (*p == ':') {
                p = p + 1;
                r = readnump (&p);
              }
            }
            if (t == 0) {
              if (*p == '&') {
                p = p + 1;
                status->func->start_extended_overlay (status); /* [SS] 2015-03-23 */
              } else
                status->func->sluron (status, 1);
            } else {            /* t != 0 */
              if (status->tuplenotes != 0) {
                report_error_ch (field, (int)(p-field), &status->error_obj, "tuple within tuple not allowed");
              } else {
                status->tuplenotes = compute_tuplefactor(status, t, q, r);
                status->func->tuple (status, t, q, r);
              }
            }
          }
          break;
        case ')':
          p = p + 1;
          status->func->sluroff (status, 0);
          break;
        case '{':
          p = p + 1;
          if (status->ingrace) {
            report_error_ch (field, (int)(p-field), &status->error_obj,
                          "{ with previous grace note section not closed");
          }
          status->func->graceon (status);
          status->ingrace = 1;
          break;
        case '}':
          p = p + 1;
          if (!status->ingrace) {
            report_error_ch (field, (int)(p-field), &status->error_obj, "} with no matching {");
          }
          status->func->graceoff (status);
          status->ingrace = 0;
          break;
        case '[':
          p = p + 1;
          switch (*p) {
            case '|':
              p = p + 1;
              check_and_call_bar (status, &status->dec_context,
                                 THICK_THIN, "");
              free_decorations(&status->dec_context);
              if (*p == ':') {  /* [SS] 2015-04-13 */
                check_and_call_bar (status, &status->dec_context,
                                   BAR_REP, "");
                p = p + 1;
              }
              break;
            default:
              if (isdigit (*p)) {
                p = getrep (status, p, playonrep_list);
                status->func->playonrep (status, playonrep_list);
              } else {
                if (isalpha (*p) && (*(p + 1) == ':')) {
                  parser_checkpoint (status);
                  p = parseinlinefield (status, p);
                } else {
                  parser_chordon(status, '[');
                }
              }
              break;
          }
          break;
        case ']':
          {
            int chord_n;
            int chord_m;

            p = p + 1;
            readlen (status, &chord_n, &chord_m, &p);
            parser_chordoff(status, chord_n, chord_m, ']');
          }
          break;
        case '$':
          p = p + 1;
          status->func->score_linebreak (status, '$');
          break;
/*  hidden rest  */
        case 'x':
          {
            int n, m;

            p = p + 1;
            readlen (status, &n, &m, &p);
/* in order to handle a fermata applied to a rest we must
 * pass decorators to status->func->rest.
 */
            parser_rest(status, n, m, 1);
            break;
          }
/*  regular rest */
        case 'z':
          {
            int n, m;

            p = p + 1;
            readlen (status, &n, &m, &p);
/* in order to handle a fermata applied to a rest we must
 * pass decorators to status->func->rest.
 */
            parser_rest(status, n, m, 0);
            break;
          }
        case 'y':              /* used by Barfly and abcm2ps to put space */
/* I'm sure I've seen somewhere that /something/ allows a length
 * specifier with y to enlarge the space length. Allow it anyway; it's
 * harmless.
 */
          {
            int n, m;

            p = p + 1;
            readlen (status, &n, &m, &p);
            status->func->spacing (status, n, m);
            break;
          }
/* full bar rest */
        case 'Z':
        case 'X':              /* [SS] 2012-11-15 */

          {
            int n, m;
            char rest_type;

            rest_type = *p;
            p = p + 1;
            readlen (status, &n, &m, &p);
            if (m != 1) {
              report_error_ch (field, (int)(p-field), &status->error_obj,
                            "X or Z must be followed by a whole integer");
            }
            status->func->mrest (status, n, m, rest_type);
            break;
          }
        case '>':
          {
            int n;

            n = 0;
            while (*p == '>') {
              n = n + 1;
              p = p + 1;
            }
            if (n > 3) {
              report_error_ch (field, (int)(p-field), &status->error_obj, "Too many >'s");
            } else {
              status->func->broken (status, GT, n);
            }
            break;
          }
        case '<':
          {
            int n;

            n = 0;
            while (*p == '<') {
              n = n + 1;
              p = p + 1;
            }
            if (n > 3) {
              report_error_ch (field, (int)(p-field), &status->error_obj, "Too many <'s");
            } else {
              status->func->broken (status, LT, n);
            }
            break;
          }
        case 's':
          if (status->slur == 0) {
            status->slur = 1;
          } else {
            status->slur = status->slur - 1;
          }
          status->func->slur (status, status->slur);
          p = p + 1;
          break;
        case '-':
          status->func->tie (status);
          p = p + 1;
          break;
        case '\\':
          p = p + 1;
          if (checkend (p)) {
            status->func->lineend (status, '\\', 1);
            endchar = '\\';
          } else {
            report_error_ch (field, (int)(p-field), &status->error_obj, "'\\' in middle of line ignored");
          }
          break;
        case '+':
          if (status->plus_is_chord) {
            if (status->parserinchord)
            {
              parser_chordoff(status, 1, 1, '+');
            } else {
              parser_chordon(status, '+');
            }
            p = p + 1;
            break;
          }
          if (status->plus_is_dec) {
            p = handle_decoration(status, field, &endchar, p);
            break;
          }
          report_error_ch (field, (int)(p-field), &status->error_obj, "Don't know how to interpret '+'");
          p = p + 1;
          break;
          /* otherwise we fall through into the next case statement */
        case '!':
          p = handle_decoration(status, field, &endchar, p);
          break;
        case '*':
          p = p + 1;
          starcount = 1;
          while (*p == '*') {
            p = p + 1;
            starcount = starcount + 1;
          }
          if (checkend (p)) {
            status->func->lineend (status, '*', starcount);
            endchar = '*';
          } else {
            report_error_ch (field, (int)(p-field), &status->error_obj, "*'s in middle of line ignored");
          }
          break;
        case '/':
          p = p + 1;
          if (status->ingrace)
            status->func->acciaccatura (status);
          else
            report_error_ch (field, (int)(p-field), &status->error_obj, "stray / not in grace sequence");
          break;
        case '&':
          p = p + 1;
          if (*p == ')') {
            p = p + 1;
            status->func->stop_extended_overlay (status); /* [SS] 2015-03-23 */
            break;
          } else
            status->func->split_voice (status);
          break;
        default:
          {
            char msg[40];

            if ((*p >= 'A') && (*p <= 'z')) { /* [SS] 2016-09-20 */
              status->func->reserved (status, *p);
            } else {
              /* don't use isascii() here because POSIX.1-2008 marks
               * isascii() as obsolete
               */
              if ((((unsigned int)(*p) & 0xFF) < 0x80) && !(iscntrl (*p))) {
                sprintf (msg, "Unrecognized character: %c", *p);
              } else {
                sprintf (msg, "Unrecognized character: 0x%x", (unsigned int)*p);
              }
              report_error_ch (field, (int)(p-field), &status->error_obj, msg);
            }
          }
          p = p + 1;
      }
    }
  }
  status->func->endmusicline (status, endchar);
}

/* top-level routine for handling a line in abc file */
//HERE
void parseline_main (parser_status_t * status, char *line)
{
  const char *p;
  const char *q;
  int found_field;
  int space_count;
  int have_comment;
  char *comment_line = NULL;
  char *other_line = NULL;
  int precomment_spaces;

  if (strlen (line) > 511) {
    /*
     * We are called exclusively by toabc.c,
     * and when we are called, event_error() is muted,
     * so, event_error("input line truncated") does nothing.
     * Simulate it with a plain printf. [PHDM 2012-12-01]
     */
    report_error (&status->error_obj, "long input line truncated");
  }
  status->error_ch = 0;
  status->src_line = line;
  strncpy (status->inputline, line, 512); /* [SS] 2011-06-07 [PHDM] 2012-11-27 */
  status->inputline[511] = '\0'; /* ensure string is terminated */

  /* deal with the special case of no line break between tunes */
  if (status->state == START_NEW_TUNE) {
    /* start the new tune */
    start_new_tune(status, status->new_refno);
    status->func->linebreak (status);
    status->state = INHEAD;
  }
  p = line;
  space_count = skipspace (&p);
  if (strlen (p) == 0) {
    if (status->state == INBODY) {
      parser_check_tune_completed (status);
      status->func->tune_completed (status);
      finish_tune(status);
    }
    status->func->blankline (status);
    status->tune_ready = 1;
    status->state = OUTSIDE_TUNE;
    return;
  }
  if ((int)*p == '\\') {
    status->func->tex (status, p);
    return;
  }
  if ((int)*p == '%') {
    parse_precomment (status, p + 1);
    return;
  }
  /* look for a comment after whatever we have */
  have_comment =
    get_comment (p, &comment_line, &precomment_spaces, &other_line);
  if (have_comment) {
    /* use line with the comment removed for further parsing */
    p = other_line;
  }
  /* see if we have a field */
  found_field = 0;
  if (isalpha (*p) || (*p == '+')) {
    q = p + 1;
    skipspace (&q);
    if ((int)*q == ':') {
      if (*(line + 1) != ':') {
        report_warning (&status->error_obj, "whitespace in field declaration");
      }
      /* warn about ambiguous line, and treat it as music */
      if ((*(q + 1) == ':') || (*(q + 1) == '|')) {
        report_warning (&status->error_obj,
                        "Ambiguous line - either a :| repeat or a field command");
      } else {
        found_field = 1;
      }
    }
  }
  if (found_field) {
    parsefield (status, *p, q + 1);
  } else {
    if ((status->state == INBODY) && !status->textinbody) {
      /* treat as a line of music */
      {
        status->func->space (status, space_count);
        p = process_inlines(status, p);
        parsemusic (status, p);
        parser_checkpoint (status);
      }
    } else {
      /* otherwise treat line as free text */
      status->func->text (status, line);
    }
  }
  /* now write out any comment */
  if (have_comment) {
    status->func->space (status, precomment_spaces);
    parse_precomment (status, comment_line + 1);
    free (other_line);
    free (comment_line);
  }
}

/* top-level routine for handling a line in abc file.
 * If we are doing a second pass we bypass this function and go
 * straight to parseline_main().
 */
void parseline (parser_status_t * status, char *line)
{
  /* first call standard parseline to process line */
  parseline_main (status, line);
  /* now handle multiple passes for fixing repeats */
  if (status->new_reps && (status->state != OUTSIDE_TUNE)) {
    store_tune_line(status, line);
  }
}

static void initialize_globals (parser_status_t * status)
{
  /* initialize some things before we get going */
  init_abbreviations (status->abbreviation);
  /* set up standard abbreviations 
   * section 4.16 of abc 2.2 standard */
  /* . staccato is not set up here */
  record_abbreviation (status, '~', "roll", '!');
  record_abbreviation (status, 'H', "fermata", '!');
  record_abbreviation (status, 'L', "accent", '!');
  record_abbreviation (status, 'M', "lowermordent", '!');
  record_abbreviation (status, 'O', "coda", '!');
  record_abbreviation (status, 'P', "uppermordent", '!');
  record_abbreviation (status, 'S', "segno", '!');
  record_abbreviation (status, 'T', "trill", '!');
  record_abbreviation (status, 'u', "upbow", '!');
  record_abbreviation (status, 'v', "downbow", '!');
}

/* top-level function to call before parsing an abc file */
void parser_start_abcfile (parser_status_t * status)
{
  initialize_globals (status);
  status->state = OUTSIDE_TUNE;
}

/* top-level function to call to clean up after parsing an abc file */
void parser_end_abcfile (parser_status_t * status)
{
  if (status->state == INBODY) {
    /* complete last tune */
    parser_check_tune_completed (status);
    status->func->tune_completed (status);
    status->func->blankline (status);
    finish_tune(status);
    status->tune_ready = 1;
  }
  status->func->eof(status);
  free_abbreviations (status->abbreviation);
}
