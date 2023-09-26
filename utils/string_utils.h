/* string_utils.h
 * header file for string_utils module
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
 * Additionally, the string_utils module, consisting of the files
 * string_utils.c, string_utils.h and string_utils_desc.txt may be
 * used under the terms of the GNU Lesser General Public License
 * version 3.
 *
 */

#ifndef STRING_UTILS_H
#define STRING_UTILS_H 1

/* The vstring routines provide a simple way to assemble */
/* arbitrary length strings */
struct vstring {
  int len;
  int limit;
  char* st;
};

/* structure for reading abc tune data from a file */
typedef struct read_status {
  int done_eol;
} read_status_t;

/* structure to hold all the lines in a single abc tune */
typedef struct string_record {
  char *string_data;
  struct string_record *next_string;
} string_record_t;

typedef struct abc_text_lines {
  string_record_t *first_string;
  string_record_t *last_string;
} abc_text_lines_t;

/* structures for legacy linked-list functions */

/* high-level structure for linked list */
struct llist {
  string_record_t *first_string;
  string_record_t *last_string;
  string_record_t *place; /* pointer used for stepping through linked list */
};

/* process input file */
extern int abc_source_char(int t, struct vstring *line, read_status_t *status);
/* vstring routines */
extern void initvstring(struct vstring* s);
extern void extendvstring(struct vstring* s);
extern void vstring_addch(struct vstring* s, char ch);
extern void vstring_addtext(struct vstring* s, const char* text);
extern void vstring_addnum(struct vstring* s, int num);
extern void clearvstring(struct vstring* s);
extern void freevstring(struct vstring* s);

/* text_lines routines */
void init_text_lines(abc_text_lines_t *text_lines);
void free_text_lines(abc_text_lines_t *text_lines);
void add_line_to_text_lines(abc_text_lines_t *tl, char *line_to_add);
void duplicate_text_lines(abc_text_lines_t *source, abc_text_lines_t *target);
string_record_t *free_string_record(string_record_t * lr);
void vstring_add_text_lines(struct vstring *vstr, abc_text_lines_t *new_lines);
char *text_lines_to_string(abc_text_lines_t *lines);

/* legacy list manipulation functions */
void init_llist(struct llist* l);
struct llist* newlist();
void addtolist(struct llist* p, void* item);
void* firstitem(struct llist* p);
void* nextitem(struct llist* p);
void freellist(struct llist* l);

#endif /* STRING_UTILS_H */
