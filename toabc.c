/*
 * toabc.c - part of abc2abc - program to manipulate abc files.
 * Copyright (C) 1999 James Allwright
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
/* back-end for outputting (possibly modified) abc */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "abc.h"
#include "parseabc.h"
#include "toabc.h"
#include "parser_interface.h"
#include "transposer.h"
#include "parser_utils.h"
#include "./guitar/guitar_model.c"

typedef char *char_p;

#define MIDDLE 72

conversion_state_t *new_conversion_state (void)
{
  conversion_state_t *conv;
  int i;

  conv = malloc (sizeof (conversion_state_t));
  /* initialization from parser_status_t */

  conv->abc_output = NULL;
  initvstring (&conv->abc_buffer);
  conv->breakpoint.num = 0;
  conv->breakpoint.denom = 1;
  conv->have_spacing_scheme = 0;
  conv->newspacing = 0;
  conv->compact_lengths = 0;
  conv->fixL = 0;
  conv->echeck = 1; /* report errors by default */
  conv->bars_per_line = 4;
  conv->barend = 0;
  conv->transpose = 0;
  conv->lenfactor.num = 1;
  conv->lenfactor.denom = 2;
  conv->nokeysig = 0;
  conv->newkey = 0;
  conv->inlinefield = 0;
  conv->output_on = 1;
  conv->passthru = 0;
  conv->selected_voices = -1;
  for (i = 0; i < MAX_VOICES; i++) {
    conv->enable_output[i] = 1;
  }
  conv->newrefnos = 0;
  conv->newref = 0;
  conv->useflats = 0;
  conv->usekey = 0;
  conv->changekeysig = 0;
  conv->drumchan = 0;
  conv->voicecount = 0;
  conv->this_voice = 0;
  conv->next_voice = 0;
  init_transpose_info (&conv->transpose_info);
  return conv;
}

conversion_state_t *free_conversion_state (conversion_state_t * conv)
{
  freevstring (&conv->abc_buffer);
  free (conv);
  return (conversion_state_t *) NULL;
}

/* [PHDM] 2013-03-08 */
void parse_voices_selection (void *vstatus, char *voices_string, int enable[])
{
  const char *s = voices_string;
  int i;

  if (voices_string == 0x0)
    return;                     /* [SS] 2015-02-22 */
  for (i = 0; i < MAX_VOICES; i++) {
    enable[i] = 0;
  }
  do {
    int v = readnump (&s);

    if (v < MAX_VOICES) {
      enable[v] = 1;
    }
  } while (*s++);
}

 /* [PHDM] 2013-03-08 */
int must_emit_voice (void *vstatus, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  return conv->enable_output[n];
}

/* output string */
void emit_string (void *vstatus, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->output_on) {
    vstring_addtext( &conv->abc_buffer, s);
  }
}

/* output single character */
void emit_char (void *vstatus, char ch)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->output_on) {
    vstring_addch( &conv->abc_buffer, ch);
  }
}

/* output integer */
void emit_int (void *vstatus, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  char number_string[30];

  if (conv->output_on) {
    snprintf (number_string, 30, "%d", n);
    vstring_addtext( &conv->abc_buffer, number_string);
  }
}

/* output string containing string expression %s */
void emit_string_sprintf (void *vstatus, char *s1_a, char *s1_b, char *s2)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->output_on) {
    emit_string (vstatus, s1_a);
    emit_string (vstatus, s2);
    emit_string (vstatus, s1_b);
  }
}

/* output string containing int expression %d */
void emit_int_sprintf (void *vstatus, char *s1_a, char *s1_b, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->output_on) {
    emit_string (vstatus, s1_a);
    emit_int (vstatus, n);
    emit_string (vstatus, s1_b);
  }
}

/* output field key e.g. X:, T:, M: */
void emit_field_key (void *vstatus, char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->output_on) {
    emit_string (vstatus, s);
    /* if it is not an inline field, add a space */
    if (status->inline_field == 0) {
      vstring_addch( &conv->abc_buffer, ' ');
    }
  }
}

/* remove previously output start of inline field */
/* needed for -V voice selection option           */
void unemit_inline (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  int len;

  len = strlen (conv->abc_buffer.st);
  if ((len > 0) && (conv->abc_buffer.st[len - 1] == '[')) {
    conv->abc_buffer.st[len - 1] = '\0'; /* delete last character */
    conv->abc_buffer.len = conv->abc_buffer.len - 1;
  } else {
    report_error (&status->error_obj, "Internal error - Could not delete [");
  }
}


/* we have reached the end of the input */
void conversion_eof (void *vstatus)
{
}

/* we have found a blank line in the abc -
 * this signals the end of a tune.
 * we should also get a linebreak at this point in the parsing
 */
void conversion_blankline (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  conv->output_on = 1;
}

void conversion_text (void *vstatus, const char *p)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  /* abc standard 2.2 says we are allowed free text in abc files */
  emit_string (status, p);
}

void conversion_reserved (void *vstatus, char ch)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  char *expansion;
  decoration_type_t dec;
 
  expansion = lookup_abbreviation (status->abbreviation, ch, &dec); 
  if (expansion == NULL) {
    char warning_message[80];

    snprintf(warning_message, 80, "No U: definition found for %c", ch);
    report_warning (&status->error_obj, warning_message);
  }
  /* emit character as another program may support it. */
  emit_char (status, ch);
}

