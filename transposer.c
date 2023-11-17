/* transposer.c
 *
 * Part of abc2abc/Toadflax
 *
 * Copyright (C) James Allwright 2020
 *
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
 * This provides functions for transposing notes.
 * Some basic background :
 * An octave is defined as the interval between a note and another note
 * of twice the frequency. On a piano keyboard there are 7 white notes
 * and 5 black notes in an octave. For these 12 notes, the ratio of
 * frequency between two consecutive notes is roughly the same (depending
 * on how the piano has been tuned). The jump between two consecutive
 * notes of this twelve note scale is called a semitone.
 * If we were only interested in playing in the key of C, which uses the
 * white notes and the lines and gaps on stave notation, things would be
 * simple and we would have no need of accidentals. The problem comes
 * when we want to notate the black notes. These sit between a line and
 * a gap between the lines on a stave in the key of C. We notate the note
 * either by writing the note below and adding a sharp symbol or writing
 * the note above and adding a flat symbol.
 * The system is further complicated by the following rules:
 * 1. If a note has a natural symbol, any sharps/flats that would otherwise
 * apply are ignored.
 * 2. If a note has no sharp/flat/natural symbol, but a previous note in
 * that bar on the same line/gap has a sharp/flat/natural symbol, then
 * that sharp/flat/natural symbol is applied.
 * 3. If a note has no accidentals implied by rules 1 and 2, then it takes
 * whatever accidentals occur for that note in the key signature.
 *
 * The standard key signatures apply up to 7 sharps to the lines and gaps
 * of the stave or up to 7 flats to the lines of the stave, in such a way
 * that the set of notes is equivalent to the scale of C major transposed
 * up or down by a whole number of semitones.
 *
 * The abc notation language adds a further complication by permitting
 * sharps and flats in the key signature to be added on an ad hoc basis.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "transposer.h"
#include "string_utils.h"
#include "music_utils.h"
#include "parser_utils.h" /* for error handling */

/* clear any accidentals set within the last bar */
void transposer_bar_reset (transpose_info_t * t)
{
  acc_reset_bar(&t->src);
  acc_reset_bar(&t->target);
}

/* initialize transpose_info_t to an empty state */
void init_transpose_info (transpose_info_t * t)
{
  acc_tracking_init(&t->src);
  acc_tracking_init(&t->target);
  t->transpose_semitones = 0;
  t->sharps_preferred = 1;
}

/* convert a sharps/flats value to a key signature string
 * The string will always be the major key signature
 */
static void sf_to_keysig_string (int sf, char *keysig)
{
  switch (sf) {
    case 0:
      strcpy (keysig, "C");
      break;
    case 1:
      strcpy (keysig, "G");
      break;
    case 2:
      strcpy (keysig, "D");
      break;
    case 3:
      strcpy (keysig, "A");
      break;
    case 4:
      strcpy (keysig, "E");
      break;
    case 5:
      strcpy (keysig, "B");
      break;
    case 6:
      strcpy (keysig, "F#");
      break;
    case 7:
      strcpy (keysig, "C#");
      break;
    case -1:
      strcpy (keysig, "F");
      break;
    case -2:
      strcpy (keysig, "Bb");
      break;
    case -3:
      strcpy (keysig, "Eb");
      break;
    case -4:
      strcpy (keysig, "Ab");
      break;
    case -5:
      strcpy (keysig, "Db");
      break;
    case -6:
      strcpy (keysig, "Gb");
      break;
    case -7:
      strcpy (keysig, "Cb");
      break;
    default:
      printf ("Internal error: sf_to_keysig_string given bad sf value %d\n", sf);
      exit (1);
      break;
  }
}

/* convert a major mode key signature string to a key signature
 * expressed as a number of sharps or flats
 */
static int keysig_string_to_sf (char *keysig)
{
  int sf;
  int i;
  /* list of major mode key signatures for
   * 0 sharps, 1 sharp, 2 sharps, ... 7 sharps */
  char *sharps_keys[] = { "C", "G", "D", "A", "E", "B", "F#", "C#" };
  /* list of major mode key signatures for 1 flat, 2 flats, ... 7 flats */
  char *flats_keys[] = { "F", "Bb", "Eb", "Ab", "Db", "Gb", "Cb" };

  for (sf = 0; sf <= 7; sf++) {
    if (strcmp (sharps_keys[sf], keysig) == 0) {
      return sf;
    }
  }
  for (i = 0; i < 7; i++) {
    if (strcmp (flats_keys[i], keysig) == 0) {
      return -(1 + i);
    }
  }
  return 10;                    /* outside range */
}

