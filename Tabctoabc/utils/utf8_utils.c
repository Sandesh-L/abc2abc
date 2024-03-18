/* utf8_utils.h
 * UTF-8 utilities
 * utf8_utils module
 *
 * These functions are used to convert between various formats for special
 * characters defined in the abc standard and UTF-8.
 *
 * Copyright (C) James Allwright
 * November 2020
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
 * Additionally, the utf8_utils module, consisting of the files
 * utf8_utils.c, utf8_utils.h and utf8_utils_desc.txt may be
 * used under the terms of the GNU Lesser General Public License
 * version 3.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "string_utils.h"
#include "utf8_utils.h"

/* structs and tables for ASCII to UTF-8 conversion */
typedef struct mnemonic
{
  char *name;
  int code;
} mnemonic_t;

typedef struct entity
{
  char *name;
  int code;
} entity_t;

/* table of named html entities, second column is unicode */
const entity_t entities_table[] = {
  {"Agrave", 0x00c0},
  {"agrave", 0x00e0},
  {"Egrave", 0x00c8},
  {"egrave", 0x00e8},
  {"Igrave", 0x00cc},
  {"igrave", 0x00ec},
  {"Ograve", 0x00d2},
  {"ograve", 0x00f2},
  {"Ugrave", 0x00d9},
  {"ugrave", 0x00f9},
  {"Aacute", 0x00c1},
  {"aacute", 0x00e1},
  {"Eacute", 0x00c9},
  {"eacute", 0x00e9},
  {"Iacute", 0x00cd},
  {"iacute", 0x00ed},
  {"Oacute", 0x00d3},
  {"oacute", 0x00f3},
  {"Uacute", 0x00da},
  {"uacute", 0x00fa},
  {"Yacute", 0x00dd},
  {"yacute", 0x00fd},
  {"Acirc", 0x00c2},
  {"acirc", 0x00e2},
  {"Ecirc", 0x00ca},
  {"ecirc", 0x00ea},
  {"Icirc", 0x00ce},
  {"icirc", 0x00ee},
  {"Ocirc", 0x00d4},
  {"ocirc", 0x00f4},
  {"Ucirc", 0x00db},
  {"ucirc", 0x00fb},
  {"Ycirc", 0x0176},
  {"ycirc", 0x0177},
  {"Atilde", 0x00c3},
  {"atilde", 0x00e3},
  {"Ntilde", 0x00d1},
  {"ntilde", 0x00f1},
  {"Otilde", 0x00d5},
  {"otilde", 0x00f5},
  {"Auml", 0x00c4},
  {"auml", 0x00e4},
  {"Euml", 0x00cb},
  {"euml", 0x00eb},
  {"Iuml", 0x00cf},
  {"iuml", 0x00ef},
  {"Ouml", 0x00d6},
  {"ouml", 0x00f6},
  {"Uuml", 0x00dc},
  {"uuml", 0x00fc},
  {"Yuml", 0x0178},
  {"yuml", 0x00ff},
  {"Ccedil", 0x00c7},
  {"ccedil", 0x00e7},
  {"Aring", 0x00c5},
  {"aring", 0x00e5},
  {"Oslash", 0x00d8},
  {"oslash", 0x00f8},
  {"Abreve", 0x0102},
  {"abreve", 0x0103},
  {"Scaron", 0x0160},
  {"scaron", 0x0161},
  {"Zcaron", 0x017d},
  {"zcaron", 0x017e},
  {"AElig", 0x00c6},
  {"aelig", 0x00e6},
  {"OElig", 0x0152},
  {"oelig", 0x0153},
  {"szlig", 0x00df},
  {"ETH", 0x00d0},
  {"eth", 0x00f0},
  {"THORN", 0x00de},
  {"thorn", 0x00fe},
};

