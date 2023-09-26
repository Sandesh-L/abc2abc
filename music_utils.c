/* music_utils.c
 *
 * Copyright (C) James Allwright 2020
 *
 * This file provides basic functions for manipulating music
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
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "music_utils.h"

typedef struct clef_item
{
  char *name;
  basic_cleftype_t basic_clef;
  int staveline;
  int octave_offset;
} clef_item_t;

/* entries are name, basic_clef, staveline, octave_offset */
static const clef_item_t clef_conversion_table[] = {
  {"treble", basic_clef_treble, 2, 0},
  {"alto", basic_clef_alto, 3, 0},
  {"bass", basic_clef_bass, 4, 0},
  {"soprano", basic_clef_alto, 1, 0},
  {"mezzosoprano", basic_clef_alto, 2, 0},
  {"tenor", basic_clef_alto, 4, 0},
  {"baritone", basic_clef_bass, 0, 0},
};
#define NUM_CLEFS (sizeof(clef_conversion_table)/sizeof(clef_item_t))

/* The following 3 are not really clefs, but abc standard
 * 2.2 allows them. We treat them as treble clef and only
 * allow them after clef= . This ensures that K:none is not
 * interpreted as a clef instead of a key signature.
 *
 * the clef defines how a pitch value maps to a y position
 * on the stave. If there is a clef of "none", then you don't
 * know where to put the notes!
 */
static const clef_item_t odd_clef_conversion_table[] = {
  {"auto", basic_clef_treble, 2, 0},
  {"perc", basic_clef_treble, 2, 0},
  {"none", basic_clef_treble, 2, 0}
};
#define NUM_ODD_CLEFS (sizeof(odd_clef_conversion_table)/sizeof(clef_item_t))


/* array giving notes in the order used by key_acc array 
 * This can be used to implement a lookup function which is
 * the reverse of note_index().
 */
const char note_array[] = "cdefgab";

/* This is a table for finding the sharps/flats representation of
 * a key signature for a given mode.
 * Suppose we want to find the sharps/flats representation for
 * K:GDor
 * If we know the major mode key K:G is 1 sharp, and have the index of the
 * mode we want within the mode table, we can work out the new key
 * signature as follows:
 *
 * Original major mode key signature +1 (1 sharp)
 * Desired new mode Dorian is at position 6 in table
 * modeshift[6] is -2.
 * new key signature is 1 - 2 = -1 (1 flat)
 * GDor is 1 flat.
 */
const int modeshift[12] = { 0, -3, -3, -3, -5, 0, -2, -4, 1, -1, 0, 0 };

/* convert a note a-g to an index into the key signature arrays
 * src.key_acc, target.key_acc, src_key_mult, target_key_mult
 */
noteletter_t note_index (char note_ch)
{

  switch (note_ch) {
    case 'c':
    case 'C':
      return note_c;
    case 'd':
    case 'D':
      return note_d;
    case 'e':
    case 'E':
      return note_e;
    case 'f':
    case 'F':
      return note_f;
    case 'g':
    case 'G':
      return note_g;
    case 'a':
    case 'A':
      return note_a;
    case 'b':
    case 'B':
      return note_b;
    default:
      printf ("Internal error: note_index called with bad value %c\n", note_ch);
      exit (1);
  }
}

/* convert a letter a - g into a note value in semitones */
int semitone_value_for_note (noteletter_t note)
{
  printf("%u \n",note);
  switch (note) {
    case note_c:
      return 0;
    case note_d:
      return 2;
    case note_e:
      return 4;
    case note_f:
      return 5;
    case note_g:
      return 7;
    case note_a:
      return 9;
    case note_b:
      return 11;
    default:
      printf ("Internal error: Unexpected note %d\n", note);
      return 0;
  }
}

/* convert an accidental indicator into a semitone shift */
int semitone_shift_for_acc (char acc)
{
  switch (acc) {
    case '_':
    case 'b':
      return -1;
    case '^':
    case '#':
      return 1;
    default:
      return 0;
  }
}

/* Given a semitone value 0 - 11, convert to note + accidental.
 * This function always returns sharp as the accidental
 */
void note_for_semitone (int semitones, noteletter_t * note, char *accidental)
{
  char note_for_semi[12] = "CCDDEFFGGAAB";
  char acc_for_semi[12] = " # #  # # # ";

  if (semitones < 0) {
    semitones = -(-semitones) % 12 + 12;
  }
  if (semitones > 11) {
    semitones = semitones % 12;
  }
  *note = note_index (note_for_semi[semitones]);
  *accidental = acc_for_semi[semitones];
}

