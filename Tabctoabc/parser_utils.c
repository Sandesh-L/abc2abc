/* parser_utils.c
 * basic functions associated with abc file parsing
 *
 * James Allwright
 * Copyright (C) 2020
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include <malloc.h>
#include <ctype.h>
#include <limits.h>
#include "parser_utils.h"

/* skip space and tab */
int skipspace (const char **p)
{
  int space_count = 0;

  while (((int)**p == ' ') || ((int)**p == TAB)) {
    *p = *p + 1;
    space_count = space_count + 1;
  }
  return space_count;
}

/* advance character pointer until we get to a space or TAB character */
void skiptospace (const char **p)
{
  while (((int)**p != ' ') && ((int)**p != TAB) && (int)**p != '\0')
    *p = *p + 1;
}

/* read integer from string without advancing character pointer */
int p_readnumf (const char *num, int *err_id)
{
  int t;
  const char *p;

  p = num;
  if (!isdigit (*p)) {
    *err_id = ERR_MISSING_NUMBER;
  } else {
    *err_id = NO_ERROR;
  }
  t = 0;
  while (((int)*p >= '0') && ((int)*p <= '9') && (t < (INT_MAX-9)/10)) {
    t = t * 10 + (int)*p - '0';
    p = p + 1;
  }
  if (t >= (INT_MAX-9)/10) {
    *err_id = ERR_NUMBER_TOO_BIG;
  }
  return (t);
}

/* reads signed integer from string without advancing character pointer */
int p_readsnumf (const char *s, int *err_id)
{
  const char *p;

  p = s;
  if (*p == '-') {
    p = p + 1;
    skipspace (&p);
    return (-p_readnumf (p, err_id));
  } else {
    return (p_readnumf (p, err_id));
  }
}

/* read integer from string and advance character pointer */
/* never returns an error */
int readnump (const char **p)
{
  int t;

  t = 0;
  while (((int)**p >= '0') && ((int)**p <= '9') && (t < (INT_MAX-9)/10)) {
    t = t * 10 + (int)**p - '0';
    *p = *p + 1;
  }
  /* advance over any spurious extra digits */
  while (isdigit(**p)) {
    *p = *p + 1;
  }
  return (t);
}

/* reads signed integer from string and advance character pointer */
/* never returns an error */
int readsnump (const char **p)
{
  if (**p == '-') {
    *p = *p + 1;
    skipspace (p);
    return (-readnump (p));
  } else {
    return (readnump (p));
  }
}

/* look for argument 'option' in command line
 * return the position of the next argument in argv[] if we find option
 * return -1 otherwise.
 * There is no guarantee that a next arg exists, so calling function
 * will have to check this if it uses argv[] at the returned value.
 */
int getarg (const char *option, int argc, char *argv[])
{
  int j, place;

  place = -1;
  for (j = 0; j < argc; j++) {
    if (strcmp (option, argv[j]) == 0) {
      place = j + 1;
    }
  }
  return (place);
}

/* if option is found in the argument list and it is followed by another
 * argument, return the number of the following argument.
 * if option is found in the argument list but there is no following
 * argument return -2.
 * Otherwise, return -1
 * used for arguments that must be followed by a parameter
 */
int next_arg(const char *option, int argc, char *argv[])
{
  int result;

  result = getarg (option, argc, argv);
  if (result == -1) {
    return result;
  }
  if (result < argc) {
    return result;
  } else {
    return -2;
  }
}

/* read alphanumeric characters into buffer out[] of size limit.
 * advance pointer *in for the characters that are read.
 * returned buffer is null-terminated.
 */
void readstr (char out[], const char **in, int limit)
{
  int i;

  i = 0;
  while ((isalpha (**in)) && (i < limit - 1)) {
    out[i] = **in;
    i = i + 1;
    *in = *in + 1;
  }
  out[i] = '\0';
}

/* substrdup, similar to strdup, creates a new string from a substring
 * of an existing string. The new string contains everything between and
 * including both first and last characters.
 */
char *substrdup(const char *first, const char *last)
{
  int len;
  char *new_string;

  /* length is one more than the difference because we include
   * both first and last characters.
   */
  len = last - first + 1;
  new_string = malloc(len + 1);
  strncpy(new_string, first, len);
  new_string[len] = '\0';
  return new_string;
}

/* insert error/warning message into list */
static void insert_message (const char *message_type, int lineno,
                     abc_text_lines_t * error_text, char *message)
{
  char *buffer;
  int len;

  len = strlen (message) + 40;
  buffer = malloc (len);
  snprintf (buffer, len, "%s in line %d : %s", message_type, lineno, message);
  add_line_to_text_lines (error_text, buffer);
  free (buffer);
}

/* insert a message that has no associated line number */
void report_message(error_object_t * error_obj, char *message)
{
  add_line_to_text_lines (&error_obj->error_text, message);
}

/* generate an error message in error_obj */
void report_error (error_object_t * error_obj, char *s)
{
  insert_message ("Error", error_obj->lineno, &error_obj->error_text, s);
}

/* insert '***' into line at specified position */
static char *mark_line(const char *line, int pos)
{
  char *marked_line;
  int len;
  int i;

  len = strlen(line);
  marked_line = (char *)malloc(len + 4);
  if ((pos < 0) || (pos > len)) {
    printf("Internal Error: pos (%d) not in 0-%d\n", pos, len -1);
    strcpy(marked_line, line);
  } else {
    for (i = 0; i < pos; i++) {
      marked_line[i] = line[i];
    }
    marked_line[pos] = '*';
    marked_line[pos+1] = '*';
    marked_line[pos+2] = '*';
    for (i = pos; i < len; i++) {
      marked_line[i+3] = line[i];
    }
    marked_line[len+3] = '\0';
  }
  return marked_line;
}

/* generate an error message in error_obj together with two lines
 *  highlighting exactly where the error is on the source line.
 * Use *** to mark where the error is so that the place is shown
 * correctly even if we are using a font with uneven character widths.
 */
void report_error_ch (const char *line, int pos, error_object_t * error_obj, char *s)
{
  char *marked_line;

  insert_message ("Error", error_obj->lineno,
                  &error_obj->error_text, s);
  marked_line = mark_line(line, pos);
  add_line_to_text_lines (&error_obj->error_text, marked_line);
  free(marked_line);
}

/* generate an warning message in error_obj */
void report_warning (error_object_t * error_obj, char *s)
{
  insert_message ("Warning", error_obj->lineno, &error_obj->error_text, s);
}

/* generate an warning message in error_obj together with two lines 
 * highlighting exactly where the error is on the source line.
 * Use *** to mark where the error is so that the place is shown
 * correctly even if we are using a font with uneven character widths.
 */
void report_warning_ch (const char *line, int pos, error_object_t * error_obj, char *s)
{
  char *marked_line;

  insert_message ("Warning", error_obj->lineno,
                  &error_obj->error_text, s);
  marked_line = mark_line(line, pos);
  add_line_to_text_lines (&error_obj->error_text, marked_line);
  free(marked_line);
}