static int keysig_to_semitones (char *keysig)
{
  int semitones;

  semitones = semitone_value_for_note (note_index (keysig[0])) +
    semitone_shift_for_acc (keysig[1]);
  return semitones;
}

/* takes a keysig as a sharps/flats value, applies a transposition
 * of a given number of semitones, then works out the resulting
 * new keysig.
 */
int transpose_keysig (int sf, int transpose_semitones)
{
  char src_major_keysig[3];
  int semitones;
  noteletter_t keysig_note_index;
  char keysig_note;
  char keysig_acc;
  char new_major_keysig[3];

  /* convert sf keysig into a major mode keysig string */
  sf_to_keysig_string (sf, src_major_keysig);
  /* convert note from keysig into semitones */
  semitones = keysig_to_semitones (src_major_keysig);
  semitones = semitones + transpose_semitones + 12;
  note_for_semitone (semitones, &keysig_note_index, &keysig_acc);
  keysig_note = toupper (note_array[keysig_note_index]);
  new_major_keysig[0] = keysig_note;
  if (keysig_acc == '#') {
    int sf2;
    char alternative_major_keysig[3];

    /* work out alternative keysig using a flat instead */
    new_major_keysig[1] = '#';
    new_major_keysig[2] = '\0';
    sf = keysig_string_to_sf (new_major_keysig);
    if (keysig_note == 'G') {
      alternative_major_keysig[0] = 'A';
    } else {
      alternative_major_keysig[0] = keysig_note + 1;
    }
    alternative_major_keysig[1] = 'b';
    alternative_major_keysig[2] = '\0';
    sf2 = keysig_string_to_sf (alternative_major_keysig);
    /* pick whichever keysig gives the smallest number of accidentals */
    if (abs (sf) <= abs (sf2)) {
      return sf;
    } else {
      return sf2;
    }
  } else {
    new_major_keysig[1] = '\0';
    sf = keysig_string_to_sf (new_major_keysig);
    return sf;
  }
}

/* given a key signature as a number of sharps/flats, and a mode value,
 * generate a string to be used in the abc to represent that key.
 */
static void get_new_key_string (int target_sharps, music_mode_t mode_index,
                                const char *mode_name,
                                char *newkey_string)
{
  int modified_sf;

  modified_sf = target_sharps - get_sfshift_for_mode(mode_index);
  if (modified_sf > 6) {
    modified_sf = modified_sf - 12;
  }
  if (modified_sf < -6) {
    modified_sf = modified_sf + 12;
  }
  /* get the major mode key signature */
  sf_to_keysig_string (modified_sf, newkey_string);
  strcat (newkey_string, mode_name);
}

static int set_target_key_acc_table (error_object_t * error_obj,
                                     char src_key_acc[],
                                     int transpose_semitones,
                                     char target_key_acc[])
{
  int i;
  char src_note;
  char src_acc;
  noteletter_t target_note_index;
  char target_note;
  char target_acc;
  int semitones;
  int failed;

  for (i = 0; i < 7; i++) {
    target_key_acc[i] = ' ';
  }
  failed = 0;
  for (i = 0; i < 7; i++) {
    int j;

    /* get note and acc for entry in key_acc table */
    src_note = 'a' + ((i + 2) % 7);
    src_acc = src_key_acc[i];
    /* convert note, acc to semitones */
    semitones = semitone_value_for_note (note_index (src_note)) +
      semitone_shift_for_acc (src_acc);
    /* apply transposition */
    semitones = semitones + transpose_semitones;
    /* convert back into a note + accidental (always '#') */
    note_for_semitone (semitones, &target_note_index, &target_acc);
    target_note = note_array[target_note_index];
    if (target_acc != ' ') {
      j = note_index (target_note);
      if (target_key_acc[j] == ' ') {
        target_key_acc[j] = '^';
      } else {
        /* try it as next note up flattened */
        j = (j + 1) % 7;
        if (target_key_acc[j] == ' ') {
          target_key_acc[j] = '_';
        } else {
          report_error (error_obj, "Failed to transpose custom key signature");
          failed = 1;
        }
      }
    }
  }
  return failed;
}

