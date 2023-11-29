#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "guitar_model.h"

#define STRINGS 6
#define FRETS 19

// Function declarations
char*** createGuitar();
void printGuitar(char*** guitar);
NoteLocation* findNote(char*** guitar, const char* note, int* size);
void freeGuitar(char*** guitar);
// NoteLocation* findNote(char*** guitar, const char* note, int* size);

// Function to create the guitar matrix
char*** createGuitar() {
    // Allocate memory for the guitar matrix
    char*** guitar = (char***)malloc(STRINGS * sizeof(char**));
    for (int i = 0; i < STRINGS; ++i) {
        guitar[i] = (char**)malloc(FRETS * sizeof(char*));
    }

    // Initialize the notes for each string and fret
    char* notes[STRINGS][FRETS] = {
       {"E2", "F2", "F#2", "G2", "G#2", "A2", "A#2", "B2", "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3"},
        {"A2", "A#2", "B2", "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C4", "C#4", "D4", "D#4"},
        {"D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4"},
        {"G3", "G#3", "A3", "A#3", "B3", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5"},
        {"B3", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5", "D5", "D#5", "E5", "F5"},
        {"E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5"}
    };

    for (int i = 0; i < STRINGS; i++) {
        for (int j = 0; j < FRETS; j++) {
            guitar[i][j] = malloc(sizeof(char) * (strlen(notes[i][j]) + 1)); // Allocate
            if (guitar[i][j] == NULL) {
                fprintf(stderr, "Memory allocation failed for guitar string %d fret %d\n", i+1, j+1);
                exit(EXIT_FAILURE);
            }
            strcpy(guitar[i][j], notes[i][j]); // Copy
        }
    }

    return guitar;
}

// Function to print the guitar matrix
void printGuitar(char*** guitar) {
    for (int i = 0; i < STRINGS; i++) {
        for (int j = 0; j < FRETS; j++) {
            printf("%s\t", guitar[i][j]);
        }
        printf("\n");
    }
}

// Function to find a note on the guitar matrix
NoteLocation* findNote(char*** guitar, const char* note, int* size) {
    int capacity = 10;
    NoteLocation* locations = malloc(capacity * sizeof(NoteLocation));
    *size = 0;
    printf("Searching for note: %s\n", note);
    for (int string = 0; string < STRINGS; string++) {
        for (int fret = 0; fret < FRETS; fret++) {
            if (strcmp(guitar[string][fret], note) == 0) {
                if (*size >= capacity){
                    capacity *= 2;
                    locations = realloc(locations, capacity * sizeof(NoteLocation));
                }
                locations[*size].string = string;
                locations[*size].fret = fret;
                (*size)++;
            }
        }
    }
    if (*size == 0) {
        free(locations);
        printf("Note %s not found on the guitar fretboard.\n", note);
        return NULL;
    }
    return locations;
}

// Function to free the guitar matrix
void freeGuitar(char*** guitar) {
    for (int i = 0; i < STRINGS; i++) {
        for (int j = 0; j < FRETS; j++) {
            free(guitar[i][j]);
        }
        free(guitar[i]);
    }
    free(guitar);
}
