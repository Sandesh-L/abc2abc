/* barlines.h
 *
 * part of toadflax project
 * 
 * Copyright (C) 2021 James Allwright
 *
 * Distributed under GNU General Public License version 3.0
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
#ifndef BARLINES_H
#define BARLINES_H 1
#include "parseabc.h"

/* functions to support building a list of bar types */
void insert_bar_record(parser_status_t *status, int bar_type);
void free_bar_records(bar_record_t *bar_list);
/* functions for fixing bars in the list */
int get_next_bar_type(parser_status_t *status);
void fix_tune_repeats(parser_status_t * status);
/* functions to support two passes on each tune */
void store_tune_line(parser_status_t * status, char *line);
void replay_tune(parser_status_t * status);

#endif /* BARLINES_H */
