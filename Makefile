# Makefile for toadflax and py_toadflax
#
# Copyright James Allwright 2020
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# This Makefile is to build the code using gcc on a Ubuntu Linux system.
# If your system is different, you may have to make changes for your
# system.
#
# Toadflax
#
# This makefile makes use of pkg-config, which in turn requires you to have
# installed pkg-config as well as the development packages for whatever
# libraries you are using.
# pkg-config is a utility
# that returns flags and library paths necessary to compile applications
# using python (and anything else that pkg-config supports). Below is an
# example showing how this can be used :
#
# For gtk:
# pkg-config --cflags gtk+-3.0 - gets compiler flags for compilation
# pkg-config --libs gtk+-3.0 - gets libraries to link against and the
#   directories where the libraries live.
# To compile a program using gtk:
#
# gcc `pkg-config --cflags gtk+-3.0` -o example-0 example-0.c `pkg-config --libs gtk+-3.0`
#
# For python:
# pkg-config --cflags python3 - gets compiler flags for compilation
# 
# pkg-config --libs python3 - get libraries to link against
# This does not appear to work properly - see below !
# 
# If you do not have pkg-config, you can still edit this Makefile by hand
# to set up the compiler and linker options :
# -I<directory> to tell the compiler where to find include files (*.h),
# -L<directory> to tell the linker where to find libraries to link to
# (*.so, *.a) and
# -l<library> to tell the linker to link to <library>.
# You can specifiy multiple directories with multiple -I and -L options.
# -I, -L and -l are the flags used by gcc. Other compilers may handle this
# differently.
#

PANGO_CFLAGS=$(shell pkg-config --cflags pango)
# On example Ubuntu Linux system this returns
# -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
#
PANGO_LIBS=$(shell pkg-config --libs pango)
CAIRO_CFLAGS=$(shell pkg-config --cflags cairo)
# On an example Ubuntu Linux system this returns
# -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16
#
CAIRO_LIBS=$(shell pkg-config --libs cairo)
# for pkg-config --libs cairo
# -lcairo

PANGOCAIRO_LIBS=$(shell pkg-config --libs pangocairo)

GTK3_CFLAGS=$(shell pkg-config --cflags gtk+-3.0)
# On an example Ubuntu Linux system this returns
# -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
#
GTK3_LIBS=$(shell pkg-config --libs gtk+-3.0)
# On an example Ubuntu Linux system this returns
# -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
#
GTK_INC_FLAGS=$(GTK3_CFLAGS) -IGTK -I. -I./GTK
ALL_GTK_LIBS=-Wl,--export-dynamic $(GTK3_LIBS) -lm -lrt -pthread
#
# Use pkg-config to find out where the python libraries are
# On an example Ubuntu Linux system this returns
# -I/usr/include/python3.8 -I/usr/include/x86_64-linux-gnu/python3.8
#
PYTHON_CFLAGS=$(shell pkg-config --cflags python3) -I. -I./tkinter
# On an example Ubuntu Linux system this returns
# -I/usr/include/python3.8 -I/usr/include/x86_64-linux-gnu/python3.8
#
PYTHON_LIBS=$(shell pkg-config --libs python3)
# On an example Ubuntu Linux system this returns nothing!
# For some reason, pkg-config is not returning the library below.
# Note: for Ubuntu LTS "Bionic Beaver" use python3.8
# This is for Ubuntu LTS "Jammy Jellyfish"
PY_LIBS=-lpython3.10

THIS_DIR=$(shell pwd)
CC=gcc
CFLAGS=-g -Wall -I./utils

DATE=$(shell date +%d_%b_%Y_%H%M)

all: toadflax py_toadflax Tabctoabc Tcairodraw

# files to support drawing music in GTK_toadflax (based on YAPS)

cairo_draw_music.o : cairo_draw_music.c abc.h cairo_draw_music.h pango_text.h
	$(CC) $(CFLAGS) -c cairo_draw_music.c -o cairo_draw_music.o $(PANGO_CFLAGS) $(CAIRO_CFLAGS)