static void get_custom_keysig (error_object_t * error_obj,
                               char key_acc[], int transpose_semitones,
                               char target_key_acc[], char *target_key_string)
{
  int i;
  int failed;

  failed =
    set_target_key_acc_table (error_obj, key_acc, transpose_semitones,
                              target_key_acc);
  if (failed) {
    for (i = 0; i < 7; i++) {
      target_key_acc[i] = ' ';
    }
    sprintf (target_key_string, "none");
    return;
  } else {
    /* notation problem with abc 2.2 K: field !
     * standard says we can use K:<tonic> exp <accidentals>
     * Unfortunately this creates confusion because e.g. K:D
     * can be both a key (D major) and a tonic (note D). As
     * a workaround for this, always use C which has no
     * accidentals as a key signature, and so gives the same
     * implied accidentals whether you interpret it as a key
     * or a tonic.
     */
    sprintf (target_key_string, "Cexp ");
    for (i = 0; i < 7; i++) {
      if (target_key_acc[i] != ' ') {
        sprintf (target_key_string + strlen (target_key_string), "%c%c ",
                 target_key_acc[i], note_array[i]);
      }
    }
  }
}

static void copy_exp_modmap (error_object_t * error_obj, transpose_info_t * t,
                             char exp_modmap[7], int exp_modmul[7])
{
  int i;

  for (i = 0; i < 7; i++) {
    int key_acc_index;

    /* map from index with a at 0 to index with c at 0 */
    key_acc_index = (i + 5) % 7;
    if ((exp_modmap[i] != ' ') && (exp_modmul[i] >= 1)) {
      if (exp_modmap[i] == '=') {
        /* natural appears as space (no change) in key_acc table */
        t->src.key_acc[key_acc_index] = ' ';
      } else {
        t->src.key_acc[key_acc_index] = exp_modmap[i];
      }
      if (exp_modmul[i] > 1) {
        report_warning (error_obj,
                        "Double accidentals in custom key signature not supported");
      }
    }
  }
}

void transposer_set_key_target_none (error_object_t * error_obj,
                                     transpose_info_t * t, int src_sharps,
                                     int sharps_preferred, int explicit_key,
                                     char exp_modmap[7], int exp_modmul[7],
                                     int transpose_semitones)
{
  /* reset transposer variables */
  init_transpose_info (t);
  t->transpose_semitones = transpose_semitones;
  /* set up source mapping array */
  set_accidentals_for_keysig (src_sharps, t->src.key_acc);
  t->sharps_preferred = sharps_preferred;
}

/* set up mapping arrays based on key signature */
/* also work out new key signature */
void transposer_set_key (error_object_t * error_obj, transpose_info_t * t,
                         int src_sharps, int *target_sharps, 
                         music_mode_t mode_index, const char *mode_name,
                         int explicit_key, char exp_modmap[7],
                         int exp_modmul[7], int transpose_semitones,
                         /* int none_sharps_pref, */
                         char *newkey_string)
{
  *target_sharps = transpose_keysig (src_sharps, transpose_semitones);
  /* reset transposer variables */
  init_transpose_info (t);
  t->transpose_semitones = transpose_semitones;
  /* set up source mapping array */
  set_accidentals_for_keysig (src_sharps, t->src.key_acc);
  if (!explicit_key) {
    set_accidentals_for_keysig (*target_sharps, t->target.key_acc);
    if (*target_sharps >= 0) {
      t->sharps_preferred = 1;
    } else {
      t->sharps_preferred = 0;
    }
  } else {
    /* set up accidentals as for normal case */
    set_accidentals_for_keysig (*target_sharps, t->target.key_acc);
    if (*target_sharps >= 0) {
      t->sharps_preferred = 1;
    } else {
      t->sharps_preferred = 0;
    }
    /* copy exp_modmap, exp_modmul */
    copy_exp_modmap (error_obj, t, exp_modmap, exp_modmul);
  }
  /* set up target mapping array */
  if (!explicit_key) {
    /* use standard transpose logic */
    get_new_key_string (*target_sharps, mode_index, mode_name, newkey_string);
  } else {
    /* more difficult - use custom function */
    get_custom_keysig (error_obj, t->src.key_acc, t->transpose_semitones,
                       t->target.key_acc, newkey_string);
  }
}

void transposer_force_keysig(error_object_t * error_obj, transpose_info_t * t,
  int src_sf, int target_sf, 
  music_mode_t mode_index, const char *mode_name,
  char *newkey_string)
{
  /* reset transposer variables */
  init_transpose_info (t);
  t->transpose_semitones = 0;
  set_accidentals_for_keysig (src_sf, t->src.key_acc);
  set_accidentals_for_keysig (target_sf, t->target.key_acc);
  if (target_sf < 0) {
    t->sharps_preferred = 0;
  } else {
    t->sharps_preferred = 1;
  }
  /* use standard transpose logic */
  get_new_key_string (target_sf, mode_index, mode_name, newkey_string);
}

/* convert a pitch in semitones to note + accidental
 * we take into account the target key signature
 * and whether it uses sharps or flats
 * in deciding how to represent a note
 */