void conversion_tex (void *vstatus, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, s);
}

/* this function is used by toabc.c [SS] 2011-06-10 */
void print_inputline_nolinefeed (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  /* error-checking moved into parseline [JRA June 2020] */
  emit_string (status, status->inputline);
}

/* this function is used by toabc.c [SS] 2011-06-07 */
void print_inputline (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  print_inputline_nolinefeed (vstatus);
  emit_char (status, '\n');
}

/* We have encountered a score linebreak character in the music.
 * Described in abc standard 2.2 .
 * This starts a new stave in the printed music but can appear
 * in the middle of a line of abc notes.
 */
void conversion_score_linebreak (void *vstatus, char ch)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_char (status, ch);
}

/* we have found a linebreak in the abc text */
void conversion_linebreak (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv == NULL) {
    printf ("conv is NULL\n");
    exit (1);
  }

  if (!conv->output_on && conv->passthru) {
    print_inputline (status);   /* [SS] 2011-06-07 */
  }
  {
    if (conv->output_on) {
      add_line_to_text_lines (conv->abc_output, conv->abc_buffer.st);
      clearvstring (&conv->abc_buffer);
    }
    /* don't output new line if voice is already suppressed
       otherwise we will get lots of blank lines where we
       are suppressing output. [SS] feb-10-2002.
     */
  }
}

/* encountered the start of a line of notes */
void conversion_startmusicline (void *vstatus)
{
}

/* encountered the end of a line of notes */
void conversion_endmusicline (void *vstatus, char endchar)
{
}


/* encountered the end of an abc tune */
void conversion_tune_completed (void *vstatus)
{
}

void conversion_comment (void *vstatus, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "%");
  emit_string (status, s);
}

void conversion_bad_command(void *vstatus, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  conversion_comment(vstatus, status->src_line);
}

void conversion_specific (void *vstatus, char *package, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  char command[40];
  int ch;
  const char *p;

  emit_string (status, "%%");
  emit_string (status, package);
  emit_string (status, s);
/* detect drum channel by searching for %%MIDI channel 10 */
  if (strcmp (package, "MIDI") != 0)
    return;
  p = s;
  skipspace (&p);
  readstr (command, &p, 40);
  if (strcmp (command, "channel") != 0)
    return;
  skipspace (&p);
  ch = readnump (&p);
  if (ch == 10) {
    conv->voice[conv->next_voice].drumchan = 1;
    conv->drumchan = 1;
  }
}

/* handles info field I: */
void conversion_info (void *vstatus, const char *f)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_field_key (status, "I:");
  emit_string (status, f);
  emit_string (status, "");
}

/* unrecognized field - output it unchanged */
void conversion_field (void *vstatus, char k, const char *f)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_char (status, k);
  emit_string (status, ": ");
  emit_string (status, f);
}

/* a w: field has been encountered */
void conversion_words (void *vstatus, const char *p, int append, int continuation)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  struct vstring afield;

  initvstring (&afield);
  if (append == W_PLUS_FIELD) {
    vstring_addtext( &afield, "+ ");
  }
  vstring_addtext( &afield, p);
  if (continuation) {
    vstring_addch( &afield, ' ');
    vstring_addch( &afield, '\\');
  }
  if (append == PLUS_FIELD) {
    conversion_field (status, '+', afield.st);
  } else {
    conversion_field (status, 'w', afield.st);
  }
  freevstring (&afield);
}

void conversion_part (void *vstatus, const char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  conv->output_on = 1;          /* [SS] 2011-04-14 */
  emit_field_key (status, "P:");
  emit_string (status, s);
}

/* initialize an abc2abc backend voice when we start using it */
static void init_voice(conversion_state_t *conv, int voice_index, int num)
{
  int i;
  voicetype_t *v;
  complex_barpoint_t *parent_breaks;
  complex_barpoint_t *voice_breaks;

  v = &conv->voice[voice_index];
  v->number = num;
  v->drumchan = 0;
  parent_breaks = &conv->master_bar_break;
  voice_breaks = &v->bar_break;
  for (i = 0; i < 8; i++)
  {
    voice_breaks->break_here[i].num = parent_breaks->break_here[i].num;
    voice_breaks->break_here[i].denom = parent_breaks->break_here[i].denom;
  }
}

/* Change the current voice to num.
 * If voice does not exist, start new one
 */
int setvoice (void *vstatus, int num)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  int i, voice_index;

  i = 0;
  while ((i < conv->voicecount) && (conv->voice[i].number != num)) {
    i = i + 1;
  }
  if ((i < conv->voicecount) && (conv->voice[i].number == num)) {
    voice_index = i;
    conv->drumchan = conv->voice[voice_index].drumchan;
  } else {
    voice_index = conv->voicecount;
    if (conv->voicecount < MAX_VOICES) {
      conv->voicecount = conv->voicecount + 1;
    } else {
      report_error (&status->error_obj,
                    "Number of voices exceeds static limit MAX_VOICES");
    }
    init_voice(conv, voice_index, num);
  }
  return (voice_index);
}

