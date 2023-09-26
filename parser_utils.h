/* parser_utils.h
 * header file for basic functions associated with abc file parsing
 * and error handling.
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

#ifndef PARSER_UTILS_H
#define PARSER_UTILS_H
#include "string_utils.h"

typedef enum parse_state {
  OUTSIDE_TUNE,
  START_NEW_TUNE,
  INHEAD,
  INBODY
} parse_state_t;

typedef struct error_object {
  int lineno;
  abc_text_lines_t error_text;
} error_object_t;

#define TAB '\t'

/* errors potentially returned by readnumf() and related functions */
#define NO_ERROR 0
#define ERR_MISSING_NUMBER 1
#define ERR_NUMBER_TOO_BIG 2

int skipspace(const char **p);
void skiptospace (const char **p);
int p_readnumf(const char *num, int *err_id);
int p_readsnumf(const char *s, int *err_id);
int readnump(const char **p);
int readsnump(const char **p);
int getarg (const char *option, int argc, char *argv[]);
int next_arg(const char *option, int argc, char *argv[]);
void readstr (char out[], const char **in, int limit);
char *substrdup(const char *first, const char *last);

/* error/warning functions
 * report_error_ch() and report_warning_ch show the location of the problem
 * within the line as well as the error message
 */
void report_message(error_object_t *error_obj, char *message);
void report_error (error_object_t *error_obj, char *s);
void report_error_ch (const char *line, int pos, error_object_t *error_obj, char *s);
void report_warning (error_object_t *error_obj, char *s);
void report_warning_ch (const char *line, int pos, error_object_t *error_obj, char *s);

#endif /* PARSER_UTILS_H */