abcmodel.o: abcmodel.c abc.h parseabc.h drawtune.h utils/string_utils.h parser_interface.h
	$(CC) $(CFLAGS) -c abcmodel.c -o abcmodel.o

drawtune.o: drawtune.c  sizes.h abc.h drawtune.h cairo_draw_music.h parseabc.h \
  pango_text.h
	$(CC) $(CFLAGS) -c drawtune.c -o drawtune.o

pango_text.o: pango_text.c abc.h cairo_draw_music.h pango_text.h \
  utils/string_utils.h sizes.h utils/utf8_utils.h
	$(CC) $(CFLAGS) -c -DGTK_GRAPHICS $(PANGO_CFLAGS) $(CAIRO_CFLAGS) pango_text.c

position.o: position.c abc.h sizes.h parseabc.h drawtune.h
	$(CC) $(CFLAGS) -c position.c -o position.o

debug.o: debug.c  abc.h drawtune.h parseabc.h
	$(CC) $(CFLAGS) -c debug.c -o debug.o

DRAW_MUSIC_OBJECTS=cairo_draw_music.o abcmodel.o drawtune.o pango_text.o \
  position.o debug.o

TABCTOABC_OBJECTS=toabc.o transposer.o utils/string_utils.o music_utils.o \
  parser_utils.o parseabc.o barlines.o

# abc parsing and manipulation
# common code shared by multiple toadflax versions.

parseabc.o : parseabc.c abc.h parseabc.h \
             utils/string_utils.h music_utils.h parser_interface.h barlines.h
	$(CC) $(CFLAGS) -c parseabc.c -o parseabc.o

barlines.o: barlines.c abc.h parseabc.h parser_interface.h
	$(CC) $(CFLAGS) -c barlines.c -o barlines.o

toabc.o: toabc.c abc.h parseabc.h toabc.h parser_interface.h transposer.h \
  parser_utils.h
	$(CC) $(CFLAGS) -c toabc.c -o toabc.o

transposer.o: transposer.c transposer.h utils/string_utils.h music_utils.h
	$(CC) $(CFLAGS) -c transposer.c -o transposer.o

toadflax_support.o: toadflax_support.c parseabc.h toabc.h toadflax_support.h
	$(CC) $(CFLAGS) -c toadflax_support.c -o toadflax_support.o

preparse.o : preparse.c preparse.h abc.h utils/string_utils.h parser_utils.h \
  utils/utf8_utils.h
	$(CC) $(CFLAGS) -c preparse.c -o preparse.o

music_utils.o: music_utils.c music_utils.h
	$(CC) $(CFLAGS) -c music_utils.c -o music_utils.o

parser_utils.o: parser_utils.c parser_utils.h
	$(CC) $(CFLAGS) -c parser_utils.c -o parser_utils.o

utils/string_utils.o: utils/string_utils.c utils/string_utils.h
	$(CC) $(CFLAGS) -c utils/string_utils.c -o utils/string_utils.o

utils/utf8_utils.o: utils/utf8_utils.c utils/utf8_utils.h utils/string_utils.h
	$(CC) $(CFLAGS) -c utils/utf8_utils.c -o utils/utf8_utils.o

# guitar_model.o: guitar_model.c guitar_model.h
# 	$(CC) $(CFLAGS) -c guitar/guitar_model.c -o guitar/guitar_model.o

# gtk_music_window.o and gtk_gui.o are only used in the GTK version of
# Toadflax.

# CAIRO_CFLAGS must be set correctly for this to compile
GTK/gtk_music_window.o: GTK/gtk_music_window.c cairo_draw_music.h abc.h parseabc.h \
  preparse.h drawtune.h pango_text.h draw_music.h
	$(CC) $(CFLAGS) $(GTK_INC_FLAGS) -c -DGTK_GRAPHICS -o GTK/gtk_music_window.o $(CAIRO_CFLAGS) GTK/gtk_music_window.c

