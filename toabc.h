/* toabc.h
 *
 * Declares structs and functions used in toabc.c
 * Copyright (C) 2020 James Allwright
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

#ifndef TOABC_H
#define TOABC_H 1

#include "transposer.h"

struct lyricwords
{
  struct lyricwords *nextverse;
  char *words;
};

typedef struct complex_barpoint {
  struct fract break_here[8];
} complex_barpoint_t;

typedef struct voicetype
{                               /* information needed for each voice */
  int number;                   /* voice number from V: field */
  int drumchan;
  complex_barpoint_t bar_break; /* where to put spaces for complex time */
} voicetype_t;

typedef struct conversion_state {
  abc_text_lines_t *abc_output;
  struct vstring abc_buffer;
  int have_spacing_scheme;
  int compact_lengths;            /* use / instead of /2 */
  struct fract breakpoint;        /* used to break bar into beamed sets of notes */
  complex_barpoint_t master_bar_break;
  int newspacing;                 /* was -s option selected ? */
  int fixL;                       /* fix L: field (default length) */
  int echeck;                     /* was error-checking turned off ? (-e option) */
  int eaftertune;                 /* report errors at the end of each tune (-E) */
  int notecount;
  int bars_per_line;              /* number supplied after -n option */
  int barend;
  int transpose;                  /* number of semitones to transpose by (-t option) */
  struct fract lenfactor;         /* fraction to scale note lengths; -v,-d options */
  int nokeysig;
  int newkey;                     /* key after transposition (expressed as no. of sharps) */
  int inlinefield;                /* boolean - are we in [<field>: ] ? */
  int output_on;              /* if 0 suppress output */
  int passthru;               /* output original abc file [SS] 2011-06-07 */
  long selected_voices;      /* all voices are selected [PHDM] 2013-03-08 */
  int newrefnos;             /* boolean for -X option (renumber X: fields) */
  int newref;                /* next new number for X: field */
  int useflats;              /* flag associated with nokey. */
  int usekey;
  int changekeysig;
  int drumchan;               /* flag to suppress transposition */
  voicetype_t voice[MAX_VOICES];
  int enable_output[MAX_VOICES];
  int voicecount;
  int this_voice;
  int next_voice;
  transpose_info_t transpose_info;
} conversion_state_t;

conversion_state_t *new_conversion_state(void);
conversion_state_t *free_conversion_state(conversion_state_t *conv);

// void conversion_note(parser_status_t *status,
//                       decoration_context_t *dec_context,
//                       cleftype_t *clef,
//                       char xaccidental, int xmult, char xnote, int xoctave,
//                       int n, int m);
void conversion_error(error_object_t *error_obj, char *s);
void conversion_warning(error_object_t *error_obj, char *s);

void parse_voices_selection (void *vstatus, char *voices_string, int enable[]);
backend_functions_t *new_conversion_functions(void);

#endif /* TOABC_H */
