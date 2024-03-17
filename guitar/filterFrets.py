def find_optimal_fret_range(notes):
    min_fret = float('inf')
    max_fret = float('-inf')

    for note in notes:
        frets = [int(fret.split('_')[1]) for fret in note.split()[2:]]
        min_fret = min(min_fret, min(frets))
        max_fret = max(max_fret, min(frets))

    return min_fret, max_fret

def filter_notes(notes, min_fret, max_fret):
    filtered_notes = []

    for note in notes:
        note_parts = note.split()
        note_name = ' '.join(note_parts[:2])
        # note_name = note_parts[0]
        filtered_frets = [fret for fret in note_parts[2:] if min_fret <= int(fret.split('_')[1]) <= max_fret]
        filtered_note = f"{note_name} {' '.join(filtered_frets)}"
        filtered_notes.append(filtered_note)

    return filtered_notes

with open("../noteLocations.txt", "r") as file:
    notes = file.read().splitlines()

min_fret, max_fret = find_optimal_fret_range(notes)
filtered_notes = filter_notes(notes, min_fret, max_fret)

print(f"Optimal fret range: {min_fret} to {max_fret}")

with open("../noteLocations.txt", "w") as file:
    # file.write(f"Optimal fret range: {min_fret} to {max_fret}\n")
    file.write("\n".join(filtered_notes))

print("Filtered fret ranges written to noteLocations.txt")


