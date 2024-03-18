/* UTF-8 utilities
 * utf8_utils module
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

#ifndef UTF8_UTILS_H
#define UTF8_UTILS_H 1

#include "string_utils.h"

/* convert UTF-8 source to encoded ASCII text. */
void make_utf8_safe(struct vstring *line);
char *string_make_utf8_safe(const char *s);

/* convert encoded ASCII text to UTF-8 */
void apply_utf8_substitions (const char *in_string, struct vstring *out);
#endif /* UTF8_UTILS_H */