void conversion_voice (void *vstatus, int n, const char *s, struct voice_params *vp)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (status->state == INBODY) {
    conv->next_voice = setvoice (status, n);
  }
  if (!must_emit_voice (status, n)) { /* [PHDM] 2013-03-08 */
    if ((conv->inlinefield) && (conv->output_on == 1)) {
      unemit_inline (status);
    }
    if (status->state == INBODY)
      conv->output_on = 0;      /* [SS] 2011-06-10 */
  } else {
    if (conv->output_on == 0) {
      conv->output_on = 1;
      if (conv->inlinefield) {
        emit_string (status, "["); /* regenerate missing [ */
      }
    }
  }
  if (strlen (status->voice_state[n - 1].name) > 0) {
    emit_field_key (status, "V:");
    emit_string (status, status->voice_state[n - 1].name);
  } else {
    emit_field_key (status, "V:");
    emit_int (status, n);
  }
  if (vp->gotclef) {
    emit_string (status, " clef=");
    emit_string (status, vp->clefname);
  }
  if (vp->gotoctave) {
    emit_string (status, " octave=");
    emit_int (status, vp->octave);
  }
  if (vp->gottranspose) {
    emit_string (status, " transpose=");
    emit_int (status, vp->transpose);
  }
  if (vp->gotname) {
    emit_string (status, " name=");
    emit_string (status, vp->namestring);
  }
  if (vp->gotsname) {
    emit_string (status, " sname=");
    emit_string (status, vp->snamestring);
  }
  if (vp->gotmiddle) {
    emit_string (status, " middle=");
    emit_string (status, vp->middlestring);
  }
  if (vp->gotother) {
    emit_string (status, " ");
    emit_string (status, vp->other);
  }                           /* [SS] 2011-04-18 */
  if (strlen (s) != 0) {
    emit_string (status, s);
  }
}

/* an L: field has been encountered */
void conversion_length (void *vstatus, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  struct fract newunit;

  newunit.num = conv->lenfactor.denom;
  newunit.denom = conv->lenfactor.num * n;
  reduce (&newunit.num, &newunit.denom);
  emit_field_key (status, "L:");
  emit_int (status, newunit.num);
  emit_string (status, "/");
  emit_int (status, newunit.denom);
}

/* no L: field encountered when the parser reaches K: set up a default
 * unit note length
 */
void conversion_default_length(void *vstatus, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  /* We could fix the problem here by outputting a new L: field
   * but this breaks the principle of not modifying the source
   * unless the user asks for it.
   */
  if (conv->fixL) {
    conversion_length(vstatus, n);
    conversion_linebreak (vstatus);
  }
}

void conversion_refno (void *vstatus, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  conv->output_on = 1;
  if (conv->newrefnos) {
    emit_field_key (status, "X:");
    emit_int (status, conv->newref);
    emit_string (status, "");
    conv->newref = conv->newref + 1;
  } else {
    emit_field_key (status, "X:");
    emit_int (status, n);
    emit_string (status, "");
  }
}

void conversion_tempo (void *vstatus, int n, int a, int b, int relative,
                       char *pre, char *post)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  struct fract newlen;

  emit_field_key (status, "Q:");
  if (pre != NULL) {
    emit_string (status, "\"");
    emit_string (status, pre);
    emit_string (status, "\"");
  }
  if (n != 0) {
    if (pre != NULL) {
      emit_string(status, " ");
    }
    if ((a == 0) && (b == 0)) {
      emit_int (status, n);
    } else {
      if (relative) {
        newlen.num = a * conv->lenfactor.num;
        newlen.denom = b * conv->lenfactor.denom;
        reduce (&newlen.num, &newlen.denom);
        emit_string (status, "C");
        emit_int (status, newlen.num);
        emit_string (status, "/");
        emit_int (status, newlen.denom);
        emit_string (status, "=");
        emit_int (status, n);
        emit_string (status, "");
      } else {
        emit_string (status, "");
        emit_int (status, a);
        emit_string (status, "/");
        emit_int (status, b);
        emit_string (status, "=");
        emit_int (status, n);
        emit_string (status, "");
      }
    }
    if (post != NULL) {
      emit_string(status, " ");
    }
  }
  if (post != NULL) {
    emit_string (status, "\"");
    emit_string (status, post);
    emit_string (status, "\"");
  }
}

/* a complex time signature is something like M:(3+4)/8
 * this means the time signature is actually 7/8 or 7 eighth notes in a bar,
 * but you should group the eighth notes as a set of 3, then a set of four.
 * This function works out where to put spaces between notes for a
 * complex time signature.
 */
static void set_complex_barpoint(parser_status_t *status,
    timesig_details_t *timesig, complex_barpoint_t *complex_barpoint)
{
  int i;
  struct fract count;

  count.num = 0;
  count.denom = 1;
  for (i = 0; i < timesig->num_values; i++) {
    int part_num;
    int part_denom;

    /* get component of complex timesig as a fraction */
    part_num = timesig->complex_values[i];
    part_denom = timesig->denom;
    /* add component of complex timesig to count */
    count.num = (count.num * part_denom) + (part_num * count.denom);
    count.denom = (count.denom * part_denom);
    reduce(&count.num, &count.denom);
    /* set next suggested break to be at current count value */
    complex_barpoint->break_here[i].num = count.num;
    complex_barpoint->break_here[i].denom = count.denom;
  }
}