static void semitones_to_note (int semitones,
                               char target_keysig_acc[],
                               char *target_accidental,
                               int *target_mult,
                               char *target_note,
                               int *target_octave, int sharps_preferred)
{
  int octave;

  octave = semitones / 12;
  switch (semitones % 12) {
    case 0:                    /* c */
      if ((sharps_preferred == 1) &&
          (target_keysig_acc['b' - 'c' + 7] == '^') &&
          (target_keysig_acc['c' - 'c'] == '^')) {
        /* if key signature sharpens both b and c, preferred
         * representation of c is as b sharp.
         */
        *target_note = 'b';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave - 1; /* b is in the octave below */
      } else {
        *target_note = 'c';
        *target_accidental = ' ';
        *target_mult = 0;
        *target_octave = octave;
      }
      break;
    case 1:                    /* c # */
      if (sharps_preferred) {
        *target_note = 'c';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'd';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave;
      }
      break;
    case 2:                    /* d */
      *target_note = 'd';
      *target_accidental = ' ';
      *target_mult = 0;
      *target_octave = octave;
      break;
    case 3:                    /* d # */
      if (sharps_preferred) {
        *target_note = 'd';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'e';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave;
      }
      break;
    case 4:                    /* e */
      if ((sharps_preferred == 0) &&
          (target_keysig_acc['e' - 'c'] == '_') &&
          (target_keysig_acc['f' - 'c'] == '_')) {
        /* if key signature flattens both e and f, preferred
         * representation of e is as f flat.
         */
        *target_note = 'f';
        *target_accidental = '_';
        *target_mult = 0;
        *target_octave = octave;
      } else {
        *target_note = 'e';
        *target_accidental = ' ';
        *target_mult = 0;
        *target_octave = octave;
      }
      break;
    case 5:                    /* f */
      if ((sharps_preferred == 1) &&
          (target_keysig_acc['e' - 'c' + 7] == '^') &&
          (target_keysig_acc['f' - 'c'] == '^')) {
        /* if key signature sharpens both e and f, preferred
         * representation of f is as e sharp.
         */
        *target_note = 'e';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'f';
        *target_accidental = ' ';
        *target_mult = 0;
        *target_octave = octave;
      }
      break;
    case 6:                    /* f # */
      if (sharps_preferred) {
        *target_note = 'f';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'g';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave;
      }
      break;
    case 7:                    /* g */
      *target_note = 'g';
      *target_accidental = ' ';
      *target_mult = 0;
      *target_octave = octave;
      break;
    case 8:                    /* g # */
      if (sharps_preferred) {
        *target_note = 'g';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'a';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave;
      }
      break;
    case 9:                    /* a */
      *target_note = 'a';
      *target_accidental = ' ';
      *target_mult = 0;
      *target_octave = octave;
      break;
    case 10:                   /* a # */
      if (sharps_preferred) {
        *target_note = 'a';
        *target_accidental = '^';
        *target_mult = 1;
        *target_octave = octave;
      } else {
        *target_note = 'b';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave;
      }
      break;
    case 11:                   /* b */
      if ((sharps_preferred == 0) &&
          (target_keysig_acc['b' - 'c' + 7] == '_') &&
          (target_keysig_acc['c' - 'c'] == '_')) {
        /* if key signature flattens both b and c, preferred
         * representation of b is as c flat.
         */
        *target_note = 'c';
        *target_accidental = '_';
        *target_mult = 1;
        *target_octave = octave + 1; /* c is in the octave above */
      } else {
        *target_note = 'b';
        *target_accidental = ' ';
        *target_mult = 0;
        *target_octave = octave;
      }
      break;
    default:
      printf ("Internal error: Unexpected semitones value %d\n", semitones);
      break;
  }
  /* if we have selected a note with no accidental, but the
   * key signature would apply an accidental, then we will need
   * to use a natural in front of it.
   */
  if ((*target_accidental == ' ') &&
      (target_keysig_acc[note_index (*target_note)] != '_')) {
    *target_accidental = '=';
    *target_mult = 1;
  }
}

/* After transposing a note, work out the accidental that we need to 
 * have before it. This is ' ' (a space) if no accidental is required.
 * This function also updates the tables for tracking accidentals.
 * We handle mult although we expect this never to be more than 1
 * because of how the transposition works.
 *
 * On calling, *target_accidental and *target_mult are set with
 * the desired effective accidental.
 */
