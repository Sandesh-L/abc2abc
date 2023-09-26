/* music_utils.h
 *
 * Copyright (C) James Allwright 2020
 *
 * part of abc2abc/Toadflax
 *
 * header file to export basic music manipulation functions.
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
 * Additionally, the music_utils module, consisting of the files
 * music_utils.c, music_utils.h and music_utils_desc.txt may be
 * used under the terms of the GNU Lesser General Public License
 * version 3.
 */
#ifndef MUSIC_UTILS_H
#define MUSIC_UTILS_H 1

extern const char note_array[];

typedef enum noteletter {
  note_c = 0,
  note_d = 1,
  note_e = 2,
  note_f = 3,
  note_g = 4,
  note_a = 5,
  note_b = 6
} noteletter_t;


/* These are musical modes. Each specifies a scale of notes starting on a
 * particular root note. The root note can also be called the tonic.
 * Effectively the notes are the same as used in a
 * major scale, but the starting note is different. This means that each
 * mode can be notated using the standard key signatures used for major
 * keys. The abc standard specifies that only the first 3 characters of
 * the mode are significant, and further that "minor" can be abbreviated
 * as "m" and "major" omitted altogether. The full names are:
 * Major, Minor, Aeolian, Locrian, Ionian, Dorian, Phyrgian, Lydian and
 * Mixolydian. In addition, we have "exp" short for "explicit" to indicate
 * that arbitrary accidentals can be applied to each stave line in the
 * key signature and "" the empty string to represent "major" where this
 * is inferred as the default value rather than being supplied.
 */
typedef enum music_mode {
  mode_major,
  mode_minor,
  mode_m, /* minor may be abbreviated to m */
  mode_aeolian, /* same as minor */
  mode_locrian,
  mode_ionian, /* same as major */
  mode_dorian,
  mode_phrygian,
  mode_lydian,
  mode_mixolydian,
  mode_exp, /* not a real mode */
  mode_unknown
} music_mode_t;
#define NUM_MUSIC_MODES 12

#define MODE_DEFAULT_MAJOR 11
#define MODE_EXP 10

/* There are only 3 different types of drawn clef. The other clefs are
 * obtained by drawing one of the basic clefs, but sitting on a different
 * stave line. For convenience, the abc standard 2.2 numbers these lines
 * 1 to 5, with the bottom line being 1 and the top line being 5.
 */
typedef enum basic_cleftype {
  basic_clef_treble,
  basic_clef_bass,
  basic_clef_alto,
  basic_clef_undefined, /* for when we didn't find a clef */
  basic_clef_auto, /* drawing program has free choice of clef */
  basic_clef_perc, /* percussion */
  basic_clef_none  /* from abc standard 2.2 what does this mean ? */
} basic_cleftype_t;

typedef struct new_cleftype {
  basic_cleftype_t basic_clef;
  int staveline;
  int octave_offset;
  int named;
} cleftype_t;

/* The transposer supports notes in the range 0 - NOTE_RANGE after
 * mapping. This limit is needed so we don't have to declare an
 * array of infinte size to hold applied accidentals.
 */
#define NOTE_RANGE 105

/* structure used to hold the state for working out the currently
 * applicable accidental. The rules are :
 * 1. If the note is immediately preceded by an accidental or accidentals,
      then that accidental is applied to the note.
 * 2. If there is no accidental immediately preceding that note, but that
 *    note (in the same octave) has previously appeared in the bar, the
 *    accidentals that apply to that note apply to this note too.
 * 3. If neither of the above rules apply, any accidentals in the current
 *    key signature apply. Accidentals in the key signature apply to
 *    the specified note (A - G) in every octave.
 */
typedef struct apply_acc {
  /* array to hold accidentals in key signature */
  char key_acc[7];
  /* array to hold accidentals applied in current bar */
  char staveline_acc[NOTE_RANGE];
  /* array to hold number of accidentals applied in current bar 
   * This allows us to recognise double sharp and double flat.
   */
  int staveline_mult[NOTE_RANGE];
} apply_acc_t;

/* note operations */
noteletter_t note_index(char note_ch);
int semitone_value_for_note(noteletter_t note);
int semitone_shift_for_acc(char acc);
void note_for_semitone(int semitones, noteletter_t *note, char *accidental);

/* key signature operations */
music_mode_t get_music_mode(const char *modestr);
int get_sf_for_root(const char *rootnote);
int get_sfshift_for_mode(music_mode_t mode);
int get_sf(const char *rootnote, music_mode_t mode);
int normalize_sf(int sf, char acc);

/* clef operations */
void init_new_clef(cleftype_t *new_clef);
void copy_clef(cleftype_t *target_clef, cleftype_t *source_clef);
int get_standard_clef (const char *name, cleftype_t *new_clef);
int get_other_clef_details (const char *name, cleftype_t *new_clef);
int get_any_clef_details (const char *name, cleftype_t * new_clef);
int get_clef_name (cleftype_t *new_clef, char *name);

/* tuple operations */
void get_tuple_parameters(int *tuplefactor_num, int *tuplefactor_denom,
  int *tuplenotes, int timesig_num, int n, int q, int r);

/* bar length checking */
void reduce (int *a, int *b);

/* accidental tracking funcions */
void acc_tracking_init(apply_acc_t *acc_state);
void acc_update_keysig(apply_acc_t *acc_state, int sf);
void acc_reset_bar(apply_acc_t *acc_state);
int acc_update_note(apply_acc_t *acc_state, char src_note, char src_accidental, int src_mult, int src_octave);

int get_staveline_index (int key_staveline, int octave);
void set_accidentals_for_keysig (int sf, char key_acc[7]);
void get_default_accidental (apply_acc_t * apply_acc,
                             int key_index, int current_bar_staveline,
                             char *acc, int *mult);
#endif /* MUSIC_UTILS_H 1 */