/* M: field in the source. Support M:none, M:C and M:C| as well as
 * normal M:n/m
 */
void conversion_timesig (void *vstatus, timesig_details_t *timesig)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  conv->have_spacing_scheme = 0; /* default to no new spacing */
  emit_field_key (status, "M:");
  switch (timesig->type) {
    default:
    case TIMESIG_NORMAL:
      emit_int (status, timesig->num);
      emit_string (status, "/");
      emit_int (status, timesig->denom);
      break;
    case TIMESIG_FREE_METER:
      emit_string (status, "none");
      status->barcheck = 0;
      break;
    case TIMESIG_COMMON:
      emit_string (status, "C");
      break;
    case TIMESIG_CUT:
      emit_string (status, "C|");
      break;
    case TIMESIG_COMPLEX:
      {
        int i;

        emit_char(status, '(');
        for (i = 0; i < timesig->num_values; i++)
        {
          if (i > 0) {
            emit_char(status, '+');
          }
          emit_int (status, timesig->complex_values[i]);
        }
        emit_char(status, ')');
        emit_string (status, "/");
        emit_int (status, timesig->denom);
        if (status->state == INHEAD) {
          set_complex_barpoint(status,
            &status->master_timesig, &conv->master_bar_break);
        } else if (status->state == INBODY) {
          voicetype_t *toabc_voice;
          voice_context_t *parser_voice;

          parser_voice = &status->voice_state[status->voicenum - 1];
          toabc_voice = &conv->voice[status->voicenum - 1];
          set_complex_barpoint(status,
            &parser_voice->timesig, &toabc_voice->bar_break);
        }
        conv->have_spacing_scheme = 1;
      }
      break;
  }
  if ((timesig->type == TIMESIG_NORMAL) ||
      (timesig->type == TIMESIG_COMMON) ||
      (timesig->type == TIMESIG_CUT)) {
    conv->breakpoint.num = timesig->num;
    conv->breakpoint.denom = timesig->denom;
    if (timesig->num == 3) {
      /* handles 3/2, 3/4, 3/8 */
      conv->breakpoint.num = timesig->num / 3;
      conv->breakpoint.denom = timesig->denom;
      conv->have_spacing_scheme = 1;
    }
    if ((timesig->num == 9) || (timesig->num == 6)) {
      /* handles 6/8 and 9/8 */
      conv->breakpoint.num = 3;
      conv->breakpoint.denom = timesig->denom;
      conv->have_spacing_scheme = 1;
    }
    if (timesig->num % 2 == 0) {
      conv->breakpoint.num = timesig->num / 2;
      conv->breakpoint.denom = timesig->denom;
      conv->have_spacing_scheme = 1;
    }
    conv->barend = timesig->num / conv->breakpoint.num;
  }
  if (conv->newspacing && !conv->have_spacing_scheme) {
    report_warning (&status->error_obj,
     "Do not know how to group notes in this time signature");
  }
}

/* initialize things when we reach the K: marking the start of the notes */
static void start_tune (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  voice_context_t *parser_voice;

  parser_voice = &status->voice_state[status->voicenum - 1];
  conv->inlinefield = 0;
  if (parser_voice->timesig.num == 0) {
    /* generate missing time signature */
    conversion_linebreak (status);
    conversion_timesig (status, &status->master_timesig);
  }
  conv->voicecount = 0;
  conv->this_voice = setvoice (status, 1);
  conv->next_voice = conv->this_voice;
}

int modmap_not_empty (char *modmap)
{
  int i;
  for (i = 0; i < 7; i++)
    if (modmap[i] != ' ') {
      return 1;
    }
  return 0;
}


/* end of [SS] 2011-02-15 */

void conversion_key (void *vstatus, int sharps, const char *s, 
                     music_mode_t modeindex, const char *mode_name,
                     char modmap[7], int modmul[7], struct fract modmicro[7],
                     struct key_params *params)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  char new_key[30];             /* allow enough space for exp + modifiers */

  if ((!(status->state == INBODY)) && conv->passthru) {
    print_inputline_nolinefeed (status); /* [SS] 2011-06-10 */
    if (status->state == INHEAD) {
      start_tune (status);
    }
    return;
  }
  if (params->gotkey) {

    if (conv->nokeysig) {
      transposer_set_key_target_none (&status->error_obj, &conv->transpose_info,
                                      sharps, !conv->useflats,
                                      modmap_not_empty (modmap), modmap, modmul,
                                      conv->transpose);
      conv->newkey = 0;
      strcpy (new_key, "none");
    } else {
      if (conv->changekeysig) {
        transposer_force_keysig(&status->error_obj, &conv->transpose_info,
                        sharps, conv->usekey, modeindex, mode_name,
                        new_key);
      } else {
        transposer_set_key (&status->error_obj, &conv->transpose_info,
                        sharps, &conv->newkey, modeindex, mode_name,
                        modmap_not_empty (modmap), modmap, modmul,
                        conv->transpose, new_key);
      }
    }

  }
  emit_field_key (status, "K:");
  if (conv->transpose == 0 && !conv->nokeysig && !conv->changekeysig) {
    emit_string (status, s);
  } else {
    if (params->gotkey) {
      emit_string (status, new_key);
      if (params->gotclef) {
        emit_string (status, " ");
      }
    }
    if (params->gotclef) {
      emit_string (status, "clef=");
      emit_string (status, params->clefname);
      emit_string (status, "");
    }
    if (params->gotoctave) {
      emit_string (status, " octave=");
      emit_int (status, params->octave);
      emit_string (status, "");
    }
    if (params->gottranspose) {
      emit_string (status, " transpose=");
      emit_int (status, params->transpose);
      emit_string (status, "");
    }
  }
  if (status->state == INHEAD) {
    start_tune (status);
  }
}

