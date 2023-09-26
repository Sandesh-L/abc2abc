/* string_utils.c
 * string_utils module
 *
 * Copyright (C) 2020 James Allwright
 *
 * low-level utilitity functions for assembling strings
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
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "string_utils.h"

/* malloc with error checking */
int *checkmalloc (int bytes)
{
  int *p;

  p = (int *)malloc (bytes);
  if (p == NULL) {
    printf ("Out of memory error - malloc failed!\n");
    exit (1);
  }
  return (p);
}


/* [SS] 2014-08-16 */
char *concatenatestring (char *s1, char *s2)
{
  char *p;
  int len;

  len = strlen (s1) + strlen (s2) + 1;
  p = (char *)checkmalloc (len);
  snprintf (p, len, "%s%s", s1, s2);
  return p;
}

/* initialize vstring (variable length string data structure) */
void initvstring (struct vstring *s)
{
  s->len = 0;
  s->limit = 40;
  s->st = (char *)checkmalloc (s->limit + 1);
  *(s->st) = '\0';
}


/* doubles character space available in string */
void extendvstring (struct vstring *s)
{
  char *p;

  if (s->limit > 0) {
    s->limit = s->limit * 2;
    p = (char *)checkmalloc (s->limit + 1);
    strcpy (p, s->st);
    free (s->st);
    s->st = p;
  } else {
    initvstring (s);
  }
}


/* appends character to vstring structure */
void vstring_addch( struct vstring *s, char ch)
{
  if (s->len >= s->limit) {
    extendvstring (s);
  }
  *(s->st + s->len) = ch;
  *(s->st + (s->len) + 1) = '\0';
  s->len = (s->len) + 1;
}

/* add a base 10 number to a vstring */
void vstring_addnum(struct vstring *s, int num)
{
  /* maximum for an int32 is 2147483647, so 20 chars is plenty */
  char number[20];

  snprintf(number, 20, "%d", num);
  number[19] = '\0';
  vstring_addtext(s, number);
}


/* appends a string to vstring data structure */
void vstring_addtext (struct vstring *s, const char *text)
{
  int newlen;

  newlen = s->len + strlen (text);
  while (newlen >= s->limit) {
    extendvstring (s);
  }
  strcpy (s->st + s->len, text);
  s->len = newlen;
}


/* set string to empty */
/* does not deallocate memory ! */
void clearvstring (struct vstring *s)
{
  *(s->st) = '\0';
  s->len = 0;
}

/* deallocates memory allocated for string */
void freevstring (struct vstring *s)
{
  if (s->st != NULL) {
    free (s->st);
    s->st = NULL;
  }
  s->len = 0;
  s->limit = 0;
}

void init_read_status(read_status_t *status)
{
  status->done_eol = 0;
}

/* returns 1 when there is a line ready to process, 0 otherwise.
 * This handles the different end-of-line formats.
 */
int abc_source_char (int t, struct vstring *line, read_status_t * status)
{
  int line_ready;

  line_ready = 0;
  /* process EOF here */
  if (t == EOF) {
    if (status->done_eol == 1) {
      /* we have just seen a newline, so file is complete. */
      return 0;
    } else {
      /* treat EOF as completing the last line */
      return 1;                 /* line ready */
    }
  }
  /* recognize  \n  or  \r\n  or  \n\r  as end of line
   * This should work for DOS, unix and Mac files. We do
   * this by just ignoring \r.
   */
  if (t == '\n') {
    /* reached end of line */
    line_ready = 1;
    status->done_eol = 1;
  } else {
    if (t == '\r') {
      /* must have '\r'  - always skip this character.
       * only a small number of obsolete machines use
       * \r to mark the end of a line instead of \n.
       */
    } else {
      vstring_addch( line, (char)t);
      status->done_eol = 0;
    }
  }
  return line_ready;
}

/* initialize lines record to be NULL (no lines) */
static void init_string_record (string_record_t * lr)
{
  lr->string_data = NULL;
  lr->next_string = NULL;
}

/* initialize abc_text_lines_t struct to be empty */
void init_text_lines (abc_text_lines_t * text_lines)
{
  text_lines->first_string = NULL;
  text_lines->last_string = NULL;
}

/* free this record and return pointer to the next record */
string_record_t *free_string_record (string_record_t * lr)
{
  string_record_t *next_record;

  if (lr == NULL) {
    printf ("Internal error : attempting to free NULL string_record\n");
    return NULL;
  }
  if (lr->string_data != NULL) {
    free (lr->string_data);
  }
  next_record = lr->next_string;
  free (lr);
  return next_record;
}

