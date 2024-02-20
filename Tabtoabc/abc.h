/* abc.h - header file shared by abc2midi, abc2abc, yaps and toadflax
 * Copyright (C) James Allwright 2000 and 2020
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


#ifndef ABC_H
#define ABC_H 1

#include "string_utils.h"
#include "music_utils.h"

typedef enum {
ABC2MIDI,
ABC2ABC,
YAPS,
ABCMATCH} programname;

typedef enum {
  TIMESIG_NORMAL,
  TIMESIG_FREE_METER,
  TIMESIG_COMMON,
  TIMESIG_CUT,
  TIMESIG_COMPLEX
} timesig_type_t;

/* holds a fraction */
struct fract {
  int num;
  int denom;
};

typedef struct timesig_details {
  timesig_type_t type;
  int num;
  int denom;
  int complex_values[8];
  int num_values;
} timesig_details_t;

/* holds a tempo specifier */
struct atempo {
  int count;
  struct fract basenote;
  int relative;
  char *pre;
  char *post;
};

/* holds a general tuple specifier */
struct tuple {
  int n;
  int q;
  int r;
  int raw_q;
  int raw_r;
  int label;
  int beamed;
  float height;
};

/* holds a key signature */
struct key {
  char* name;
  int sharps;
  char map[7];
  int mult[7];
  int in_abc_source;
 /* indicates if this is a key present in the abc or if it is
  * added afterwards for the start of a new music line */
};

/* note decorations defined in the abc 2.2 standard.
 * see section 4.14
 *
 * DEC_PART is a part label with a string
 * DEC_TEXT indicates a U: user-defined string in an
 * abbreviation. It is handled by char_gchord() instead
 * of being treated like a regular decoration.
 */
#define MAX_DECORATIONS 10
extern const char single_char_decorations[];
typedef enum decoration_type {
  DEC_UNKNOWN,
  DEC_STACCATO,
  DEC_ORNAMENT,
  DEC_BOWUP,
  DEC_BOWDOWN,
  /* new decorations defined in the standard */
  DEC_TRILL,
  DEC_OPEN_TRILL,
  DEC_CLOSE_TRILL,
  DEC_LOWERMORDENT,
  DEC_UPPERMORDENT,
  DEC_MORDENT, /* alternative name for lower mordent */
  DEC_PRALLTRILLER, /* alternative name for upper mordent */
  DEC_ROLL,
  DEC_IRISH_ROLL,
  DEC_TURN,
  DEC_TURNX,
  DEC_INVERTEDTURN,
  DEC_INVERTEDTURNX,
  DEC_ARPEGGIO,
  DEC_CRESCENDO,
/*   DEC_ACCENT, same as DEC_EMPHASIS */
  DEC_EMPHASIS,
  DEC_MARCATO,
  DEC_FERMATA,
  DEC_INVERTEDFERMATA,
  DEC_TENUTO,
  DEC_PLUS,
  DEC_SNAP,
  DEC_SLIDE,
  DEC_WEDGE,
  DEC_UPBOW,
  DEC_DOWNBOW,
  DEC_OPEN,
  DEC_THUMB,
  DEC_BREATH,
  DEC_OPEN_CRESCENDO,
  DEC_CLOSE_CRESCENDO,
  DEC_OPEN_DIMINUENDO,
  DEC_CLOSE_DIMINUENDO,
  DEC_SEGNO,
  DEC_CODA,
  DEC_SHORTPHRASE,
  DEC_MEDIUMPHRASE,
  DEC_LONGPHRASE,
  DEC_EDITORIAL,
  DEC_COURTESY,
  DEC_EMPHASIS_BAR,
  /* decorations printing text */
  DEC_PPPP,
  DEC_PPP,
  DEC_PP,
  DEC_P,
  DEC_MP,
  DEC_MF,
  DEC_F,
  DEC_FF,
  DEC_FFF,
  DEC_FFFF,
  DEC_SFZ,
  DEC_DS,
  DEC_DS_AL_CODA,
  DEC_DS_AL_FINE,
  DEC_DC,
  DEC_DC_AL_CODA,
  DEC_DC_AL_FINE,
  DEC_DACODA,
  DEC_DACAPO,
  DEC_FINE,
  DEC_ZERO,
  DEC_ONE,
  DEC_TWO,
  DEC_THREE,
  DEC_FOUR,
  DEC_FIVE,
  DEC_TEXT, /* redefined symbol with associated string */
  DEC_PART  /* part label with associated string */
} decoration_type_t;
#define NUM_DECORATION_TYPES ((int)DEC_PART + 1)

/* structure to hold a decoration
 * simple decorations are on the the above decoration types.
 * abbrev holds the single character abbreviation for the
 * decoration if one was used in the abc.
 * for DEC_PART, the part label is held in str.
 * if the name of the decoration is not recognised, it is also
 * held in str.
 */
typedef struct dec_struct {
  decoration_type_t type;
  char abbrev;
  char *str;
} decoration_t;

/* The decoration context holds the accumulated decorations that
 * will be applied to the next note, rest or bar symbol.
 */
typedef struct decoration_context {
  int num_decorations;
  decoration_t decorations_to_apply[MAX_DECORATIONS];
} decoration_context_t;

typedef enum placetype { left, right, centre} placetype_t;

/* define types of abc object */
typedef enum {
/* types of bar sign */
VIRTUAL_BAR, /* start of a line of music can be used to indicate a bar start */
SINGLE_BAR,
DOUBLE_BAR,
BAR_REP,
REP_BAR,
PLAY_ON_REP,
REP1,
REP2,
/* BAR1 = SINGLE_BAR + REP1 */
/* REP_BAR2 = REP_BAR + REP2 */
BAR1,
REP_BAR2,
DOUBLE_REP,
THICK_THIN,
THIN_THICK,
/* other things */
PART,
TEMPO,
TIME,
KEY,
REST,
TUPLE,
/* CHORD replaced by CHORDON and CHORDOFF */
NOTE,
NONOTE,
OLDTIE,
TEXT,
SLUR_ON,
SLUR_OFF,
TIE,
CLOSE_TIE,
GRACEON,
GRACEOFF,
GCHORD,
GCHORDON,
GCHORDOFF,
VOICE,
CHORDON,
CHORDOFF,
SLUR_TIE,
TNOTE,
/* broken rhythm */
LT,
GT,
DYNAMIC,
LINENUM,
MUSICLINE,
MUSICSTOP,
WORDLINE,
WORDSTOP,
INSTRUCTION,
NOBEAM,
CHORDNOTE,
CLEF,
PRINTLINE,
NEWPAGE,
LEFT_TEXT,
CENTRE_TEXT,
VSKIP,
SPLITVOICE
} featuretype;

/* information about a voice */
#define V_STRLEN 256 /* [SS] 2017-10-11 increase from 64 */
struct voice_params {
  int gotclef;
  int gotoctave;
  int gottranspose;
  int gotname;
  int gotsname;
  int gotmiddle;
  int gotother;  /* [SS] 2011-04-18 */
  int octave;
  int transpose;
  char clefname[V_STRLEN+1];
  cleftype_t new_clef;
  char namestring[V_STRLEN+1];
  char snamestring[V_STRLEN+1];
  char middlestring[V_STRLEN+1];
  char other[V_STRLEN+1]; /* [SS] 2011-04-18 */
};

/* information bundled into the K: field */
struct key_params {
 int gotkey;
 int gotclef;
 int gotoctave;
 int gottranspose;
 int octave;
 int transpose;
 char clefname[30];
 cleftype_t new_clef;
 int explicit_accidentals;
};

#endif /* ABC_H */