/* print the fractional length of a note, rest or other entity */
static void printlen (void *vstatus, int a, int b)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (a != 1) {
    emit_int (status, a);
  }
  if (b != 1) {
    emit_string (status, "/");
    if ((b != 2) || (conv->compact_lengths == 0)) {
      emit_int (status, b);
    }
  }
}

void conversion_spacing (void *vstatus, int n, int m)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "y");
  printlen (status, n, m);
}

void conversion_rest (void *vstatus,
                      decoration_context_t *dec_context,
                      int n, int m, int type)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  struct fract newlen;

  if (type == 1)
    emit_string (status, "x");
  else
    emit_string (status, "z");
  newlen.num = n * conv->lenfactor.num;
  newlen.denom = m * conv->lenfactor.denom;
  reduce (&newlen.num, &newlen.denom);
  printlen (status, newlen.num, newlen.denom);
}

/* multiple bar rest.
 * c is used to distinguish X from Z [SS] 2017-04-19
 */
void conversion_mrest (void *vstatus, int n, int m, char c)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "Z");
  printlen (status, n, m);
  if (status->parserinchord) {
    report_error (&status->error_obj, "Multiple bar rest not allowed in chord");
  }
  if (status->tuplenotes > 0) {
    report_error (&status->error_obj, "Multiple bar rest not allowed in tuple");
  }
}

void conversion_bar (void *vstatus, decoration_context_t *dec_context,
                      int type, char *replist)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
 

 
  switch (type) {
    case SINGLE_BAR:
      emit_string (status, "|");
      emit_string (status, replist);
      emit_string (status, "");
      break;
    case DOUBLE_BAR:
      emit_string (status, "||");
      break;
    case THIN_THICK:
      emit_string (status, "|]");
      break;
    case THICK_THIN:
      emit_string (status, "[|");
      break;
    case BAR_REP:
      emit_string (status, "|:");
      break;
    case REP_BAR:
      emit_string (status, ":|");
      emit_string (status, replist);
      emit_string (status, "");
      break;
    case BAR1:
      emit_string (status, "|1");
      break;
    case REP_BAR2:
      emit_string (status, ":|2");
      break;
    case DOUBLE_REP:
      emit_string (status, "::");
      break;
  }
  /* tell transposer that we have encountered a bar line */
  transposer_bar_reset (&conv->transpose_info);
  /* could introduce a score linebreak here */
}

void conversion_space (void *vstatus, int count)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (!(conv->newspacing && conv->have_spacing_scheme)) {
    int i;

    for (i = 0; i < count; i++) {
      emit_string (status, " ");
    }
  }
}

void conversion_graceon (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "{");
}

void conversion_graceoff (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "}");
}

void conversion_rep1 (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, " [1");
}

void conversion_rep2 (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, " [2");
}

void conversion_playonrep (void *vstatus, char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, " [");
  emit_string (status, s);
  emit_string (status, "");
}

void conversion_broken (void *vstatus, int type, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  int i;

  if (type == GT) {
    for (i = 0; i < n; i++) {
      emit_char (status, '>');
    }
  } else {
    for (i = 0; i < n; i++) {
      emit_char (status, '<');
    }
  }
}

void conversion_tuple (void *vstatus, int n, int q, int r)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  if (conv->newspacing && conv->have_spacing_scheme) {
    emit_char(status, ' ');
  }
  emit_string (status, "(");
  emit_int (status, n);
  if (q != 0) {
    emit_string (status, ":");
    emit_int (status, q);
    if (r != 0) {
      emit_string (status, ":");
      emit_int (status, r);
    }
  } else {
    if (r != 0) {
      /* cope with the case when q is zero, but r is not zero. */
      emit_string (status, "::");
      emit_int (status, r);
    }
  }
}

void conversion_startinline (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;

  emit_string (status, "[");
  conv->inlinefield = 1;
}

void conversion_closeinline (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  emit_string (status, "]");
  conv->inlinefield = 0;
}

void conversion_chordon (void *vstatus, char open_char)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_char (status, '[');
}