/* table of Mnemonic representations, second column is unicode */
const mnemonic_t mnemonics_table[] = {
  {"`A", 0x00c0},
  {"`a", 0x00e0},
  {"`E", 0x00c8},
  {"`e", 0x00e8},
  {"`I", 0x00cc},
  {"`i", 0x00ec},
  {"`O", 0x00d2},
  {"`o", 0x00f2},
  {"`U", 0x00d9},
  {"`u", 0x00f9},
  {"'A", 0x00c1},
  {"'a", 0x00e1},
  {"'E", 0x00c9},
  {"'e", 0x00e9},
  {"'I", 0x00cd},
  {"'i", 0x00ed},
  {"'O", 0x00d3},
  {"'o", 0x00f3},
  {"'U", 0x00da},
  {"'u", 0x00fa},
  {"'Y", 0x00dd},
  {"'y", 0x00fd},
  {"^A", 0x00c2},
  {"^a", 0x00e2},
  {"^E", 0x00ca},
  {"^e", 0x00ea},
  {"^I", 0x00ce},
  {"^i", 0x00ee},
  {"^O", 0x00d4},
  {"^o", 0x00f4},
  {"^U", 0x00db},
  {"^u", 0x00fb},
  {"^Y", 0x0176},
  {"^y", 0x0177},
  {"~A", 0x00c3},
  {"~a", 0x00e3},
  {"~N", 0x00d1},
  {"~n", 0x00f1},
  {"~O", 0x00d5},
  {"~o", 0x00f5},
  {"\"A", 0x00c4},
  {"\"a", 0x00e4},
  {"\"E", 0x00cb},
  {"\"e", 0x00eb},
  {"\"I", 0x00cf},
  {"\"i", 0x00ef},
  {"\"O", 0x00d6},
  {"\"o", 0x00f6},
  {"\"U", 0x00dc},
  {"\"u", 0x00fc},
  {"\"Y", 0x0178},
  {"\"y", 0x00ff},
  {"cC", 0x00c7},
  {"cc", 0x00e7},
  {"AA", 0x00c5},
  {"aa", 0x00e5},
  {"/O", 0x00d8},
  {"/o", 0x00f8},
  {"uA", 0x0102},
  {"ua", 0x0103},
  {"uE", 0x0114},
  {"ue", 0x0115},
  {"vS", 0x0160},
  {"vs", 0x0161},
  {"vZ", 0x017d},
  {"vz", 0x017e},
  {"HO", 0x0150},
  {"Ho", 0x0151},
  {"HU", 0x0170},
  {"Hu", 0x0171},
  {"AE", 0x00c6},
  {"ae", 0x00e6},
  {"OE", 0x0152},
  {"oe", 0x0153},
  {"ss", 0x00df},
  {"DH", 0x00d0},
  {"dh", 0x00f0},
  {"TH", 0x00de},
  {"th", 0x00fe},
};
int num_entities = sizeof (entities_table) / sizeof (entity_t);
int num_mnemonics = sizeof (mnemonics_table) / sizeof (mnemonic_t);

/* convert 2 byte UTF-8 sequence to its unicode character value */
unsigned long get_unicode_2byte(unsigned char utf8[])
{
  return (((utf8[0] & 0x1F) << 6) |
           (utf8[1] & 0x3F));
}

/* convert 3 byte UTF-8 sequence to its unicode character value */
unsigned long get_unicode_3byte(unsigned char utf8[])
{
  return (((utf8[0] & 0x07) << 12) |
          ((utf8[1] & 0x3F) << 6) |
           (utf8[2] & 0x3F));
}

/* convert 4 byte UTF-8 sequence to its unicode character value */
unsigned long get_unicode_4byte(unsigned char utf8[])
{
  return (((utf8[0] & 0x07) << 18) |
          ((utf8[1] & 0x3F) << 12) |
          ((utf8[2] & 0x3F) << 6) |
           (utf8[3] & 0x3F));
}

/* convert a UTF-8 sequence of specified length to unicode character value */
unsigned long get_unicode(unsigned char utf8[], int num_bytes)
{
  unsigned long value;

  switch (num_bytes) {
    case 2:
      value = get_unicode_2byte(utf8);
      //printf("get_unicode_2byte returns %ld (0x%08lx)\n", value, value);
      break;
    case 3:
      value = get_unicode_3byte(utf8);
      //printf("get_unicode_3byte returns %ld (0x%08lx)\n", value, value);
      break;
    case 4:
      value = get_unicode_4byte(utf8);
      //printf("get_unicode_4byte returns %ld (0x%08lx)\n", value, value);
      break;
    default:
      //printf("Error: other number of bytes!\n");
      value = 0;
      break;
  }
  return value;
}

