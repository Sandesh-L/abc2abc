def parse_notes_file(file_path):
    notes = ""
    locations = ""
    matches = ""
    goals = ""
    with open(file_path, 'r') as file:
        for line_num, line, in enumerate(file):
            note_data = line.split()
            if line_num == 0:
                first_note = note_data[1]
                first_note_loc = note_data[2]

            notes += f" {note_data[1]}"
            for loc in note_data[2:]:
                if loc not in locations:
                    locations += f" {loc}"
            matches += " ".join(f"(matches {note_data[1]} {location})" for location in note_data[2:]) + "\n"
            goals += f" (note-placed {note_data[1]})"

    return notes, locations, first_note, first_note_loc, matches, goals

def generate_problem_file(file_path):

    notes, locations, first_note, first_note_loc, matches, goals = parse_notes_file(file_path)
    problem_file_txt = f"""
(define (problem music_piece)
    (:domain guitar_fretboard)
    (:objects
        {notes} - note
        {locations} - location
    )

    (:init
        ; first note is set
        (note-placed {first_note})
        (prev-loc {first_note_loc})
        (prev-note {first_note})

        ; define note location pairs
        {matches}

        ; initialize cost
        (= (total-cost) 0)
    )
    (:goal
        (and
            {goals}    
        )
    )
    (:metric minimize (total-cost))
)

"""
    return problem_file_txt

notes_file_path = "../../noteLocations.txt"
pf_txt = generate_problem_file(notes_file_path)
with open("./a_problem.pddl", 'w') as file:
    file.write(pf_txt)