void conversion_chordoff (void *vstatus, int chord_n, int chord_m,
   char close_char)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  char string[16];

  emit_char (status, ']');
  if (chord_n != 1 && chord_m != 1) {
    sprintf (string, "%d/%d", chord_n, chord_m);
    emit_string (status, string);
  } else if (chord_n != 1) {
    sprintf (string, "%d", chord_n);
    emit_string (status, string);
  } else if (chord_m != 1) {
    sprintf (string, "/%d", chord_m);
    emit_string (status, string);
  }
  if (conv->newspacing && conv->have_spacing_scheme &&
      (status->tuplenotes == 1)) {
    /* this is the last chord in a tuple, output a space */
    emit_char(status, ' ');
  }
}

/* read a note A-G with possible accidental and move string
 * pointer on appropriately.
 */
static char *read_gchord_note (char *place, char *note, char *acc)
{
  char *new_place;

  *note = *place;
  new_place = place + 1;
  *acc = *new_place;
  if ((*acc == '#') || (*acc == 'b')) {
    new_place = new_place + 1;
  }
  return new_place;
}

/* write note A-G with possible accidental to string and move string
 * pointer on appropriately.
 */
static void write_gchord_note (char *place, char note, char acc)
{
  char *new_place;

  *place = note;
  new_place = place + 1;
  if ((acc == '#') || (acc == 'b')) {
    *new_place = acc;
    new_place = new_place + 1;
  }
  *new_place = '\0';
}

/* deals with an accompaniment (guitar) chord */
/* either copies it straight out or transposes it */
void conversion_gchord (void *vstatus, char pos, char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  char newchord[50];
  int chordstart;

  if ((conv->transpose == 0) || (pos != ' ')) {
    emit_string (status, "\"");
    if (pos != ' ') {
      emit_char(status, pos);
    }
    emit_string (status, s);
    emit_string (status, "\"");
  } else {
    char *p;
    int j;

    p = s;
    chordstart = 1;
    j = 0;
    while (*p != '\0') {
      if (chordstart) {
        if ((*p >= 'A') && (*p <= 'G')) {
          char src_note;
          char src_acc;
          char target_note;
          char target_acc;

          p = read_gchord_note (p, &src_note, &src_acc);
          transpose_guitar_chord (&conv->transpose_info, src_note, src_acc,
                                  &target_note, &target_acc);
          write_gchord_note (&newchord[j], target_note, target_acc);
          j = strlen (newchord);
          chordstart = 0;
        } else {
          if ((*p >= 'a') && (*p <= 'g')) {
            char src_note;
            char src_acc;
            char target_note;
            char target_acc;

            p = read_gchord_note (p, &src_note, &src_acc);
            transpose_guitar_chord (&conv->transpose_info, src_note, src_acc,
                                    &target_note, &target_acc);
            write_gchord_note (&newchord[j], target_note, target_acc);
            j = strlen (newchord);
            chordstart = 0;
          } else {
            if (isalpha (*p)) {
              chordstart = 0;
            }
            newchord[j] = *p;
            p = p + 1;
            j = j + 1;
            newchord[j] = '\0';
          }
        }
      } else {
        if ((*p == '/') || (*p == '(') || (*p == ' ')) {
          chordstart = 1;
        }

        newchord[j] = *p;
        p = p + 1;
        j = j + 1;
        newchord[j] = '\0';
      }
      if (j >= 49) {
        report_error (&status->error_obj,
                      "guitar chord contains too much text");
        while (*p != '\0') {
          p = p + 1;
        }
      }
    }
    emit_string (status, "\"");
    emit_string (status, newchord);
    emit_string (status, "\"");
  }
}

void conversion_str_decoration (void *vstatus, char *s)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "!");
  emit_string (status, s);
  emit_string (status, "!");
}

/* handles a redefinable single char symbol used for a decoration */
void conversion_char_decoration (void *vstatus, char ch)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_char (status, ch);
}

/* handles a redefinable single char symbol used for a text string */
void conversion_char_gchord (void *vstatus, char ch)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_char (status, ch);
}

void conversion_slur (void *vstatus, int t)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  if (t) {
    emit_string (status, "(");
  } else {
    emit_string (status, ")");
  }
}

void conversion_sluron (void *vstatus, int t)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "(");
}

void conversion_sluroff (void *vstatus, int t)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, ")");
}

void conversion_tie (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "-");
}

void conversion_lineend (void *vstatus, char ch, int n)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  int i;

  for (i = 0; i < n; i++) {
    emit_char (status, ch);
  }
}

/* handle a note in the source abc.
 * The decorations are handled as encountered in the toabc backend, so
 * we don't need to handle them here.
 */