/* work out length of a UTF-8 sequence by inspecting bits of first byte */
int get_unicode_num_bytes(unsigned int t)
{
  if ((0xF8 & (int)t) == 0xF0) {
    //printf("Starting UTF-8 (4 bytes)\n");
    return 4;
  } else if ((0xF0 & (int)t) == 0xE0) {
    //printf("Starting UTF-8 (3 bytes)\n");
    return 3;
  } else if ((0xE0 & (int)t) == 0xC0) {
    //printf("Starting UTF-8 (2 bytes)\n");
    return 2;
  } else {
    //printf("Invalid start of unicode 0x%x\n", t);
    return 0;
  }
}

/* work through a string converting strange byte values
 * control characters are converted to ?
 * valid UTF-8 sequences are converted to \UXXXXXXXX or \uXXXX
 * characters which are not valid UTF-8 are converted to ?
 */
static void process_string(char in_str[], struct vstring *line)
{
  int in_utf8;
  int utf8_num_bytes;
  unsigned char utf8_sequence[4];
  int utf8_current_byte_no;
  unsigned int t;
  int i;

  in_utf8 = 0;
  utf8_num_bytes = 0;
  utf8_current_byte_no = 0;
  i = 0;
  while (in_str[i] != '\0') {
    t = (unsigned int)((unsigned char)  in_str[i]);
    /* process UTF-8 */
    if (in_utf8)
    {
      //printf("In UTF-8 (%d bytes)\n", utf8_num_bytes);
      if ((0xC0 & t) == 0x80) {
        utf8_sequence[utf8_current_byte_no] = t;
        utf8_current_byte_no = utf8_current_byte_no + 1;
        if (utf8_current_byte_no >= utf8_num_bytes)
        {
          unsigned long value;
          char char_encoding[20];
          /* we have a valid UTF-8 sequence : output it */
          value = get_unicode(utf8_sequence, utf8_num_bytes);
          if (value < 0xFFFF)
          {
            snprintf(char_encoding, 20, "\\u%04lX", value);
          }
          else
          {
            snprintf(char_encoding, 20, "\\U%08lX", value);
          }
          //printf("%s\n", char_encoding);
          //vstring_addtext( line, "<UTF-8>");
          vstring_addtext( line, char_encoding);
          in_utf8 = 0;
        }
      } else {
        /* invalid UTF-8 next byte in sequence - abort UTF-8 decoding
         * print ? for all candidate UTF-8 bytes and print
         * current byte if a valid character.
         */
        int i;

        //printf("Invalid UTF-8\n");
        for (i = 0; i < utf8_current_byte_no; i++) {
          vstring_addch( line, '?');
        }
        if (isprint(t)) {
          vstring_addch( line, t);
        } else {
          vstring_addch( line, '?');
        }
        in_utf8 = 0;
      }
    } else {
      if ((0x80 & t) == 0x80) {
        /* high bit set indicates the start of a UTF-8 encoded multi-byte
         * character */
        in_utf8 = 1;
        utf8_sequence[0] = (unsigned char)t;
        utf8_current_byte_no = 1;

        utf8_num_bytes =  get_unicode_num_bytes(t);
        /* check for invalid start of UTF-8 sequence */
        if (utf8_num_bytes == 0)
        {
          in_utf8 = 0;
          vstring_addch( line, '?');
        }
      }  else {
        /* normal ASCII */
        vstring_addch( line, t);
      }
    }
    i = i + 1;
  }
}

/* replace all control characters and UTF-8 encoding with 7-bit ascii
 * This takes a struct vstring as its input and returns the result
 * in the same vstring.
 */
