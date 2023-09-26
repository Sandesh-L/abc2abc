/* barlines.c
 * Functions to support making start repeat and end repeat signs match up.
 * The aim is to be able to re-construct the intended meaning when some
 * repeat signs are missing by following simple rules. It will not
 * necessarily be possible to get this "correct" i.e. duplicate the
 * implied repeat as understood by the original transcriber.
 *
 * part of toadflax project
 * 
 * Copyright (C) 2021 James Allwright
 *
 * Distributed under GNU General Public License version 3.0
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
#include <stdlib.h>
#include "abc.h"
#include "parseabc.h"
#include "parser_interface.h"


void insert_bar_record(parser_status_t *status, int bar_type)
{
  bar_record_t *new_record;
  voice_context_t *voice;

  voice = &(status->voice_state[status->voicenum - 1]);
  new_record = (bar_record_t *)checkmalloc(sizeof(bar_record_t));
  new_record->bar_type = bar_type;
  new_record->new_bar_type = bar_type;
  new_record->next = NULL;
  new_record->barunits.num = voice->barcount.num;
  new_record->barunits.denom = voice->barcount.denom;
  if ((voice->barcount.num * voice->timesig.denom) <
      (voice->timesig.num * voice->barcount.denom)) {
    new_record->bar_is_short = 1;
  } else {
    new_record->bar_is_short = 0;
  }
  /* insert record into linked list */
  if (voice->bars_in_tune == NULL) {
    voice->bars_in_tune = new_record;
    voice->current_bar = new_record;
  } else {
    voice->current_bar->next = new_record;
    voice->current_bar = new_record;
  }
}

/* free up all bar records */
void free_bar_records(bar_record_t *first_record)
{
  bar_record_t *place;
  bar_record_t *next_place;

  place = first_record;
  while (place != NULL) {
    next_place = place->next;
    free(place);
    place = next_place;
  }
}

int get_next_bar_type(parser_status_t *status)
{
  voice_context_t *voice;
  int bar_type;

  voice = &(status->voice_state[status->voicenum - 1]);
  if (voice->current_bar == NULL) {
    printf("Error line %d no next bar in get_next_bar_type voicenum %d\n", status->error_obj.lineno, status->voicenum);
    return SINGLE_BAR;
  }
  bar_type = voice->current_bar->new_bar_type;
  voice->current_bar = voice->current_bar->next;
  return bar_type;
}

static int make_close_repeat(int bar_type)
{
  switch (bar_type) {
    default:
    case VIRTUAL_BAR :
    case SINGLE_BAR :
    case PLAY_ON_REP :
      return REP_BAR;
    case DOUBLE_BAR :
    case THICK_THIN :
    case THIN_THICK :
      return REP_BAR;
    case BAR1 :
      return REP_BAR;
    case BAR_REP :
      return DOUBLE_REP;
    case REP1 :
    case REP2 :
    case REP_BAR :
    case REP_BAR2 :
    case DOUBLE_REP :
      printf("Error make_close_repeat called with bar type %d\n", bar_type);
      return bar_type;
  }
}

static int make_open_repeat(int bar_type)
{
  switch (bar_type) {
    default:
    case VIRTUAL_BAR :
    case SINGLE_BAR :
    case DOUBLE_BAR :
    case THICK_THIN :
    case THIN_THICK :
    case PLAY_ON_REP :
    case REP1 :
    case REP2 :
    case BAR1 :
      return BAR_REP;
    case BAR_REP :
      printf("Error make_open_repeat called with bar type %d\n", bar_type);
      return bar_type;
    case REP_BAR :
    case REP_BAR2 :
      return DOUBLE_REP;
    case DOUBLE_REP :
      printf("Error make_open_repeat called with bar type %d\n", bar_type);
      return bar_type;
  }
}

/* advance the state machine depending on type of bar. variables are
 * expect_repeat - whether we are expecting a repeat when function is called
 * is_last - if this is the last bar line of the tune
 * bar_type - current bar type
 * need_start_rep - set if we need to start repeat section here.
 * need_end_rep - set if we need to end a repeat section here.
 * need_to_move_fix_point - set if fix point needs to move forward a bar.
 * returns new value of expect_repeat on exit.
 */