void find_target_acc(apply_acc_t *target_acc, int target_note,
  int target_octave, char *target_accidental, int *target_mult)
{
  int target_staveline_index;
  int target_keysig_index;
  char effective_target_acc;
  int effective_target_mult;

  /* work out the currently applicable accidental */
  target_keysig_index = note_index (target_note);
  target_staveline_index =
    get_staveline_index (target_keysig_index, target_octave);
  get_default_accidental (target_acc, target_keysig_index, target_staveline_index,
                          &effective_target_acc, &effective_target_mult);
  /* work out if we need to explicitly set accidental in order 
   * to get target_accidental */
  if (((*target_accidental == ' ') && (effective_target_acc == ' ')) ||
      ((*target_accidental == '=') && (effective_target_acc == ' ')) ||
      ((*target_accidental == ' ') && (effective_target_acc == '=')) ||
      ((*target_accidental == effective_target_acc) &&
       (*target_mult == effective_target_mult))) {
    /* safe to use no accidental on note as the rules already give
     * the accidental we want.
     */
    *target_accidental = ' ';
    *target_mult = 0;
  } else {
    /* we need to set the accidental to be what we need here */
    if (*target_accidental == ' ') {
      *target_accidental = '=';
      *target_mult = 1;
    }
  }
  /* now set global staveline */
  if (*target_accidental != ' ') {
    target_acc->staveline_acc[target_staveline_index] = *target_accidental;
    target_acc->staveline_mult[target_staveline_index] = *target_mult;
  }
}

/* transpose a single note  using the following steps :
 * firstly, decide on the correct accidental to apply -
 * 1. If note comes with an accidental, use that
 * 2. Otherwise use any previously applied accidentals in the bar.
 * 3. Otherwise use accidentals taken from the key signaure.
 * These steps result in an effective_accidental.
 *
 * Work out the pitch of the note in semitones.
 * Convert this pitch value into a new note and accidental value,
 * where we prefer to use a sharp if the key signature uses sharps
 * and a flat if the key signature uses flats.
 *
 */
void transpose_note (transpose_info_t * t,
                     char src_note, char src_accidental, int src_mult,
                     int src_octave, char *note_out, char *accidental_out,
                     int *mult_out, int *octave_out)
{
  int effective_semitones;
  int new_semitones;
  char target_accidental;
  int target_mult;
  char target_note;
  int target_octave;
  effective_semitones = acc_update_note(&t->src, src_note, src_accidental,
     src_mult, src_octave);

  /* apply transpose */
  new_semitones = effective_semitones + t->transpose_semitones;

  /* convert transposed note back to target note and accidental */
  semitones_to_note (new_semitones,
                     t->target.key_acc,
                     &target_accidental,
                     &target_mult,
                     &target_note, &target_octave, t->sharps_preferred);

  /* now convert value back to note + accidental in target key mapping
   * the desired accidental may already apply, so only return an
   * accidental if it needs to appear in the generated music.
   */
  find_target_acc(&t->target, target_note, target_octave,
      &target_accidental, &target_mult);

  *note_out = target_note;
  *accidental_out = target_accidental;
  *mult_out = target_mult;
  *octave_out = target_octave - 4;
}

/* given note + accidental from within a guitar chord, transpose it.
 * return 0 if we don't have a valid guitar chord, 1 otherwise
 * The convention assumed here is that key signature and
 * accidentals marked on the stave never affect the guitar
 * chord, other than dictating whether we choose to use # or b.
 */
int transpose_guitar_chord (transpose_info_t * t, char src_note, char src_acc,
                            char *target_note, char *target_acc)
{
  char note;
  int semitones;
  int is_bass = 0;
  noteletter_t target_note_index;

  printf("transpose_guitar_chord has src_note %c src_acc %c\n",
     src_note, src_acc);
     
  if ((src_note >= 'A') && (src_note <= 'G')) {
    note = src_note;
  } else {
    if ((src_note >= 'a') && (src_note <= 'g')) {
      note = src_note;
      is_bass = 1;
    } else {
      /* not a guitar chord note. Don't attempt to transpose */
      return 0;
    }
  }
  /* takes a - g */
  semitones = semitone_value_for_note (note_index (note));
  if (src_acc == '#') {
    semitones = semitones + 1;
  } else {
    if (src_acc == 'b') {
      semitones = semitones - 1;
    }
  }
  semitones = semitones + t->transpose_semitones;
  note_for_semitone (semitones, &target_note_index, target_acc);
  *target_note = toupper (note_array[target_note_index]);
  /* returns A - G */
  if ((t->sharps_preferred == 0) && (*target_acc == '#')) {
    /* use next note up flattened */
    *target_note = ((((int)*target_note) + 1 - 'A') % 7) + 'A';
    *target_acc = 'b';
  }
  if (is_bass) {
    *target_note = tolower (*target_note);
  }
  return 1;
}