/* key signature operations */
music_mode_t get_music_mode(const char *modestr)
{
  int i;
  char lmode[4];

  i = 0;
  while ((i < 3) && (i < strlen(modestr))) {
    lmode[i] = tolower(modestr[i]);
    i++;
  }
  lmode[i] = '\0';
  if (strcmp(lmode, "maj") == 0) {
    return mode_major;
  }
  if ((strcmp(lmode, "min") == 0) || (strcmp(lmode, "m") == 0)) {
    return mode_minor;
  }
  if (strcmp(lmode, "aeo") == 0) {
    return mode_aeolian;
  }
  if (strcmp(lmode, "loc" ) == 0) {
    return mode_locrian;
  }
  if (strcmp(lmode, "ion") == 0) {
    return mode_ionian;
  }
  if (strcmp(lmode, "dor") == 0) {
    return mode_dorian;
  }
  if (strcmp(lmode, "phr") == 0) {
    return mode_phrygian;
  }
  if (strcmp(lmode, "lyd") == 0) {
    return mode_lydian;
  }
  if (strcmp(lmode, "mix") == 0) {
    return mode_mixolydian;
  }
  if (strcmp(lmode, "exp") == 0) {
    return mode_exp;
  }
  return mode_unknown;
}

//const int modeshift[12] = { 0, -3, -3, -3, -5, 0, -2, -4, 1, -1, 0, 0 };
int get_sfshift_for_mode(music_mode_t mode)
{
  switch (mode) {
    case mode_major:
      return 0;
    case mode_minor:
    case mode_m:
      return -3;
    case mode_ionian: /* same as major */
      return 0;
    case mode_aeolian: /* same as minor */
      return -3;
    case mode_dorian:
      return -2;
    case mode_phrygian:
      return -4;
    case mode_lydian:
      return 1;
    case mode_locrian:
      return -5;
    case mode_mixolydian:
      return -1;
    default:
    case mode_unknown:
      return 0;
  }
}

/* sf must be in the range -7 to +7 (corresponding to between 7 flats
 * and 7 sharps. If it has gone outside this range, choose the
 * correct equivalent representation.
 *
 * if the root note has an accidental, choose suitable range for accidental
 * -5 to 7 for #
 * -7 to 5 for b
 * acc will be '\0' if there is no accidental.
 */
int normalize_sf(int sf, char acc)
{
  int new_sf;

  new_sf = sf;
  if (sf > 7) {
    new_sf = sf - 12;
  }
  if (sf < -7) {
    new_sf = sf + 12;
  }
  if ((acc == '#') && (new_sf <= -5)) {
    new_sf = new_sf + 12;
  }
  if ((acc == 'b') && (new_sf >= 5)) {
    new_sf = new_sf - 12;
  }
  return new_sf;
}

/* given root note A - G with optional # or b,
 * return the number of sharps/flats for a major scale
 * with that root note.
 */
int get_sf_for_root(const char *rootnote)
{
  int sf;
  /* all the keys ordered by the number of sharps/flats in the key */
  char *keys = "FCGDAEB";

  sf = strchr (keys, rootnote[0]) - keys - 1;
  if (rootnote[1] == '#') {
    sf = sf + 7;
  }
  if (rootnote[1] == 'b') {
    sf = sf - 7;
  }
  sf = normalize_sf(sf, rootnote[1]);
  return sf;
}

/* given a root note A .. G with optional # or b, together with a
 * mode (major, minor, dorian etc.) return the number of sharps or
 * flats to use in the key signature +7 = 7 sharps, -7 = 7 flats.
 *
 * Note that this function does not support custom addition of
 * sharps or flats on an adhoc basis into the key signature.
 */
int get_sf(const char *rootnote, music_mode_t mode_id)
{
  int sf;

  sf = get_sf_for_root(rootnote);
  sf = sf + get_sfshift_for_mode(mode_id);
  sf = normalize_sf(sf, rootnote[1]);
  return sf;
}

/* look for any octave shift specified after a clef name */
static int get_clef_octave_offset (const char *clef_ending)
{
  if (strncmp (clef_ending, "+8", 2) == 0) {
    return 1;
  }
  if (strncmp (clef_ending, "+15", 2) == 0) {
    return 2;
  }
  if (strncmp (clef_ending, "-8", 2) == 0) {
    return -1;
  }
  if (strncmp (clef_ending, "-15", 2) == 0) {
    return -2;
  }
  return 0;
}