static int bar_state_machine(int expect_repeat, int is_last, int bar_type, int *need_start_rep,
  int *need_end_rep, int *need_to_move_fix_point)
{
  int new_expect_repeat;

  /* default actions to do nothing */
  *need_start_rep = 0;
  *need_end_rep = 0;
  *need_to_move_fix_point = 0;
  if (expect_repeat) {
    new_expect_repeat = 1;
    switch (bar_type) {
      default:
      case VIRTUAL_BAR :
      case SINGLE_BAR :
#if 1
      case DOUBLE_BAR :
      case THICK_THIN :
      case THIN_THICK :
#endif
        if (is_last) {
          *need_end_rep = 1;
          new_expect_repeat = 0;
        }
        break;
#if 0
      /* alternative behaviour - put end repeat at section marker */
      case DOUBLE_BAR :
      case THICK_THIN :
      case THIN_THICK :
        /* these are all end of section markers */
        *need_end_rep = 1; /* end repeat here */
        new_expect_repeat = 0; /* this cancels repeat section */
        break;
#endif
      case PLAY_ON_REP :
        break;
      case REP1 :
      case REP2 :
        /* these close the current repeat section */
        new_expect_repeat = 0;
        break;
      case BAR1 :
        break;
      case BAR_REP :
        *need_end_rep = 1;
        new_expect_repeat = 1;
        *need_to_move_fix_point = 1;
        break;
      case REP_BAR :
      case REP_BAR2 :
        /* these close the current repeat section */
        new_expect_repeat = 0;
        *need_to_move_fix_point = 1;
        break;
      case DOUBLE_REP :
        /* this closes the current repeat section */
        new_expect_repeat = 1;
        *need_to_move_fix_point = 1;
        break;
    }
  }  else {
    /* don't expect a repeat */
    new_expect_repeat = 0;
    switch (bar_type) {
      default:
      case VIRTUAL_BAR :
      case SINGLE_BAR :
      case DOUBLE_BAR :
      case THICK_THIN :
      case THIN_THICK :
      case PLAY_ON_REP :
      case BAR1 :
        break;
      case BAR_REP :
        /* start of a repeat section */
        new_expect_repeat = 1;
        *need_to_move_fix_point = 1;
        break;
      case REP1 :
      case REP2 :
      case REP_BAR :
      case REP_BAR2 :
        /* unexpected close of repeat section - need to fix this */
        *need_start_rep = 1;
        *need_to_move_fix_point = 1;
        break;
      case DOUBLE_REP :
        /* unexpected close of repeat section - need to fix this */
        *need_start_rep = 1;
        new_expect_repeat = 1;
        *need_to_move_fix_point = 1;
        break;
    }
  }
  return new_expect_repeat;
}

/* process list of bar symbols to fix repeats */
static void fix_voice_repeats(bar_record_t *first_record)
{
  bar_record_t *place;
  bar_record_t *next_place;
  int expect_repeat;
  bar_record_t *first_fix_point;
  int first_fix_bar_type;
  int bars_since_first;
  bar_record_t *second_fix_point;

  expect_repeat = 0;
  first_fix_point = NULL;
  second_fix_point = NULL;
  place = first_record;
  while (place != NULL) {
    int is_last;
    int need_start_rep;
    int need_end_rep;
    int need_to_move_fix_point;

    next_place = place->next;
    if (next_place == NULL) {
      is_last = 1;
    } else {
      is_last = 0;
    }
    expect_repeat = bar_state_machine(expect_repeat, is_last, place->bar_type,
          &need_start_rep, &need_end_rep, &need_to_move_fix_point);
    if (need_start_rep) {
      /* attempt to fix missing repeat */
      if (!place->bar_is_short && (second_fix_point != NULL)) {
        /* we have anacrusis but last bar was a full bar */
        second_fix_point->new_bar_type = 
          make_open_repeat(second_fix_point->bar_type);
      } else {
        first_fix_point->new_bar_type =
          make_open_repeat(first_fix_point->bar_type);
      }
      first_fix_point = NULL;
      second_fix_point = NULL;
      bars_since_first = 0;
    }
    if (need_end_rep) {
      /* set to close repeat */
      place->new_bar_type = make_close_repeat(place->bar_type);
    }
    if (need_to_move_fix_point) {
      first_fix_point = NULL;
      second_fix_point = NULL;
      bars_since_first = 0;
    }
    /* work out fix points */
    if (first_fix_point == NULL) {
      first_fix_point = place;
      first_fix_bar_type = place->bar_type;
      bars_since_first = 0;
    }
    if ((bars_since_first == 1) && (first_fix_bar_type == VIRTUAL_BAR)) {
      /* if there are no notes before first bar line, use that instead */
      if (place->barunits.num == 0) {
        first_fix_point = place;
        first_fix_bar_type = place->bar_type;
        bars_since_first = 0;
      }
    }
    if ((bars_since_first == 1) && (place->bar_is_short)) {
      second_fix_point = place;
    }

    /* move on to next bar record */
    if (first_fix_point != NULL) {
      bars_since_first = bars_since_first + 1;
    }
    place = next_place;
  }
}

