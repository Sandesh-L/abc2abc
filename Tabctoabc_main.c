/* abc2abc_main.c - part of abc2abc
 *
 * Copyright (C) James Allwright 2020
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
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
#include "string_utils.h"
#include "build_date.h"
#include "abc.h"
#include "parseabc.h"
#include "toabc.h"
#include "barlines.h"

int check_next_arg(void *vstatus, const char *option, int argc, char *argv[])
{
  parser_status_t *status = (parser_status_t *) vstatus;
  int result;

  result = next_arg(option, argc, argv);
  if (result == -1) {
    return result;
  } else {
    if (result == -2) {
      char msg[80];

      snprintf(msg, 80, "option %s requires a value but no value found", option);
      report_message (&status->error_obj, msg);
      return -1;
    } else {
      return result;
    }
  }
}

static void output_error_lines(abc_text_lines_t *error_strings)
{
  string_record_t *current_line;

  current_line = error_strings->first_string;
  while (current_line != NULL) {
    if (current_line->string_data != NULL) {
      printf ("%% %s\n", current_line->string_data);
    }
    current_line = current_line->next_string;
  }
}

/* routine called on program start-up */
void handle_abc2abc_args (void *vstatus, int argc, char *argv[],
                          char **filename)
{
  parser_status_t *status = (parser_status_t *) vstatus;
  conversion_state_t *conv = (conversion_state_t *) status->tune_data;
  int targ, narg;

  if ((getarg ("-h", argc, argv) != -1) || (argc < 2)) {
    printf ("Tabctoabc version %s\n", build_date);
    printf ("alternative version of abc2abc built from Toadflax sources\n");
    printf ("Usage: Tabctoabc <filename> [-s] [-c] [-b] [-r] -R] [-e] [-E]\n");
    printf ("       [-t X] [-nokeys] [-nokeyf] [-u] [-L] [-usekey n]\n");
    printf ("       [-u] [-L] [-key n] [-d] [-v] [-V X[,Y,,,]]\n");
    printf ("  -s for new spacing\n");
    printf ("  -c compact note lengths use / instead of /2\n");
    printf ("  -b to remove bar checking\n");
    printf ("  -r to remove repeat checking\n");
    printf ("  -R to attempt to fix missing repeats\n");
    printf ("  -e to remove all error reports\n");
    printf ("  -E to report errors at end of file after all tunes\n");
    printf ("  -t X to transpose X semitones (X may be negative)\n");
    printf ("  -nokeys No key signature. Use sharps\n");
    printf ("  -nokeyf No key signature. Use flats\n");
    printf ("  -key n Use key signature n (+ for sharps/- for flats)\n");
    printf ("  -L to insert L: field if missing\n");
    printf ("  -d to notate with doubled note lengths\n");
    printf ("  -v to notate with halved note lengths\n");
    printf ("  -V X[,Y...] to output only voices X,Y...\n");
    printf ("  -ver  prints version number and exits\n");
    printf ("  -X n renumber the all X: fields as n, n+1, ..\n");
    printf ("  -OCC interpret +<notes>+ as chords [<notes>]\n");
    printf ("  -u interpret +<text>+ as a decoration !<text>!\n");

    exit (0);
  } else {
    *filename = argv[1];
  };
  if (getarg ("-ver", argc, argv) != -1) {
    printf ("Tabctoabc %s\n", build_date);
    exit (0);
  }
  if (getarg ("-s", argc, argv) != -1) {
    conv->newspacing = 1;
  } else {
    conv->newspacing = 0;
  };
  if (getarg ("-c", argc, argv) != -1) {
    conv->compact_lengths = 1;
  } else {
    conv->compact_lengths = 0;
  };
  if (getarg ("-L", argc, argv) != -1) {
    conv->fixL = 1;
  } else {
    conv->fixL = 0;
  };
  if (getarg("-X", argc, argv) != -1) {
    conv->newrefnos = 1;
    narg = next_arg ("-X", argc, argv);
    if (narg == -1) {
      conv->newref = 1;
    } else {
      conv->newref = readnumf (status, argv[narg]);
    }
  } else {
    conv->newrefnos = 0;
  };
  if (getarg ("-e", argc, argv) != -1) {
    /* option suppresses errors */
    conv->echeck = 0;
  } else {
    conv->echeck = 1;
  };
  if (getarg ("-E", argc, argv) != -1) {
    conv->eaftertune = 1;
  } else {
    conv->eaftertune = 0;
  };
  if (getarg ("-b", argc, argv) != -1) {
    /* option suppresses bar checking */
    status->barcheck = 0;
  } else {
    status->barcheck = 1;
  };
  if (getarg ("-r", argc, argv) != -1) {
    /* option removes repeat checking */
    status->repcheck = 0;
  } else {
    status->repcheck = 1;
  };
  if (getarg ("-R", argc, argv) != -1) {
    status->new_reps = 1;
    status->repcheck = 0;
  } else {
    status->new_reps = 0;
  };
  if (getarg ("-v", argc, argv) != -1) {
    conv->lenfactor.num = 1;
    conv->lenfactor.denom = 2;
    /* must have L: field to apply balancing change to it */
    conv->fixL = 1;
  } else {
    if (getarg ("-d", argc, argv) != -1) {
      conv->lenfactor.num = 2;
      conv->lenfactor.denom = 1;
      /* must have L: field to apply balancing change to it */
      conv->fixL = 1;
    } else {
      conv->lenfactor.num = 1;
      conv->lenfactor.denom = 1;
    };
  };
  targ = check_next_arg (vstatus, "-t", argc, argv);
  if (targ == -1) {
    conv->transpose = 0;
  } else {
    if (*argv[targ] == '-') {
      conv->transpose = -readnumf (status, argv[targ] + 1);
    } else if (*argv[targ] == '+') {
      conv->transpose = readnumf (status, argv[targ] + 1);
    } else {
      conv->transpose = readnumf (status, argv[targ]);
    };
    /* don't allow no keysig if we are transposing */
    conv->nokeysig = 0;
  }
  /* [SS] 2016-03-03 */
  targ = check_next_arg (vstatus, "-V", argc, argv);
  if (targ != -1) {
    parse_voices_selection (status, argv[targ], conv->enable_output); /* [PHDM] 2013-03-08 */
  }

  if (getarg ("-nokeys", argc, argv) != -1) {
    conv->nokeysig = 1;       /* [SS] 2016-03-03 */
    conv->useflats = 0;
  }

  if (getarg ("-nokeyf", argc, argv) != -1) {
    conv->nokeysig = 1;
    conv->useflats = 1;
  }
  targ = check_next_arg (vstatus, "-key", argc, argv);
  if (targ != -1) {
    if (conv->nokeysig) {
      report_message (&status->error_obj, "-key cannot be used with nokeys/nokeyf");
      conv->nokeysig = 0; 
    }
    conv->usekey = readsnumf (status, argv[targ]);
    /* usekey and nokeyf/nokeys cannot be used together
     * disable nokey if it was enabled
     */
    if ((conv->usekey < -7) || (conv->usekey > 7)) {
      report_message (&status->error_obj, "-key value must be in the range -6 to 6");
      conv->usekey = 0;
    } else {
      conv->changekeysig = 1;
      if (conv->usekey < 0) {
        conv->useflats = 1;
      }
    }
  }
  if (getarg ("-OCC", argc, argv) != -1) {
    status->plus_is_chord = 1;
    status->plus_is_dec = 0;
  } else {
    status->plus_is_chord = 0;
  }
  if (getarg ("-u", argc, argv) != -1) {
    status->plus_is_dec = 1;
    status->plus_is_chord = 0;
  } else {
    status->plus_is_dec = 0;
  };
  /* always print out errors and warnings */
  output_error_lines(&status->error_obj.error_text);
  /* remove error lines from error_obj */
  free_text_lines (&status->error_obj.error_text);
  init_text_lines (&status->error_obj.error_text);
}