void init_new_clef (cleftype_t * new_clef)
{
  new_clef->basic_clef = basic_clef_undefined;
  new_clef->staveline = 0;
  new_clef->octave_offset = 0;
  new_clef->named = 0;
}

/* copy contents of cleftype_t structure */
void copy_clef (cleftype_t * target_clef, cleftype_t * source_clef)
{
  target_clef->basic_clef = source_clef->basic_clef;
  target_clef->staveline = source_clef->staveline;
  target_clef->octave_offset = source_clef->octave_offset;
  target_clef->named = source_clef->named;
}

/* use lookup table to get details of clef from it's name string
 * this covers the clefs in older versions of the abc standard
 * which can appear without being preceded by "clef= */
int get_standard_clef (const char *name, cleftype_t * new_clef)
{
  int i;
  int len;

  for (i = 0; i < NUM_CLEFS; i++) {
    const clef_item_t *table_row = &clef_conversion_table[i];

    len = strlen (table_row->name);
    if (strncmp (name, table_row->name, len) == 0) {
      new_clef->basic_clef = table_row->basic_clef;
      new_clef->staveline = table_row->staveline;
      new_clef->named = 1;
      new_clef->octave_offset = get_clef_octave_offset (name + len);
      return 1;                 /* lookup succeeded */
    }
  }
  return 0;
}

/* look for a clef using C, F or G and a number 1 - 5  or
 * one of the specials (none, perc, auto).
 * As these are more recently introduced clefs, they are expected
 * to be preceded by "clef="
 */
int get_other_clef_details (const char *name, cleftype_t * new_clef)
{
  int i;
  int len;
  int num;
  int items_read;

  for (i = 0; i < NUM_ODD_CLEFS; i++) {
    const clef_item_t *table_row = &odd_clef_conversion_table[i];

    len = strlen (table_row->name);
    if (strncmp (name, table_row->name, len) == 0) {
      new_clef->basic_clef = table_row->basic_clef;
      new_clef->staveline = table_row->staveline;
      new_clef->octave_offset = table_row->octave_offset;
      new_clef->named = 1;
      new_clef->octave_offset = get_clef_octave_offset (name + len);
      return 1;                 /* lookup succeeded */
    }
  }
  new_clef->octave_offset = 0;
  /* try [C/F/G]{1-5] format */
  switch (name[0]) {
    case 'C':
      new_clef->basic_clef = basic_clef_alto;
      break;
    case 'F':
      new_clef->basic_clef = basic_clef_bass;
      break;
    case 'G':
      new_clef->basic_clef = basic_clef_treble;
      break;
    default:
      return 0;                 /* not recognized */
  }
  items_read = sscanf (&name[1], "%d", &num);
  if ((items_read == 1) && (num >= 1) && (num <= 5)) {
    /* we have a valid clef specification */
    new_clef->staveline = num;
    new_clef->named = 0;
    new_clef->octave_offset = get_clef_octave_offset (name + 2);
    return 1;
  }
  return 0;
}

/* combine get_standard_clef() and get_other_clef_details() into
 * a single function to identify a clef and return its details.
 */
int get_any_clef_details (const char *name, cleftype_t * new_clef)
{
  int result;

  result = get_standard_clef(name, new_clef);
  if (result) {
    /* if the first function identifies the clef, return with it */
    return result;
  } else {
    /* otherwise try the second function */
    return get_other_clef_details(name, new_clef);
  }
}

static void append_octave_offset(char * name, int octave_offset)
{
  switch (octave_offset) {
    case -2:
      strcat(name, "-15");
      break;
    case -1:
      strcat(name, "-8");
      break;
    case 1:
      strcat(name, "+8");
      break;
    case 2:
      strcat(name, "+15");
      break;
    default:
      break;
  }
}