/* go through all voices fixing repeats independently in each voice */
void fix_tune_repeats(parser_status_t * status)
{
  voice_context_t *current_voice;
  int i;

  for (i = 0; i < MAX_VOICES; i++) {
    current_voice = &status->voice_state[i];
    if (current_voice->bars_in_tune != NULL) {
      fix_voice_repeats(current_voice->bars_in_tune);
    }
  }
}

/* as we are processing the tune, make a local copy to use for a second pass */
void store_tune_line(parser_status_t * status, char *line)
{
  add_line_to_text_lines (&status->original_tune, line);
}

/* second pass of the tune - play back stored copy to the parser */
void replay_tune(parser_status_t * status)
{
  string_record_t *current_line = NULL;
  int i;

  if (status->rep_handling != PASS1_MAKE_BAR_LIST) {
    return;
  }
  current_line = status->original_tune.first_string;
  status->rep_handling = PASS2_SUBSTITUTE_NEW_BARS;
  /* restore the real output functions */
  status->func = status->main_funcs;
  parseline_main(status, ""); /* blank line before tune */
  while(current_line != NULL) {
    printf("Processing %s\n", current_line->string_data);
    parseline_main(status, current_line->string_data);
    status->func->linebreak(status);
    current_line = current_line->next_string;
  }
  for (i = 0; i < MAX_VOICES; i++) {
    voice_context_t *current_voice;

    current_voice = &status->voice_state[i];
    free_bar_records(current_voice->bars_in_tune);
  }
  free_text_lines (&status->original_tune);
  status->rep_handling = PASS1_MAKE_BAR_LIST;
}

/* dummy interface */


/* dummy_interface.c - dummy interface file for abc parser
 */

static void dummy_normal_tone(void *status)
{
}

static void dummy_text(void *status, const char *s)
{
}

static void dummy_reserved(void *status, char p)
{
}

static void dummy_tex(void *status, const char *s)
{
}

static void dummy_score_linebreak(void *vstatus, char ch)
{
}

static void dummy_linebreak(void *status)
{
}

static void dummy_startmusicline(void *status)
{
}

static void dummy_endmusicline(void *status, char endchar)
{
}

static void dummy_tune_completed(void *status)
{
}

static void dummy_eof(void *status)
{
}

static void dummy_comment(void *status, const char *s)
{
}

static void dummy_specific(void *status, char *package, const char *s)
{
}

static void dummy_startinline(void *status)
{
}

static void dummy_closeinline(void *status)
{
}

static void dummy_field(void *status, char k, const char *f)
{
}

static void dummy_words(void *status, const char *p, int append, int continuation)
{
}

static void dummy_part(void *status, const char *s)
{
}

static void dummy_voice(void *status, int n, const char *s, struct voice_params *params)
{
}

static void dummy_length(void *status, int n)
{
}

static void dummy_default_length(void *status, int n)
{
}

static void dummy_blankline(void *status)
{
}

static void dummy_refno(void *status, int n)
{
}

static void dummy_tempo(void *status, int n, int a, int b, int rel, char *pre, char *post)
{
}

static void dummy_timesig(void *status, timesig_details_t *timesig)
{
}

static void dummy_octave(void *status, int num, int local)
{
}

//static void dummy_info_key(void *status, char *key, const char *value)
//{
//}

static void dummy_info(void *status, const char *s)
{
}

static void dummy_key(void *status, int sharps, const char *s,
               music_mode_t modeindex, const char *mode_name,
               char modmap[7], int modmul[7], struct fract modmicro[7],
               struct key_params *params)
{
}

static void dummy_microtone(void *status, int dir, int a, int b)
{
}

static void dummy_temperament(void *status, const char *line)
{
}

static void dummy_graceon(void *status)
{
}

static void dummy_graceoff(void *status)
{
}

static void dummy_rep1(void *status)
{
}

static void dummy_rep2(void *status)
{
}

static void dummy_playonrep(void *status, char *s)
{
}

static void dummy_tie(void *status)
{
}

static void dummy_slur(void *status, int t)
{
}

static void dummy_sluron(void *status, int t)
{
}

static void dummy_sluroff(void *status, int t)
{
}

static void dummy_rest(void *status, decoration_context_t *dec_context, int n,int m,int type)
{
}

