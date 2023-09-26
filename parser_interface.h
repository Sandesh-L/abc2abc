/* parser_interface.h - interface file for abc parser
 *
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

/* functions and variables provided by parseabc.c */

/* The arg list to (*voice_fn) keeps growing. 
 * If we put the args into a structure and pass that around, 
 * routines that don't need the new ones need not be altered.
 * NB. (*voice_fn) is *called* from parseabc.c, the actual procedure is linked
 * in from the program-specific file
 *
 * added middle= stuff
 */

#ifndef PARSER_INTERFACE_H
#define PARSER_INTERFACE_H

#include "abc.h"

/* non-zero values for append in words_fn() */
#define W_PLUS_FIELD 1
#define PLUS_FIELD 2

typedef void (*normal_tone_fn)(void *status);
typedef void (*text_fn)(void *status, const char *s);
typedef void (*reserved_fn)(void *status, char p);
typedef void (*tex_fn)(void *status, const char *s);
typedef void (*score_linebreak_fn)(void *vstatus, char ch);
typedef void (*linebreak_fn)(void *status);
typedef void (*startmusicline_fn)(void *status);
typedef void (*endmusicline_fn)(void *status, char endchar);
typedef void (*tune_completed_fn)(void *status);
typedef void (*eof_fn)(void *status);
typedef void (*comment_fn)(void *status, const char *s);
typedef void (*bad_command_fn)(void *status, const char *s);
typedef void (*specific_fn)(void *status, char *package, const char *s);
typedef void (*specific_in_header_fn)(void *status, char *package, char *s);
typedef void (*startinline_fn)(void *status);
typedef void (*closeinline_fn)(void *status);
typedef void (*field_fn)(void *status, char k, const char *f);
typedef void (*words_fn)(void *status, const char *p, int append, int continuation);
typedef void (*part_fn)(void *status, const char *s);
typedef void (*voice_fn)(void *status, int n, const char *s, struct voice_params *params);
typedef void (*length_fn)(void *status, int n);
typedef void (*default_length_fn)(void *status, int n);
typedef void (*blankline_fn)(void *status);
typedef void (*refno_fn)(void *status, int n);
typedef void (*tempo_fn)(void *status, int n, int a, int b, int rel, char *pre, char *post);
typedef void (*timesig_fn)(void *status, timesig_details_t *timesig);
typedef void (*octave_fn)(void *status, int num, int local);
//typedef void (*info_key_fn)(void *status, char *key, const char *value);
typedef void (*info_fn)(void *status, const char *s);
typedef void (*key_fn)(void *status, int sharps, const char *s,
               music_mode_t modeindex, const char *mode_name,
               char modmap[7], int modmul[7], struct fract modmicro[7],
               struct key_params *params);
typedef void (*microtone_fn)(void *status, int dir, int a, int b);
typedef void (*temperament_fn)(void *status, const char *line);
typedef void (*graceon_fn)(void *status);
typedef void (*graceoff_fn)(void *status);
typedef void (*rep1_fn)(void *status);
typedef void (*rep2_fn)(void *status);
typedef void (*playonrep_fn)(void *status, char *s);
typedef void (*tie_fn)(void *status);
typedef void (*slur_fn)(void *status, int t);
typedef void (*sluron_fn)(void *status, int t);
typedef void (*sluroff_fn)(void *status, int t);
typedef void (*rest_fn)(void *status, decoration_context_t *dec_context, int n,int m,int type);
typedef void (*mrest_fn)(void *status, int n, int m, char c);
typedef void (*spacing_fn)(void *status, int n, int m);
typedef void (*bar_fn)(void *status, decoration_context_t *dec_context, int type, char *replist);
typedef void (*space_fn)(void *status, int count);
typedef void (*lineend_fn)(void *status, char ch, int n);
typedef void (*broken_fn)(void *status, int type, int mult);
typedef void (*tuple_fn)(void *status, int n, int q, int r);
typedef void (*chordon_fn)(void *status, char open_char);
typedef void (*chordoff_fn)(void *status, int n, int m, char close_char);
typedef void (*str_decoration_fn)(void *status, char *s);
typedef void (*char_decoration_fn)(void *status, char ch);
typedef void (*char_gchord_fn)(void *status, char ch);
typedef void (*gchord_fn)(void *status, char pos, char *s);
typedef void (*note_fn)(void *status, decoration_context_t *dec_context,
                       cleftype_t *clef, char accidental, int mult, 
                       char note, int xoctave, int n, int m);
typedef void (*note_end_fn)(void *status);
typedef void (*abbreviation_fn)(void *status, char symbol, const char *string, char container);
typedef void (*acciaccatura_fn)(void *status);
typedef void (*start_extended_overlay_fn)(void *status);
typedef void (*stop_extended_overlay_fn)(void *status);
typedef void (*split_voice_fn)(void *status);

typedef struct backend_functions
{
  normal_tone_fn normal_tone;
  text_fn text;
  reserved_fn reserved;
  tex_fn tex;
  score_linebreak_fn score_linebreak;
  linebreak_fn linebreak;
  startmusicline_fn startmusicline;
  endmusicline_fn endmusicline;
  tune_completed_fn tune_completed;
  eof_fn eof;
  comment_fn comment;
  bad_command_fn bad_command;
  specific_fn specific;
  specific_in_header_fn specific_in_header;
  startinline_fn startinline;
  closeinline_fn closeinline;
  field_fn field;
  words_fn words;
  part_fn part;
  voice_fn voice;
  length_fn length;
  default_length_fn default_length;
  blankline_fn blankline;
  refno_fn refno;
  tempo_fn tempo;
  timesig_fn timesig;
  octave_fn octave;
  //info_key_fn info_key;
  info_fn info;
  key_fn key;
  microtone_fn microtone;
  temperament_fn temperament;
  graceon_fn graceon;
  graceoff_fn graceoff;
  rep1_fn rep1;
  rep2_fn rep2;
  playonrep_fn playonrep;
  tie_fn tie;
  slur_fn slur;
  sluron_fn sluron;
  sluroff_fn sluroff;
  rest_fn rest;
  mrest_fn mrest;
  spacing_fn spacing;
  bar_fn bar;
  space_fn space;
  lineend_fn lineend;
  broken_fn broken;
  tuple_fn tuple;
  chordon_fn chordon;
  chordoff_fn chordoff;
  str_decoration_fn str_decoration;
  char_decoration_fn char_decoration;
  char_gchord_fn char_gchord;
  gchord_fn gchord;
  note_fn note;
  note_end_fn note_end;
  abbreviation_fn abbreviation;
  acciaccatura_fn acciaccatura;
  start_extended_overlay_fn start_extended_overlay;
  stop_extended_overlay_fn stop_extended_overlay;
  split_voice_fn split_voice;
} backend_functions_t;

#endif /* PARSER_INTERFACE_H */