/* given clef basic type and staveline, we try to work out it's name */
int get_clef_name (cleftype_t * new_clef, char *name)
{
  int i;

  if (new_clef->named) {
    for (i = 0; i < NUM_CLEFS; i++) {
      if ((clef_conversion_table[i].basic_clef == new_clef->basic_clef) &&
          (clef_conversion_table[i].staveline == new_clef->staveline)) {
        strcpy (name, clef_conversion_table[i].name);
        append_octave_offset(name, new_clef->octave_offset);
        return 1;               /* lookup succeeded */
      }
    }
  }
  switch (new_clef->basic_clef) {
    default:
    case basic_clef_undefined:
    case basic_clef_none :
      return 0;
    case basic_clef_auto :
      strcpy(name, "auto");
      return 1;
    case basic_clef_perc :
      strcpy(name, "perc");
      return 1;
    case basic_clef_treble:
      name[0] = 'G';
      break;
    case basic_clef_bass:
      name[0] = 'F';
      break;
    case basic_clef_alto:
      name[0] = 'C';
      break;
  }
  name[1] = '0' + new_clef->staveline;
  name[2] = '\0';
  append_octave_offset(name, new_clef->octave_offset);
  return 1;
}

/* take a tuple as read from the abc and produce the corresponding
 * note scale factor (tuplefactor) and number of notes (tuplenotes),
 * taking into account that q and r may have been omitted and hence
 * set to zero.
 */
void get_tuple_parameters(int *tuplefactor_num, int *tuplefactor_denom,
  int *tuplenotes, int timesig_num, int n, int q, int r)
{
  /*  If r is not given, it defaults to n */
  if (r == 0) {
    *tuplenotes = n;
  } else {
    *tuplenotes = r;
  }
  if (q != 0) {
    *tuplefactor_num = q;
    *tuplefactor_denom = n;
  } else {
    /* the time in which the notes of the tuple are to be played is given by
     * a complicated algorithm. See section 4.13 of abc standard 2.2
     */
    *tuplefactor_denom = n;
    if ((n == 2) || (n == 4) || (n == 8))
      *tuplefactor_num = 3;
    if ((n == 3) || (n == 6))
      *tuplefactor_num = 2;
    if ((n == 5) || (n == 7) || (n == 9)) {
      //if ((current_voice->timesig.num % 3) == 0) {
      if ((timesig_num % 3) == 0) {
        *tuplefactor_num = 3;
      } else {
        *tuplefactor_num = 2;
      }
    }
  }
}

/* reduce a fraction to its simplest form */
void reduce (int *a, int *b)
{
  int t, n, m;

  if ((*a == 0) || (*b == 0)) {
    /* not a valid fraction */
    return;
  }
  /* find HCF using Euclid's algorithm */
  if (*a > *b) {
    n = *a;
    m = *b;
  } else {
    n = *b;
    m = *a;
  }
  while (m != 0) {
    t = n % m;
    n = m;
    m = t;
  }
  *a = *a / n;
  *b = *b / n;
}

/* functions to tracking currently applicable accidentals */

/* at the start of the music and at every bar line, reset the currently
 * applicable accidentals.
 */
void acc_reset_bar(apply_acc_t *acc_state)
{
    int i;

  for (i = 0; i < NOTE_RANGE; i++) {
    acc_state->staveline_acc[i] = ' ';
    acc_state->staveline_mult[i] = 0;
  }

}

/* initialize evrything in the apply_acc_t structure */
void acc_tracking_init(apply_acc_t *acc_state)
{
  int i;

  for (i = 0; i < 7; i++) {
    acc_state->key_acc[i] = ' ';
  }
  acc_reset_bar(acc_state);
}

/* set_accidentals_for_keysig - function to get representation of a key signature.
 * input: sf 
 * output: key_acc[] array.
 * sf represents the key signature by indicating the number of sharps
 * (positive numbers) or flats (negative numbers).
 * key_acc[0 - 7] correspond to keys a to g. Each entry is the accidental
 * that applies to the corresponding line in the key signature. 
 */
void set_accidentals_for_keysig (int sf, char key_acc[7])
{
  int j;

  for (j = 0; j < 7; j++) {
    key_acc[j] = ' ';
  }
  if (sf >= 1) {
    key_acc['f' - 'c'] = '^';
  }
  if (sf >= 2) {
    key_acc['c' - 'c'] = '^';
  }
  if (sf >= 3) {
    key_acc['g' - 'c'] = '^';
  }
  if (sf >= 4) {
    key_acc['d' - 'c'] = '^';
  }
  if (sf >= 5) {
    key_acc['a' - 'c' + 7] = '^';
  }
  if (sf >= 6) {
    key_acc['e' - 'c'] = '^';
  }
  if (sf >= 7) {
    key_acc['b' - 'c' + 7] = '^';
  }
  if (sf <= -1) {
    key_acc['b' - 'c' + 7] = '_';
  }
  if (sf <= -2) {
    key_acc['e' - 'c'] = '_';
  }
  if (sf <= -3) {
    key_acc['a' - 'c' + 7] = '_';
  }
  if (sf <= -4) {
    key_acc['d' - 'c'] = '_';
  }
  if (sf <= -5) {
    key_acc['g' - 'c'] = '_';
  }
  if (sf <= -6) {
    key_acc['c' - 'c'] = '_';
  }
  if (sf <= -7) {
    key_acc['f' - 'c'] = '_';
  }
}