void conversion_note (void *vstatus,
                      decoration_context_t *dec_context,
                      cleftype_t *clef,
                      char xaccidental, int xmult, char xnote, int xoctave,
                      int n, int m)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  // int t;
  struct fract newlen;
  int mult;
  char accidental, note;
  int octave = 4;

  mult = 0;                     /* [SS] 2006-10-27 */
  if (((conv->transpose == 0) && (conv->nokeysig == 0) &&
       (conv->changekeysig == 0)) || conv->drumchan) {
    accidental = xaccidental;
    mult = xmult;
    note = xnote;
    octave += xoctave;
  } else {
    /* use transposer code */
    transpose_note (&conv->transpose_info,
                    xnote, xaccidental, xmult, xoctave,
                    &note, &accidental, &mult, &octave);
  }

  // printf("KeySignature: %d \n", conv->changekeysig);

  char standardNote;

  if (islower(note)){
    standardNote = toupper(note);
  }else{
    standardNote = note;
  }

  if (mult == 2){ // double flats or sharps
    // printf("accidental = %c\n", accidental);
    switch(standardNote){
      case 'A': 
        standardNote = (accidental == '^') ? 'B' : 'G'; 
        accidental = ' '; 
        break;
      case 'B': 
        standardNote = (accidental == '^') ? 'C' : 'A';
        accidental = (accidental == '^') ? '^' : ' '; 
        if (standardNote == 'C'){ // Adjust octave when wrapping
          octave += 1;
        } 
        break;
      case 'C': 
        standardNote = (accidental == '^') ? 'D' : 'B'; 
        accidental = (accidental == '_') ? '_' : ' ';
        if (standardNote == 'B'){ // Adjust octave when wrapping
          octave -= 1;
        }  
        break;
      case 'D': 
        standardNote = (accidental == '^') ? 'E' : 'C'; 
        accidental = ' '; 
        break;
      case 'E': 
        standardNote = (accidental == '^') ? 'F' : 'D'; 
        accidental = (accidental == '^') ? '^' : ' '; 
        break;
      case 'F': 
        standardNote = (accidental == '^') ? 'G' : 'E'; 
        accidental = (accidental == '_') ? '_' : ' '; 
        break;
      case 'G': 
        standardNote = (accidental == '^') ? 'A' : 'F'; 
        accidental = ' '; 
        break;
    }
  }

  if (accidental == '_') {
    switch(standardNote){
      case 'C':
        standardNote = 'B';
        accidental = ' ';
        octave -= 1;
        break;
      case 'F':
        standardNote = 'E';
        accidental = ' ';
        break;
    }
  } else if (accidental == '^'){
      switch(standardNote){
      case 'B':
        standardNote = 'C';
        accidental = ' ';
        octave += 1;
        break;
      case 'E':
        standardNote = 'F';
        accidental = ' ';
        break;
    }
  }


  // printf("accidental = %c\n", accidental);
  char accidentalChar = ' ';
  if (accidental == '_'){
    accidentalChar = 'b';
  } else if (accidental == '^'){
    accidentalChar = '#';
  }
  // printf("accidentalChar = %c\n", accidentalChar);

  char standardNotation[6];
  if (accidentalChar == ' '){  // if there is an accidental
    snprintf(standardNotation, sizeof(standardNotation), "%c%d", standardNote, octave);
  } else{
    snprintf(standardNotation, sizeof(standardNotation), "%c%c%d", standardNote, accidentalChar, octave);
  }
  

  // Guitar Model
  char*** guitar = createGuitar();
  int size;
  NoteLocation* locations = findNote(guitar, standardNotation, &size);
  if (locations != NULL && size > 0){
    char* chord = convertLocationToChord(&locations[0]);  // Only first location TODO: chage this after optimal path is found
    // printf("Chord representation: %s\n", chord);

    emit_string(status, chord);
    free(chord);
  } else {
    printf("Note note found. \n");
  }

  freeGuitar(guitar);
  free(locations);



  newlen.num = n * conv->lenfactor.num;
  newlen.denom = m * conv->lenfactor.denom;
  reduce (&newlen.num, &newlen.denom);
  printlen (status, newlen.num, newlen.denom);
}

/* called after note when barcount has moved on by note time value */
void conversion_note_end (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  struct fract barpoint;
  voice_context_t *parser_voice;

  parser_voice = &status->voice_state[status->voicenum - 1];
  if (!(conv->newspacing && conv->have_spacing_scheme)) {
    /* this function is only concerned with generating new spaces
     * does nothing if newspacing is disabled */
    return;
  }
  if (status->parserinchord) {
    /* never put spaces in a chord */
    return;
  }
  if (status->tuplenotes > 0) {
    if (status->tuplenotes == 1)
    {
      /* this the last note in tuple, put a space after it */
      emit_char(status, ' ');
    }
    /* never break beaming within a tuple */
    return;
  }
  if (parser_voice->timesig.type == TIMESIG_COMPLEX) {
    voicetype_t *v;
    int i;

    v = &conv->voice[status->voicenum - 1];
    /* try all the pre-calculated breakpoints */
    for (i = 0; i < parser_voice->timesig.num_values - 1; i++) {
      if ((v->bar_break.break_here[i].num ==
             parser_voice->barcount.num) &&
          (v->bar_break.break_here[i].denom ==
             parser_voice->barcount.denom))
      {
        emit_string (status, " ");
      }
    }
  } else {
    barpoint.num = parser_voice->barcount.num * conv->breakpoint.denom;
    barpoint.denom = conv->breakpoint.num * parser_voice->barcount.denom;
    reduce (&barpoint.num, &barpoint.denom);
    if ((barpoint.denom == 1) && (barpoint.num != 0) &&
        (barpoint.num != conv->barend)) {
      emit_string (status, " ");
    }
  }
}

