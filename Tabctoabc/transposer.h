/* transposer.h
 *
 * Part of abc2abc/Toadflax
 *
 * Copyright (C) James Allwright 2020
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Additionally, the transposer module, consisting of the files
 * transposer.c, transposer.h and transposer_desc.txt may be
 * used under the terms of the GNU Lesser General Public License
 * version 3.
 *
 * header file to support transposing abc notation
 */

#ifndef TRANSPOSER_H
#define TRANSPOSER_H 1

#include "string_utils.h"
#include "music_utils.h"
#include "parser_utils.h"

typedef struct transpose_info {
  int transpose_semitones;
  apply_acc_t src;
  apply_acc_t target;
  int sharps_preferred;
} transpose_info_t;


/* functions provided by the transposer module */
void init_transpose_info(transpose_info_t *t);
/* functions to set up/maintain transposer tables */
/* ordinary transpose */
void transposer_set_key(error_object_t *error_obj, transpose_info_t *t,
  int src_sharps, int *target_sharps, music_mode_t mode_index,
  const char *mode_name, 
  int explicit_key, char exp_modmap[7], int exp_modmul[7],
  int transpose_semitones, char *newkey_string);
/* choose desired target key signature */
void transposer_force_keysig(error_object_t * error_obj, transpose_info_t * t,
  int src_sf, int target_sf,
  music_mode_t mode_index, const char *mode_name,
  char *newkey_string);
/* choose K:none */
void transposer_set_key_target_none (error_object_t * error_obj,
  transpose_info_t * t, int src_sharps, int sharps_preferred,
  int explicit_key, char exp_modmap[7], int exp_modmul[7],
  int transpose_semitones);
void transposer_bar_reset(transpose_info_t *t);
/* functions to do the work of transposing things */
void transpose_note(transpose_info_t *t,
  char src_note, char src_accidental, int src_mult, int src_octave,
  char *note_out, char *accidental_out, int *mult_out, int *octave_out);
int transpose_guitar_chord(transpose_info_t *t, char src_note, char src_acc,
  char *target_note, char *target_acc);
void set_accidentals_for_keysig (int sf, char key_acc[7]);

#endif /* TRANSPOSER_H */
