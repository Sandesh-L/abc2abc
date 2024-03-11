/* parseabc.h - interface file for abc parser
 * used by abc2midi, abc2abc, yaps and toadflax
 * Copyright (C) James Allwright and Others 2020
 *
 * This file may be copied and re-used under the terms of
 * the GNU license.
 */

/* abc.h must be #included before this file */
/* functions and variables provided by parseabc.c */

/* the arg list to event_voice keeps growing; if we put the args into a structure
and pass that around, routines that don't need the new ones need not be altered.
NB. event_voice is *called* from parseabc.c, the actual procedure is linked
in from the program-specific file */
/* added middle= stuff */

#ifndef PARSEABC_H
#define PARSEABC_H

#include <stdio.h>
#include "abc.h"
#include "string_utils.h"
#include "parser_interface.h"
#include "parser_utils.h"
#include "../guitar/guitar_model.h"

/* #define SIZE_ABBREVIATIONS ('W' - 'H' + 1) [SS] 2016-09-20 */
/* must support H-W, h-w and ~ according to 2.2 standard */
#define SIZE_ABBREVIATIONS (2*('W' -'H' + 1) + 1)

/* linestat is used by -n for deciding when to generate a newline */
typedef enum linestattype
{ fresh, midmusic, endmusicline, postfield } linestattype_t;

typedef enum rep_processing
{
  PASS1_MAKE_BAR_LIST,
  PASS2_SUBSTITUTE_NEW_BARS,
  NO_NEW_REPS
} rep_processing_t;

/* convenience definition of pointer to char */
typedef char *char_p;

extern const int sharpmap[12];
extern const int flatmap[12];
extern const int base_sharpsym[12];
extern const int base_flatsym[12];
extern const char hikey[7];
extern const char lowkey[7];
extern const char symlet[3];

/* struct to record location of each bar symbol.
 * needed to allow us to go back with a second pass fixing repeats.
 */
typedef struct bar_record {
  int bar_type;
  int new_bar_type;
  int bar_is_short;
  struct bar_record *next;
  struct fract barunits;
} bar_record_t;
typedef bar_record_t *bar_record_p;

/* struct to hold state variables which may be different for each voice */
typedef struct voice_context {
  char name[31]; /* abc 2.2 standard allows voice name instead of number */
  int expect_repeat; /* whether we expect to see a repeat section end :| */
  int repeat_count; /* supports nested repeats */
  timesig_details_t timesig;
  cleftype_t clef; /* clef currently active for voice */
  int unitlen; /* unitlen value currently active in voice */
  int barno;
  struct fract barcount;   /* sum of note lengths in current bar */
  int last_bar_type;
  int extended_bar;
  bar_record_t *bars_in_tune;
  bar_record_t *current_bar;
} voice_context_t;

#define MAX_VOICES 30

/* we use an array of these structs for mapping between
 * single characters and their abbreviations as defined
 * by U: or which are one of the default set.
 *
 * where decoration_type_t is DEC_TEXT, the abbreviation
 * is a string to be handled by char_gchord()
 */
typedef struct abbreviation {
  decoration_type_t type;
  char *string;
} abbreviation_t;

/* this struct is used to keep track of what has been set in the
 * abc music we are parsing.
 */
typedef struct parser_status {
  /* common variables shared by programs using the parser */

  /* variables initialized at the start of every tune */
  timesig_details_t master_timesig;
  cleftype_t master_clef;
  int has_timesig;
  int master_unitlen; /* L: field value is 1/unitlen */
  int voicenum; /* current voice number */
  int has_voice_fields;
  int num_voices;
  struct fract chord_len1; /* length of first note in chord */
  int parserinchord;
  int notesinchord;
  int ingrace;                    /* are we in a grace note set { } ? */
  int tuplenotes;
  struct fract tuplefactor;
  int inline_field;
  int slur; /* for 's' slurs, tracks if we are inside or outside a slur */
  int tune_ready;
  voice_context_t voice_state[MAX_VOICES];
  abc_text_lines_t original_tune;

  /* variables initialized once at the start of the program */
  parse_state_t state;
  int plus_is_chord;
  int plus_is_dec;
  int repcheck;
  int barcheck;
  char *inputline;    /* [SS] 2011-06-07 2012-11-22 */
  abbreviation_t abbreviation[SIZE_ABBREVIATIONS];
  int new_refno;
  decoration_context_t dec_context;
  char lastfieldcmd;   /* part of logic for handling +: */
  struct fract setmicrotone;   /* [SS] 2014-01-07 */
  int temperament;            /* [SS] 2020-06-25 */
  error_object_t error_obj;
  int error_ch;   /* character at which error was detected */
  const char *src_line; /* line being parsed for error reporting */
  void *tune_data;
  /* func will point at either dummy_funcs or main_funcs */
  backend_functions_t *func;
  /* dummy_funcs and main_funcs each own a backend_functions_t object
   * we free these when we are done and never free func */
  backend_functions_t *dummy_funcs;
  backend_functions_t *main_funcs;
  int new_reps;
  rep_processing_t rep_handling;
  int textinbody;

  // file output for noteLocation Guitar Tab
  char* note_locations_file;
  FILE* note_locations_file_ptr;
  char* movement_costs_file;
  FILE* movement_costs_file_ptr;
  NoteLocation* prev_note_locations;
  int prev_note_locations_size;
  int note_count;

} parser_status_t;

void init_timesig(timesig_details_t *timesig);
void copy_timesig(timesig_details_t *destination, timesig_details_t *source);
void init_parser_status(parser_status_t *status);
void free_parser_status(parser_status_t *status);
int readnumf(parser_status_t *status, const char *num);
int readsnumf(parser_status_t *status, const char *s);
int *checkmalloc(int size);
char *concatenatestring(char *s1, char *s2);
char *lookup_abbreviation(abbreviation_t abbreviation[], char symbol, decoration_type_t *dec);
int ismicrotone(parser_status_t *status, const char **p, int dir);

int parsekey (parser_status_t *status, const char *str);
void parser_start_abcfile (parser_status_t * status);
void parser_end_abcfile (parser_status_t * status);
void parseline_main (parser_status_t * status, char *line);
void parseline (parser_status_t * status, char *line);
int abbrev_index(char ch);
char *lookup_abbreviation (abbreviation_t abbreviation[], char symbol, decoration_type_t *dec);
void free_abbreviations (abbreviation_t abbreviation[]);

/* defined in dummy_functions.c */
backend_functions_t *new_dummy_functions(void);

#endif /* PARSEABC_H */