/* read in an abc file and put it in an abc_text_lines_t struct */
static void prepare_tune (char *filename, abc_text_lines_t * abc_lines)
{
  int reading;
  struct vstring line;
  /* char line[MAXLINE]; */
  int t;
  read_status_t read_status;
  FILE *in;

  if (filename == NULL) {
    printf ("No filename provided. Exiting\n");
    exit (1);
  }
  in = fopen (filename, "r");
  if (in == NULL) {
    printf ("Failed to open file %s\n", filename);
    exit (1);
  }

  reading = 1;
  line.limit = 4;
  initvstring (&line);
  read_status.done_eol = 0;
  init_text_lines (abc_lines);
  while (reading) {
    int line_ready;

    /* read file character by character */
    t = getc (in);
    line_ready = abc_source_char (t, &line, &read_status);
    if (line_ready) {
      // printf ("line ready : %s\n", line.st);
      add_line_to_text_lines (abc_lines, line.st);
      clearvstring (&line);
    }
    if (t == EOF) {
      reading = 0;
    }
  }
  (void)fclose (in);
  freevstring (&line);
}

/* output all the lines in the tune */
static void output_stored_tune(abc_text_lines_t *abc_output_lines)
{
  string_record_t *current_line;

  current_line = abc_output_lines->first_string;
  while (current_line != NULL) {
    int len;

    len = strlen (current_line->string_data);
    if ((len > 0) && (current_line->string_data[len - 1] == '\n')) {
      /* if we alreay end with a newline, don't print another one */
      printf ("%s", current_line->string_data);
    } else {
      printf ("%s\n", current_line->string_data);
    }
    current_line = current_line->next_string;
  }
}

