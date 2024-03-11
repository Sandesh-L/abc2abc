#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "guitar_model.h"

#define STRINGS 6
#define FRETS 19  // The actual number of frets is 18 the +1 is for the open fret

// Function declarations
char*** createGuitar();
void printGuitar(char*** guitar);
NoteLocation* findNote(char*** guitar, const char* note, int* size);
void freeGuitar(char*** guitar);

// Function to create the guitar matrix
char*** createGuitar() {
    // Allocate memory for the guitar matrix
    char*** guitar = (char***)malloc(STRINGS * sizeof(char**));
    for (int i = 0; i < STRINGS; ++i) {
        guitar[i] = (char**)malloc(FRETS * sizeof(char*));
    }

    // Initialize the notes for each string and fret
    char* notes[STRINGS][FRETS] = {
        // E string (1st string)
        {"E4", "F4", "F#4/Gb4", "G4", "G#4/Ab4", "A4", "A#4/Bb4", "B4", "C5", "C#5/Db5", "D5", "D#5/Eb5", "E5", "F5", "F#5/Gb5", "G5", "G#5/Ab5", "A5", "A#5/Bb5"},
        // B string (2nd string)
        {"B3", "C4", "C#4/Db4", "D4", "D#4/Eb4", "E4", "F4", "F#4/Gb4", "G4", "G#4/Ab4", "A4", "A#4/Bb4", "B4", "C5", "C#5/Db5", "D5", "D#5/Eb5", "E5", "F5"},
        // D string (4th string)
        {"D3", "D#3/Eb3", "E3", "F3", "F#3/Gb3", "G3", "G#3/Ab3", "A3", "A#3/Bb3", "B3", "C4", "C#4/Db4", "D4", "D#4/Eb4", "E4", "F4", "F#4/Gb4", "G4", "G#4/Ab4"},
        // G string (3rd string)
        {"G3", "G#3/Ab3", "A3", "A#3/Bb3", "B3", "C4", "C#4/Db4", "D4", "D#4/Eb4", "E4", "F4", "F#4/Gb4", "G4", "G#4/Ab4", "A4", "A#4/Bb4", "B4", "C5", "C#5/Db5"},
        // A string (5th string)
        {"A2", "A#2/Bb2", "B2", "C3", "C#3/Db3", "D3", "D#3/Eb3", "E3", "F3", "F#3/Gb3", "G3", "G#3/Ab3", "A3", "A#3/Bb3", "B3", "C4", "C#4/Db4", "D4", "D#4/Eb4"},
        // E string (6th string)
        {"E2", "F2", "F#2/Gb2", "G2", "G#2/Ab2", "A2", "A#2/Bb2", "B2", "C3", "C#3/Db3", "D3", "D#3/Eb3", "E3", "F3", "F#3/Gb3", "G3", "G#3/Ab3", "A3", "A#3/Bb3"}
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
    // printf("Searching for note: %s\n", note);
    // printf("looking for: %s \n", note);
    for (int string = 0; string < STRINGS; string++) {
        for (int fret = 0; fret < FRETS; fret++) {
            if (strstr(guitar[string][fret], note) != NULL) {
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
        printf("\n Note %s not found on the guitar fretboard.\n", note);
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


char* convertLocationToNote(NoteLocation* location){
    // TODO: there is a bug in the abctab2ps program. 'l' should represent the 10th fret (as the number 10) but 'x' is written instead

    int commaCount = location->string - 1;
    char* note = malloc((commaCount + 2) * sizeof(char)); // Allocate memory for commas, fret character, and null terminator
    if (location == NULL){
        fprintf(stderr, "Location pointer is NULL\n");
        return NULL;
    }
    
    // char* note = malloc((location->string +1)* sizeof(char));
    if (note == NULL){
        fprintf(stderr, "Memory allocation failed \n");
        exit(EXIT_FAILURE);
    }

    int noteLength = 0;
    // Fill with commas up to one less than the string number to simulate string position
    for (int i=0; i<location->string; i++){
        note[i] = ',';
        noteLength++;
    }

    char fretChar = 'a' + location->fret;
    if (fretChar >= 'j'){
        fretChar++; // Skip 'j'
    }

    note[noteLength]=fretChar;
    note[noteLength+1] = '\0';

    return note;
}


int calculateDistance(NoteLocation loc1, NoteLocation loc2){
    int stringDistance = abs(loc1.string - loc2.string);
    int fretDistance = abs(loc1.fret - loc2.fret);
    return stringDistance + fretDistance;
}


void updatePreviousLocations(parser_status_t* status, NoteLocation* locations, int size){
    if (status->prev_note_locations != NULL) {
        free(status->prev_note_locations);
        status->prev_note_locations = NULL;  // Prevent dangling pointer
    }

    if (locations == NULL || size == 0) {
        // Handle invalid input gracefully
        status->prev_note_locations_size = 0;
        return;
    }

    // Allocate new memory and copy locations
    status->prev_note_locations = (NoteLocation*)malloc(size * sizeof(NoteLocation));
    if (status->prev_note_locations == NULL) {
        // Handle memory allocation failure
        fprintf(stderr, "Failed to allocate memory for previous note locations.\n");
        status->prev_note_locations_size = 0;
        return;
    }
    memcpy(status->prev_note_locations, locations, size * sizeof(NoteLocation));
    status->prev_note_locations_size = size;
}

void calculateAndStoreMoveCosts(parser_status_t* status, NoteLocation* newLocations, int size){
    if (status->prev_note_locations_size == 0 || size == 0){
        printf("One of the note locations is missing. \n");
    }
    for (int i = 0; i < status->prev_note_locations_size; i++){
        for (int j=0; j < size; j++){
            int cost = calculateDistance(status->prev_note_locations[i],newLocations[j]);
            fprintf(status->movement_costs_file_ptr, "Move: %d_%d to %d_%d, Cost: %d\n",
                   status->prev_note_locations[i].string, status->prev_note_locations[i].fret,
                   newLocations[j].string, newLocations[j].fret, cost);
        }
    }
    updatePreviousLocations(status, newLocations, size);
}