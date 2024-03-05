domain_template = """
(define (domain guitar_fretboard)
  (:requirements :strips :typing :action-costs)
  (:types location note)
  (:predicates
    (matches ?l - location ?n - note)
    (note-placed ?n - note)
    (last-note ?n - note)
    (next-note ?current - note ?next - note) ;Indicates sequence of notes
  )

    (:action place-note
    :parameters (?n - note ?l - location ?prev - note)
    :precondition (and (matches ?l ?n) (last-note ?prev) (next-note ?prev ?n))
    :effect (and 
        (note-placed ?n)
        (not (last-note ?prev))
        (last-note ?n)
        )
    )
{actions}
)
"""

def parse_movement_costs(file_path):
    movements = []
    with open(file_path, 'r') as file:
        for line in file:
            try:
                parts = line.strip().split(', Cost: ')
                move_description = parts[0].replace('Move: ', '')
                cost = int(parts[1])
                from_loc, to_loc = move_description.split(' to ')
                movements.append((from_loc, to_loc, cost))
            except ValueError as e:
                print(f"value error raised at from_loc{from_loc} to_loc: {to_loc}, cost:{cost}", e)
    return movements

def generate_pddl_action(movement, cost):
    start_location, end_location = movement
    action_name = f"move_{start_location}_to_{end_location}".replace(' ', '_')
    return f"""
    (:action {action_name}
        :parameters (?n - note ?start - location ?end - location ?prev - note)
        :precondition (and (matches ?start ?n) (= ?start {start_location}) (= ?end {end_location}))
        :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) {cost}))
    )
"""

def create_new_domain_file_with_actions(new_domain_file_path,movements):
    actions_text = ""
    for movement in movements:
        from_loc, to_loc, cost = movement
        action_text = generate_pddl_action((from_loc, to_loc), cost)
        actions_text += action_text

    new_domain_content = domain_template.format(actions=actions_text)

    with open(new_domain_file_path, 'w') as file:
        file.write(new_domain_content)

    print(f"New domain file '{new_domain_file_path}' created with inserted actions.")


def generate_unique_notes(notes_locations):
    """
    Generate unique identifiers for each note occurrence and maintain their sequence.
    """
    unique_notes = []
    note_sequence = []
    note_counter = {}

    # Generate unique identifiers for each note occurrence
    for note, locations in notes_locations:
        note_id = note_counter.get(note, 0) + 1
        note_counter[note] = note_id
        unique_note = f"{note}-{note_id}"
        unique_notes.append((unique_note, locations))
        note_sequence.append(unique_note)

    return unique_notes, note_sequence

def generate_pddl_objects(unique_notes):
    """
    Generate PDDL objects string for unique note occurrences and locations.
    """
    notes_str = " ".join(note for note, _ in unique_notes)
    locations = set(f"loc{string}_{fret}" for _, locs in unique_notes for string, fret in locs)
    locations_str = " ".join(locations)
    return notes_str, locations_str

def generate_pddl_init(unique_notes, note_sequence):
    """
    Generate PDDL init section for matches and note sequence.
    """
    matches_str = "\n    ".join(f"(matches loc{string}_{fret} {note})" for note, locs in unique_notes for string, fret in locs)
    sequence_str = "\n    ".join(f"(next-note {note_sequence[i]} {note_sequence[i+1]})" for i in range(len(note_sequence)-1))
    last_note_str = f"(last-note {note_sequence[-1]})"
    return matches_str, sequence_str, last_note_str

def generate_pddl_goal(unique_notes):
    """
    Generate PDDL goal section for placing all unique notes.
    """
    return " ".join(f"(note-placed {note})" for note, _ in unique_notes)

def parse_input_file(file_path):
    notes_locations = []
    with open(file_path, 'r') as file:
        for line in file:
            # Skip empty lines or lines not starting with "note"
            if not line.strip().startswith("note"):
                continue
            
            parts = line.strip().split()
            # Check if parts have at least a note name following "note"
            if len(parts) < 2:
                print(f"Skipping incomplete line: {line.strip()}")
                continue

            note = parts[1]
            locations_str = parts[2:]  # Get the location strings

            locations = []
            for loc_str in locations_str:
                try:
                    string, fret = loc_str.split(',')
                    locations.append((int(string), int(fret)))
                except ValueError:
                    # Skip any parts that cannot be correctly parsed
                    print(f"Skipping malformed location entry: {loc_str} in line: {line.strip()}")
                    continue

            if locations:  # Only add notes with valid locations
                notes_locations.append((note, locations))

    return notes_locations


def generate_pddl_problem(notes_locations, output_file="problem.pddl"):
    unique_notes, note_sequence = generate_unique_notes(notes_locations)
    notes_str, locations_str = generate_pddl_objects(unique_notes)
    matches_str, sequence_str, last_note_str = generate_pddl_init(unique_notes, note_sequence)
    goal_str = generate_pddl_goal(unique_notes)

    problem_pddl = f"""(define (problem music_piece)
  (:domain guitar_fretboard)
  (:objects
    {notes_str} - note
    {locations_str} - location
  )
  (:init
    {matches_str}
    {sequence_str}
    {last_note_str}
  )
  (:goal
    (and
      {goal_str}
    )
  )
)
"""
    with open(output_file, "w") as file:
        file.write(problem_pddl)
    print(f"Problem PDDL file '{output_file}' generated.")


def main(input_file_path):
    notes_locations = parse_input_file(input_file_path)
    # print(f"note locations: {notes_locations}")
    print(f"unique_notes {generate_unique_notes(notes_locations)}")
    generate_pddl_problem(notes_locations)
    movement_file = "../../movementCosts.txt"

    domain_file_path = "auto_guitar_domain.pddl"
    movements = parse_movement_costs(movement_file)
    create_new_domain_file_with_actions(domain_file_path,movements)


if __name__ == "__main__":
    input_file_path = "../../noteLocations.txt"  # Change to your actual input file path
    main(input_file_path)