/* free all malloc'ed memory in abc_text_lines_t struct */
void free_text_lines (abc_text_lines_t * text_lines)
{
  string_record_t *next_record;

  next_record = text_lines->first_string;
  while (next_record != NULL) {
    next_record = free_string_record (next_record);
  }
  init_text_lines (text_lines);
}

/* add the supplied string to given abc_text_lines_t struct */
void add_line_to_text_lines (abc_text_lines_t * tl, char *line_to_add)
{
  char *duplicated_text_line;
  string_record_t *new_line_record;

  /* create the new line record */
  duplicated_text_line = strdup (line_to_add);
  new_line_record = (string_record_t *) malloc (sizeof (string_record_t));
  init_string_record (new_line_record);
  new_line_record->string_data = duplicated_text_line;
  /* now add the new line record */
  if (tl->first_string == NULL) {
    tl->first_string = new_line_record;
    tl->last_string = new_line_record;
  } else {
    tl->last_string->next_string = new_line_record;
    tl->last_string = new_line_record;
  }
}

/* should be append_text_lines ? */
void duplicate_text_lines (abc_text_lines_t * source, abc_text_lines_t * target)
{
  string_record_t *current_line;

  current_line = source->first_string;
  while (current_line != NULL) {
    add_line_to_text_lines (target, current_line->string_data);
    current_line = current_line->next_string;
  }
}

/* add lines in abc_text_lines_t to vstring with newline character
 * in between lines
 */
void vstring_add_text_lines(struct vstring *vstr, abc_text_lines_t *new_lines)
{
  string_record_t *this_line;

  if (vstr->len > 0) {
    vstring_addch(vstr, '\n');
  }
  this_line = new_lines->first_string;
  while (this_line != NULL) {
    vstring_addtext(vstr, this_line->string_data);
    this_line = this_line->next_string;
    if (this_line != NULL) {
      vstring_addch(vstr, '\n');
    }
  }
}

/* given a set of lines in an abc_text_lines_t structure, generate
 * one single string from the lines with a newline character after
 * every line to separate it from the next line.
 */
char *text_lines_to_string(abc_text_lines_t *new_lines)
{
  char *output_string;
  struct vstring new_text_buffer;

  initvstring(&new_text_buffer);
  vstring_add_text_lines(&new_text_buffer, new_lines);
  output_string = strdup(new_text_buffer.st);
  freevstring(&new_text_buffer);
  return output_string;
}

/* legacy list manipulation functions */

/* initialize a linked list */
void init_llist (struct llist *l)
{
  l->first_string = NULL;
  l->last_string = NULL;
  l->place = NULL;
}

/* append an item to a linked list */
void addtolist (struct llist *p, void *item)
{
  string_record_t *x;

  x = (string_record_t *) checkmalloc (sizeof (string_record_t));
  x->next_string = NULL;
  x->string_data = item;
  if (p->first_string == NULL) {
    p->first_string = x;
    p->last_string = x;
  } else {
    p->last_string->next_string = x;
    p->last_string = x;
  }
}

/* find the first item in the list */
/* also initialize for a traversal using nextitem() */
void *firstitem (struct llist *p)
{
  if (p == NULL) {
    return (NULL);
  }
  p->place = p->first_string;
  if (p->place == NULL) {
    return (NULL);
  } else {
    return (p->place->string_data);
  }
}

/* return 'next' item in the list. Successive calls return successive    */
/* items or NULL after the end of the list has been reached. firstitem() */
/* must be called prior to the first call to nextitem()                  */
void *nextitem (struct llist *p)
{
  if (p->place == NULL) {
    return (NULL);
  } else {
    p->place = p->place->next_string;
    if (p->place == NULL) {
      return (NULL);
    } else {
      return (p->place->string_data);
    }
  }
}

/* frees up all dynamically allocated memory used to build the linked list */
void freellist (struct llist *l)
{
  void *p;
  string_record_t *e;
  string_record_t *olde;

  if (l != NULL) {
    p = firstitem (l);
    while (p != NULL) {
      free (p);
      p = nextitem (l);
    }
    e = l->first_string;
    while (e != NULL) {
      olde = e;
      e = e->next_string;
      free (olde);
    }
    init_llist (l);
  }
}