void make_utf8_safe(struct vstring *line)
{
  int i;
  int has_utf8;
  char *string_to_process;

  string_to_process = line->st;

  /* first check if we are all valid 7-bit characters.
   * replace any control characters with ?
   * this will not change string length, so do it in place
   */
  i = 0;
  has_utf8 = 0;
  while (string_to_process[i] != '\0') {
    /* convert any control characters to '?' */
    if (iscntrl(string_to_process[i])) {
      string_to_process[i] = '?';
    }
    if ((string_to_process[i] & 0x80) != 0)
    {
      has_utf8 = 1;
    }
    i = i + 1;
  }
  if (has_utf8)
  {
    struct vstring new_line;

    initvstring(&new_line);
    /* construct string with UTF-8 sequences replaced */
    process_string(string_to_process, &new_line);
    clearvstring(line);
    vstring_addtext( line, new_line.st);
    freevstring(&new_line);
  }
}

/* alternative interface to make_utf8_safe.
 * replace all control characters and UTF-8 encoding with 7-bit ascii
 * takes input as a string and return a pointer to a newly allocated string
 */
char *string_make_utf8_safe(const char *s)
{
  struct vstring new_line;
  char *new_string;

  initvstring(&new_line);
  vstring_addtext( &new_line, s);
  make_utf8_safe(&new_line);
  new_string = strdup(new_line.st);
  freevstring(&new_line);
  return new_string;
}


/*
 * Support for conversion between coding methods for representing
 * unicode characters in ordinary ascii and UTF-8 output. The 3
 * methods defined in the abc 2.2 standard are
 *
 * mnemonics e.g. \'e
 * named html entities e.g. &eacute;
 * fixed width unicode e.g. \u00e9
 *
 */


/* output a single byte to a vstring */
static void write_byte (struct vstring *out, int byte)
{
  vstring_addch( out, byte);
}

/* Takes a unicode character as a numeric value and outputs
 * the UTF-8 byte sequence for it
 */
static void output_utf8_char (struct vstring *out, unsigned long unicode)
{
  if (unicode == 0) {
    /* not permitted */
    return;
  }
  if ((unicode & 0x7F) == unicode) {
    /* 1 byte */
    write_byte (out, unicode);
    return;
  }
  if ((unicode & 0x7FF) == unicode) {
    /* 2 bytes */
    write_byte (out, 0xC0 | ((unicode & 0x7C0) >> 6));
    write_byte (out, 0x80 | (unicode & 0x3F));
    return;
  }
  if ((unicode & 0xFFFF) == unicode) {
    /* 3 bytes */
    write_byte (out, 0xE0 | ((unicode & 0xF000) >> 12));
    write_byte (out, 0x80 | ((unicode & 0xFC0) >> 6));
    write_byte (out, 0x80 | (unicode & 0x3F));
    return;
  }
  if ((unicode & 0x1FFFFF) == unicode) {
    /* 4 bytes */
    write_byte (out, 0xF0 | ((unicode & 0x1C0000) >> 18));
    write_byte (out, 0x80 | ((unicode & 0x3F000) >> 12));
    write_byte (out, 0x80 | ((unicode & 0xFC0) >> 6));
    write_byte (out, 0x80 | (unicode & 0x3F));
    return;
  }
}

/* Convert a named html entity to UTF-8
 * Named entities always start with "&" and end with ";"
 * This works by looking up the name in a table
 * then calling output_utf8_char() if we find the name
 */
static const char *ampersand_decode (const char *place, struct vstring *out)
{
  char entity_name[40];         /* big enough for everything in our table */
  int i;
  const char *new_place;
  int found = 0;

  new_place = place;
  i = 0;
  while ((*new_place != '\0') && (*new_place != ';') &&
         (isalpha (*new_place)) && (i < 39)) {
    entity_name[i] = *new_place;
    i = i + 1;
    new_place = new_place + 1;
  }
  if (*new_place == ';') {
    int j;
    /* we have found a possible entity name. Is it in the table ? */

    new_place = new_place + 1;  /* skip over ampersand */
    entity_name[i] = '\0';
    found = 0;
    j = 0;
    while ((j < num_entities) && (!found)) {
      if (strcmp (entity_name, (entities_table[j]).name) == 0) {
        output_utf8_char (out, (entities_table[j]).code);
        found = 1;
      }
      j = j + 1;
    }
  }
  if (!found) {
    /* output ampersand only */
    vstring_addch( out, '&');
    return place;
  } else {
    return new_place;
  }
}