/* non-standard extension from Seymour Shlien */
void conversion_microtone (void *vstatus, int dir, int a, int b)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  /* use sharp or flat symbol */
  if (dir == 1) {
    emit_char (status, '^');
  } else {
    emit_char (status, '_');
  }
  /* follow sharp/flat with a fraction */
  emit_int (status, a);
  emit_char (status, '/');
  emit_int (status, b);
}

/* non-standard extension from Seymour Shlien */
void conversion_temperament (void *vstatus, const char *line)
{
  /* do nothing here as the command is processed as a regular comment */
}

void conversion_normal_tone (void *vstatus)
{
}

/* a U: field has been found in the abc */
void conversion_abbreviation (void *vstatus, char symbol, const char *string,
                              char container)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  if (container == '!') {
    emit_field_key (status, "U:");
    emit_char (status, symbol);
    emit_string (status, " = !");
    emit_string (status, string);
    emit_string (status, "!");
  } else {
    emit_field_key (status, "U:");
    emit_char (status, symbol);
    emit_string (status, " = ");
    emit_string (status, string);
    emit_string (status, "");
  }
}

/* to handle / in front of note in grace notes eg {/A} */
/* abcm2ps compatibility feature [SS] 2005-03-28 */
void conversion_acciaccatura (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  emit_string (status, "/");
}

/* [SS] 2015-03-23 */
void conversion_start_extended_overlay (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  report_error (&status->error_obj,
                "extended overlay not implemented in abc2abc");
}

void conversion_stop_extended_overlay (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  report_error (&status->error_obj,
                "extended overlay not implemented in abc2abc");
}



void conversion_split_voice (void *vstatus)
{
  parser_status_t *status = (parser_status_t *) vstatus;

  emit_string (status, "&");
}

/* define some missing parser functions to do nothing */

void conversion_clef (void *vstatus, char *clefstr)
{
}

void conversion_octave (void *vstatus, int num, int local)
{
}

//void conversion_info_key (void *vstatus, char *key, const char *value)
//{
//}

backend_functions_t *new_conversion_functions (void)
{
  backend_functions_t *parser_fn;

  parser_fn = (backend_functions_t *) malloc (sizeof (backend_functions_t));
  parser_fn->normal_tone = conversion_normal_tone;
  parser_fn->text = conversion_text;
  parser_fn->reserved = conversion_reserved;
  parser_fn->tex = conversion_tex;
  parser_fn->score_linebreak = conversion_score_linebreak;
  parser_fn->linebreak = conversion_linebreak;
  parser_fn->startmusicline = conversion_startmusicline;
  parser_fn->endmusicline = conversion_endmusicline;
  parser_fn->tune_completed = conversion_tune_completed;
  parser_fn->eof = conversion_eof;
  parser_fn->comment = conversion_comment;
  parser_fn->bad_command = conversion_bad_command;
  parser_fn->specific = conversion_specific;
  parser_fn->startinline = conversion_startinline;
  parser_fn->closeinline = conversion_closeinline;
  parser_fn->field = conversion_field;
  parser_fn->words = conversion_words;
  parser_fn->part = conversion_part;
  parser_fn->voice = conversion_voice;
  parser_fn->length = conversion_length;
  parser_fn->default_length = conversion_default_length;
  parser_fn->blankline = conversion_blankline;
  parser_fn->refno = conversion_refno;
  parser_fn->tempo = conversion_tempo;
  parser_fn->timesig = conversion_timesig;
  parser_fn->octave = conversion_octave;
  //parser_fn->info_key = conversion_info_key;
  parser_fn->info = conversion_info;
  parser_fn->key = conversion_key;
  parser_fn->microtone = conversion_microtone;
  parser_fn->temperament = conversion_temperament;
  parser_fn->graceon = conversion_graceon;
  parser_fn->graceoff = conversion_graceoff;
  parser_fn->rep1 = conversion_rep1;
  parser_fn->rep2 = conversion_rep2;
  parser_fn->playonrep = conversion_playonrep;
  parser_fn->tie = conversion_tie;
  parser_fn->slur = conversion_slur;
  parser_fn->sluron = conversion_sluron;
  parser_fn->sluroff = conversion_sluroff;
  parser_fn->rest = conversion_rest;
  parser_fn->mrest = conversion_mrest;
  parser_fn->spacing = conversion_spacing;
  parser_fn->bar = conversion_bar;
  parser_fn->space = conversion_space;
  parser_fn->lineend = conversion_lineend;
  parser_fn->broken = conversion_broken;
  parser_fn->tuple = conversion_tuple;
  parser_fn->chordon = conversion_chordon;
  parser_fn->chordoff = conversion_chordoff;
  parser_fn->str_decoration = conversion_str_decoration;
  parser_fn->char_decoration = conversion_char_decoration;
  parser_fn->char_gchord = conversion_char_gchord;
  parser_fn->gchord = conversion_gchord;
  parser_fn->note = conversion_note;
  parser_fn->note_end = conversion_note_end;
  parser_fn->abbreviation = conversion_abbreviation;
  parser_fn->acciaccatura = conversion_acciaccatura;
  parser_fn->start_extended_overlay = conversion_start_extended_overlay;
  parser_fn->stop_extended_overlay = conversion_stop_extended_overlay;
  parser_fn->split_voice = conversion_split_voice;
  return parser_fn;
}
