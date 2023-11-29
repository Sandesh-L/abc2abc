#ifndef NOTE_CONVERSION_H
#define NOTE_CONVERSION_H
#include <stdbool.h> 
#include "../utils/string_utils.h"


char* convertNoteToStandardNotation(const char *abcNote);
bool isNoteCharacter(char ch);
bool isOctaveModifier(char ch);
void accumulateNoteCharacter(struct vstring *noteBuffer, char ch);

typedef struct {
    struct vstring noteBuffer;
    bool inNote;
} NoteState;

#endif