static void dummy_mrest(void *status, int n, int m, char c)
{
}

static void dummy_spacing(void *status, int n, int m)
{
}

static void dummy_bar(void *status, decoration_context_t *dec_context, int type, char *replist)
{
}

static void dummy_space(void *status, int count)
{
}

static void dummy_lineend(void *status, char ch, int n)
{
}

static void dummy_broken(void *status, int type, int mult)
{
}

static void dummy_tuple(void *status, int n, int q, int r)
{
}

static void dummy_chordon(void *status, char open_char)
{
}

static void dummy_chordoff(void *status, int n, int m, char close_char)
{
}

static void dummy_str_decoration(void *status, char *s)
{
}

static void dummy_char_decoration(void *status, char ch)
{
}

static void dummy_gchord(void *status, char pos, char *s)
{
}

static void dummy_note(void *status, decoration_context_t *dec_context, cleftype_t *clef, char accidental, int mult, 
                       char note, int xoctave, int n, int m)
{
}

static void dummy_note_end(void *status)
{
}

static void dummy_abbreviation(void *status, char symbol, const char *string, char container)
{
}

static void dummy_acciaccatura(void *status)
{
}

static void dummy_start_extended_overlay(void *status)
{
}

static void dummy_stop_extended_overlay(void *status)
{
}

static void dummy_split_voice(void *status)
{
}


backend_functions_t *new_dummy_functions (void)
{
  backend_functions_t *parser_fn;

  parser_fn = (backend_functions_t *) malloc (sizeof (backend_functions_t));
  parser_fn->normal_tone = dummy_normal_tone;
  parser_fn->text = dummy_text;
  parser_fn->reserved = dummy_reserved;
  parser_fn->tex = dummy_tex;
  parser_fn->score_linebreak = dummy_score_linebreak;
  parser_fn->linebreak = dummy_linebreak;
  parser_fn->startmusicline = dummy_startmusicline;
  parser_fn->endmusicline = dummy_endmusicline;
  parser_fn->tune_completed = dummy_tune_completed;
  parser_fn->eof = dummy_eof;
  parser_fn->comment = dummy_comment;
  parser_fn->specific = dummy_specific;
  parser_fn->startinline = dummy_startinline;
  parser_fn->closeinline = dummy_closeinline;
  parser_fn->field = dummy_field;
  parser_fn->words = dummy_words;
  parser_fn->part = dummy_part;
  parser_fn->voice = dummy_voice;
  parser_fn->length = dummy_length;
  parser_fn->default_length = dummy_default_length;
  parser_fn->blankline = dummy_blankline;
  parser_fn->refno = dummy_refno;
  parser_fn->tempo = dummy_tempo;
  parser_fn->timesig = dummy_timesig;
  parser_fn->octave = dummy_octave;
  //parser_fn->info_key = dummy_info_key;
  parser_fn->info = dummy_info;
  parser_fn->key = dummy_key;
  parser_fn->microtone = dummy_microtone;
  parser_fn->temperament = dummy_temperament;
  parser_fn->graceon = dummy_graceon;
  parser_fn->graceoff = dummy_graceoff;
  parser_fn->rep1 = dummy_rep1;
  parser_fn->rep2 = dummy_rep2;
  parser_fn->playonrep = dummy_playonrep;
  parser_fn->tie = dummy_tie;
  parser_fn->slur = dummy_slur;
  parser_fn->sluron = dummy_sluron;
  parser_fn->sluroff = dummy_sluroff;
  parser_fn->rest = dummy_rest;
  parser_fn->mrest = dummy_mrest;
  parser_fn->spacing = dummy_spacing;
  parser_fn->bar = dummy_bar;
  parser_fn->space = dummy_space;
  parser_fn->lineend = dummy_lineend;
  parser_fn->broken = dummy_broken;
  parser_fn->tuple = dummy_tuple;
  parser_fn->chordon = dummy_chordon;
  parser_fn->chordoff = dummy_chordoff;
  parser_fn->str_decoration = dummy_str_decoration;
  parser_fn->char_decoration = dummy_char_decoration;
  parser_fn->gchord = dummy_gchord;
  parser_fn->note = dummy_note;
  parser_fn->note_end = dummy_note_end;
  parser_fn->abbreviation = dummy_abbreviation;
  parser_fn->acciaccatura = dummy_acciaccatura;
  parser_fn->start_extended_overlay = dummy_start_extended_overlay;
  parser_fn->stop_extended_overlay = dummy_stop_extended_overlay;
  parser_fn->split_voice = dummy_split_voice;
  return parser_fn;
}
