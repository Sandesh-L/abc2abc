#include "note_conversion.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include "../utils/string_utils.h"

void accumulateNoteCharacter(struct vstring *noteBuffer, char ch){
    if ((isNoteCharacter(ch)) || (isOctaveModifier(ch))){
        vstring_addch(noteBuffer, ch);
    }
}

bool isNoteCharacter(char ch){
    return (((ch >= 'a') && (ch <= 'g'))) || (((ch >= 'A') && (ch <= 'G')) || (ch=='_' || ch=='^'));
}

bool isOctaveModifier(char ch) {
    return ch == ',' || ch == '\'';
}

// Function to convert a single ABC note to standard pitch notation
char* convertNoteToStandardNotation(const char *abcNote) {
    int length = strlen(abcNote);
    char* standardNotation = (char*)malloc(4 * sizeof(char)); // Allocate memory for the result string

    if (standardNotation == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return NULL;
    }

    char note = abcNote[0];
    int octave = 4; // Default octave
    int octaveOffset = 0;
    if (islower(note)) {
        octaveOffset++;
    }

    // Calculate octave offset
    for (int i = 1; i < length; i++) {
        if (abcNote[i] == '\'') {
            octaveOffset++;
        } else if (abcNote[i] == ',') {
            octaveOffset--;
        }
    }

    octave += octaveOffset + (note >= 'a' && note <= 'g');
    if (note >= 'a' && note <= 'g') {
        note -= 32; // Convert to uppercase
    }

    sprintf(standardNotation, "%c%d", note, octave);
    return standardNotation;
}

extern void initvstring(struct vstring* s);
extern void vstring_addch(struct vstring* s, char ch);
extern void freevstring(struct vstring* s);