int abc2abc_main (int argc, char *argv[])
{
  char *filename = NULL;
  parser_status_t status;
  string_record_t *current_line = NULL;
  abc_text_lines_t abc_input_lines;
  int fileline = 1;
  abc_text_lines_t abc_output_lines;
  conversion_state_t *conv;
  parse_state_t last_state = OUTSIDE_TUNE;

  init_parser_status (&status);
  conv = new_conversion_state ();
  status.tune_data = (void *)conv;
  handle_abc2abc_args (&status, argc, argv, &filename);

  /* create struct with text lines here */
  init_text_lines (&abc_input_lines);
  prepare_tune (filename, &abc_input_lines);
  /* initialize structure for output */
  init_text_lines (&abc_output_lines);
  conv->abc_output = &abc_output_lines;

  /* initialize parser variables */
  status.main_funcs = new_conversion_functions ();
  status.func = status.main_funcs;
  parser_start_abcfile (&status);
  current_line = abc_input_lines.first_string;
  while (current_line != NULL) {
    // printf ("Current Line : %s\n", current_line);
    status.error_obj.lineno = fileline;
    parseline (&status, current_line->string_data);
    if (!conv->eaftertune &&
      (((last_state == INBODY) && (status.state == OUTSIDE_TUNE)) ||
       ((last_state == INBODY) && (status.state == START_NEW_TUNE)))) {
        /* we have reached the end of a tune inside the file */
      /* print out tune */
      output_stored_tune(&abc_output_lines);
      free_text_lines (&abc_output_lines);
      init_text_lines (&abc_output_lines);
      /* print out errors and warnings */
      if (conv->echeck) {
        output_error_lines(&status.error_obj.error_text);
      }
      /* remove error lines from error_obj */
      free_text_lines (&status.error_obj.error_text);
      init_text_lines (&status.error_obj.error_text);
    }
    last_state = status.state;
    status.func->linebreak (&status);
    current_line = current_line->next_string;
    fileline = fileline + 1;
  }
  /* tidy up after processing file */
  parser_end_abcfile (&status);

  output_stored_tune(&abc_output_lines);

  /* print out all errors and warnings */
  if (conv->echeck) {
    output_error_lines(&status.error_obj.error_text);
  }

  /* free up all our data structures */
  free_text_lines (&abc_input_lines);
  free_text_lines (&abc_output_lines);
  status.tune_data = free_conversion_state (conv);
  free_parser_status (&status);
  return (0);
}

int main (int argc, char **argv)
{
  return abc2abc_main (argc, argv);
}