/* convert a mnemonic representation of a character to a unicode string
 * The mnemonic representation always starts with "\".
 * If we find the mnemonic in our table, we output the unicode
 * value using output_utf8_char().
 */
static const char *mnemonic_decode (const char *place, struct vstring *out)
{
  char mnemonic_name[4];        /* big enough for everything in our table */
  int i;
  int j;
  const char *new_place;
  int found = 0;

  new_place = place;
  i = 0;
  while ((*new_place != '\0') && (i < 2)) {
    mnemonic_name[i] = *new_place;
    i = i + 1;
    new_place = new_place + 1;
  }
  /* we have found a possible mnemonic name. Is it in the table ? */
  mnemonic_name[i] = '\0';
  found = 0;
  j = 0;
  while ((j < num_mnemonics) && (!found)) {
    if (strcmp (mnemonic_name, (mnemonics_table[j]).name) == 0) {
      output_utf8_char (out, (mnemonics_table[j]).code);
      found = 1;
    }
    j = j + 1;
  }
  if (!found) {
    vstring_addch( out, '\\');
    return place;
  } else {
    return new_place;
  }
}

/* decode /uXXXX or /UXXXXXXXX unicode characters.
 * if we find \u or \U, we read hex digits and output
 * the UTF8 using output_utf8_char()
 */
static const char *unicode_decode(const char *place, struct vstring *out, int limit)
{
  const char *new_place;
  char unicode_str[9];
  unsigned long unicode;
  int i;

  /* read up to 4 or 8 hex characters
   * standard says \u should have precisely 4 characters and
   * \U should have precisely 8 characters, but if we find a non-hex
   * character before then, we assume leading zeroes have been dropped
   */
  new_place = place;
  i = 0;
  unicode = 0;
  while (isxdigit (*new_place) && (i < limit)) {
    unicode_str[i] = *new_place;
    i = i + 1;
    new_place = new_place + 1;
  }
  unicode_str[i] = '\0';
  //printf("unicode_decode has %s\n", unicode_str);
  sscanf (unicode_str, "%lx", &unicode);
  //printf("unicode value is %lu (0x%lx)\n",  unicode, unicode);
  if (unicode == 0) {
    /* 0 is not permitted as a unicode char - treat as a failed decode */
    vstring_addch( out, '\\');
    vstring_addch( out, 'u');
    return place + 1;
  } else {
    /* emit utf-8 */
    output_utf8_char (out, unicode);
  }
  return new_place;
}

/* If we find a backslash "\", it could either be a mnemonic representation
 * or a unicode value preceded by \u or \U. This function decides what it
 * is and performs the appropriate decoding to UTF-8.
 */
static const char *backslash_decode (const char *place, struct vstring *out)
{
  const char *new_place;
  int ch;

  new_place = place;
  ch = *new_place;
  if (ch == 'u') {
    new_place = new_place + 1;
    new_place = unicode_decode(new_place, out, 4);
  } else if (ch == 'U') {
    new_place = new_place + 1;
    new_place = unicode_decode(new_place, out, 8);
  } else {
    new_place = mnemonic_decode (place, out);
  }
  return new_place;
}

/* This function takes a string which potentially contains unicode
 * characters in the standard representations and converts them to
 * UTF-8.
 * The output is written to a vstring struct (variable-length string)
 * which must be initialized before this function was called. If
 * the vstring is not empty when the function is called, the supplied
 * string will be appended to the string already in the vstring
 * with any unicode characters converted to UTF-8.
 */
void apply_utf8_substitions (const char *in_string, struct vstring *out)
{
  int ch;
  const char *place;

  place = in_string;
  while (*place != '\0') {
    ch = *place;
    if (ch == '&') {
      place = ampersand_decode (place + 1, out);
    } else {
      if (ch == '\\') {
        place = place + 1;
        place = backslash_decode (place, out);
      } else {
        /* not a special encoding, pass through */
        vstring_addch( out, ch);
        place = place + 1;
      }
    }
  }
}
