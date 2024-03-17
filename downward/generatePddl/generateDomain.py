
def parse_cost_file(file_path, note_by_loc):
    actions = ""
    prev_note = None
    with open(file_path, 'r') as file:
        for line in file:
            locs, cost = line.split(",")
            locs = locs.split()
            loc1, loc2 = locs[1], locs[3]
            c = cost.split(' ')[-1]
            # print(loc2)
            # print(note_by_loc)
            if loc2 in note_by_loc:
                if not prev_note:
                    for note in note_by_loc[loc2]:  # Iterate over all notes for loc2
                        # Generate an action for each note-location pair
                        actions += f"""
    (:action place_note-{loc1}-{loc2}-{note}
        :precondition (and (matches {note} {loc2}) (prev-loc {loc1}))
        :effect (and (note-placed {note}) (prev-loc {loc2}) (prev-note {note})(increase (total-cost) {c}))
    )
    """
                        prev_note = note
                else:
                    for note in note_by_loc[loc2]:  # Iterate over all notes for loc2
                        # Generate an action for each note-location pair
                        actions += f"""
    (:action place_note-{loc1}-{loc2}-{note}
        :precondition (and (matches {note} {loc2}) (prev-loc {loc1}) (prev-note {prev_note}))
        :effect (and (note-placed {note}) (prev-loc {loc2}) (prev-note {note}) (increase (total-cost) {c}))
    )
    """
            else:
                print(f"No notes for location {loc2}")
            
    return actions


def get_note_by_loc(note_file_path):
    note_by_loc = {}
    with open(note_file_path, 'r') as file:
        next(file)
        for line in file:
            note_data = line.split()
            for loc in note_data[2:]:
                notes = []
                if loc not in note_by_loc:
                    note_by_loc[loc] = [(note_data[1])]
                else:
                    note_by_loc[loc].append(note_data[1])


    return note_by_loc
    pass


def generate_domain_file(actions):
    
    domain_file_txt = f"""
    
(define (domain guitar_fretboard)
    (:requirements :strips :typing :action-costs)
    (:types location note)
    (:predicates
        (matches ?n - note ?l - location)
        (note-placed ?n - note)
        (prev-loc ?l - location)
        (prev-note ?n - note)
    )

    (:functions
        (total-cost)
    )

    {actions}
)
"""

    return domain_file_txt


cost_file_path = "../../movementCosts.txt"
note_file_path = "../../noteLocations.txt"

note_by_loc = get_note_by_loc(note_file_path)
actions  = parse_cost_file(cost_file_path,note_by_loc)
dF_txt = generate_domain_file(actions)
with open("./a_domain.pddl", 'w') as file:
    file.write(dF_txt)