/* work out the accidental that applies to each line in the
 * keysig table. 
 * see set_accidentals_for_keysig() for full details
 */
void acc_update_keysig(apply_acc_t *acc_state, int sf)
{
  set_accidentals_for_keysig (sf, acc_state->key_acc);
}

/* make sure octave value is positive in the range 0 - 9 */
static int get_rebased_octave(int src_octave)
{
  int rebased_octave;

  rebased_octave = src_octave + 4;
  if (rebased_octave < 0) {
    rebased_octave = 0;
  }
  if (rebased_octave > 9) {
    rebased_octave = 9;
  }
  return rebased_octave;
}

/* given a line within the 7 in the key signature and an octave,
 * return the number of the note within the overall supported range
 * to be used as an index into the accidentals table.
 */
int get_staveline_index (int key_staveline, int octave)
{
  int result;

  result = (octave + 4) * 7 + key_staveline;
  if ((result < 0) || (result >= NOTE_RANGE)) {
    printf
      ("Internal error: out of range result %d in get_staveline_index key_staveline= %d octave=%d\n",
       result, key_staveline, octave);
    return 0;
  }
  return result;
}

/* work out the accidental for a note with no specified accidental
 * if an accidental has been applied to it's stave line, use that,
 * otherwise use whatever is specified in the key signature
 */
void get_default_accidental (apply_acc_t * apply_acc,
                             int key_index, int current_bar_staveline,
                             char *acc, int *mult)
{
  /* has an accidental been applied to current staveline ? */
  *acc = apply_acc->staveline_acc[current_bar_staveline];
  *mult = apply_acc->staveline_mult[current_bar_staveline];
  if (*acc == ' ') {
    /* if not, apply any accidentals from key signature */
    *acc = apply_acc->key_acc[key_index];
    *mult = 1;
  }
}

/* when we get a note, update the accidental tracking tables
 * return the actual note with any accidentals applied 
 * as a number of semitones
 */
int acc_update_note(apply_acc_t *acc_state, char src_note, char src_accidental, int src_mult, int src_octave)
{
  int rebased_octave;
  char effective_acc;    /* effective accidental that applies to note */
  int effective_mult;
  int staveline_index;
  int keysig_index;
  int effective_semitones;

  rebased_octave = get_rebased_octave(src_octave);
  /* work out line in key signature corresponding to note */
  keysig_index = note_index (src_note);
  /* work out line on stave corresponding to note */
  staveline_index = get_staveline_index (keysig_index, rebased_octave);

  /* now apply rules to get accidental */
  /* first apply any explicitly given accidental */
  effective_acc = src_accidental;
  effective_mult = src_mult;
  /* otherwise rules to get accidental */
  if (effective_acc == ' ') {
    get_default_accidental (acc_state, keysig_index, staveline_index,
                            &effective_acc, &effective_mult);
  } else {
    /* we have encountered an explicit accidental -
     * apply accidental to table */
    acc_state->staveline_acc[staveline_index] = src_accidental;
    acc_state->staveline_mult[staveline_index] = src_mult;
  }
  effective_semitones = rebased_octave * 12 + 
    semitone_value_for_note (note_index (src_note));
  /* now account for the accidental we deduced would apply */
  switch (effective_acc) {
    case '^':
      effective_semitones = effective_semitones + effective_mult;
      if (effective_mult == 0) {
        printf ("Internal error: applying sharp but default_src_mult is zero\n");
      }
      break;
    case '_':
      effective_semitones = effective_semitones - effective_mult;
      if (effective_mult == 0) {
        printf ("Internal error: applying flat but default_src_mult is zero\n");
      }
      break;
    case ' ':
    case '=':
      /* ignore ' ' and '=' */
      break;
    default:
      printf ("Internal error: Unexpected accidental char 0x%x\n", (int)effective_acc);
      break;
  }
  printf("HELP ME %c",effective_acc);
  return effective_semitones;
}