# GTK_INC_FLAGS must be set correctly for this to compile
GTK/gtk_gui.o: GTK/gtk_gui.c pango_text.h preparse.h abc.h sizes.h \
  GTK/gtk_gui.h \
  utils/string_utils.h parseabc.h toabc.h build_date.h toadflax_support.h \
  utils/utf8_utils.h draw_music.h
	$(CC) $(CFLAGS) $(GTK_INC_FLAGS) -c -o GTK/gtk_gui.o GTK/gtk_gui.c

TOADFLAX_OBJECTS=$(TABCTOABC_OBJECTS) utils/utf8_utils.o preparse.o \
  $(DRAW_MUSIC_OBJECTS) toadflax_support.o GTK/gtk_music_window.o GTK/gtk_gui.o

# source code for the tkinter-based GUI

# tkinter_gui.o and tkinter_calls.o are only used in the python/Tkinter
#version of Toadflax.

# PYTHON_CFLAGS must be set correctly for this to compile
tkinter/tkinter_gui.o: tkinter/tkinter_gui.c preparse.h utils/utf8_utils.h parseabc.h toabc.h tkinter/tkinter_gui_funcs.h build_date.h toadflax_support.h
	$(CC) $(CFLAGS) $(PYTHON_CFLAGS) -c tkinter/tkinter_gui.c -o tkinter/tkinter_gui.o

# PYTHON_CFLAGS must be set correctly for this to compile
tkinter/tkinter_calls.o: tkinter/tkinter_calls.c tkinter/tkinter_gui_funcs.h
	$(CC) $(CFLAGS) $(PYTHON_CFLAGS) -c  tkinter/tkinter_calls.c -o tkinter/tkinter_calls.o

TOADFLAX2_OBJECTS=$(TABCTOABC_OBJECTS) utils/utf8_utils.o preparse.o \
  toadflax_support.o tkinter/tkinter_gui.o tkinter/tkinter_calls.o

TCAIRODRAW_OBJECTS= $(DRAW_MUSIC_OBJECTS) parseabc.o \
  music_utils.o barlines.o utils/utf8_utils.o GTK/gtk_music_window.o \
  preparse.o utils/string_utils.o parser_utils.o

clean:
	rm -f -r toadflax py_toadflax Tabctoabc core *.o
	rm GTK/*.o tkinter/*.o utils/*.o

# PYTHON_CFLAGS, PYTHON_LIBS and PY_LIBS must be set correctly for this
# to link
py_toadflax: $(TOADFLAX2_OBJECTS)
	$(CC) $(CFLAGS) $(PYTHON_CFLAGS) -o py_toadflax $(TOADFLAX2_OBJECTS) \
  $(PYTHON_LIBS) $(PY_LIBS)

# ALL_GTK_LIBS must be set correctly for this to link
toadflax: $(TOADFLAX_OBJECTS)
	$(CC) $(CFLAGS) -o toadflax $(TOADFLAX_OBJECTS) $(ALL_GTK_LIBS)

# LIBS must be set correctly for this to link
Tcairodraw: Tcairodraw.c preparse.h utils/utf8_utils.h draw_music.h $(TCAIRODRAW_OBJECTS)
	$(CC) $(CFLAGS) Tcairodraw.c -o Tcairodraw $(TCAIRODRAW_OBJECTS) \
  $(CAIRO_CFLAGS) $(PANGO_CFLAGS) $(PANGO_LIBS) $(CAIRO_LIBS) \
  $(PANGOCAIRO_LIBS) -lm -lrt

TABCTOABC_OBJECTS=toabc.o transposer.o utils/string_utils.o music_utils.o \
  parser_utils.o parseabc.o barlines.o 
#   guitar_model.o

Tabctoabc: $(TABCTOABC_OBJECTS) Tabctoabc_main.c build_date.h abc.h parseabc.h \
  toabc.h barlines.h
	$(CC) $(CFLAGS) -o Tabctoabc Tabctoabc_main.c $(TABCTOABC_OBJECTS)

test/transposer: transposer.o utils/string_utils.o music_utils.o transposer.h test/transposer_main.c
	$(CC) $(CFLAGS) -o test/transposer -I$(THIS_DIR) transposer.o utils/string_utils.o music_utils.o \
  test/transposer_main.c

testprogs:
	cd test; $(MAKE) all; cd ..

