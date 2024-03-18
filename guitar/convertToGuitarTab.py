import re
def convert_location_to_note(string, fret):
    if string is None or fret is None:
        raise ValueError("Invalid input: string and fret cannot be None")

    comma_count = string
    note = [',' for _ in range(comma_count)]

    # print("String and Fret: ",string, fret)

    fret_char = chr(ord('a') + fret)
    if fret_char >= 'j':
        fret_char = chr(ord(fret_char) + 1)  # Skip 'j'

    note.append(fret_char)
    # print("note: ", note)
    return ''.join(note)

def parse_plan(plan_file_path, note_location_file_path):

    notes = {}

    with open(note_location_file_path, 'r') as nlf:
        first_note_location_data = nlf.readline().split()
        note_name = first_note_location_data[1][1:]
        first_location = first_note_location_data[2].split("_")
        string = first_location[0]
        fret = first_location[1]
        print(f"converting first note string: {string}, fret: {fret}")
        note = convert_location_to_note(int(string),int(fret))
        notes[0] = (note,note_name)

    with open(plan_file_path, 'r') as file:
        for line in file:
            line = line.strip()

            if line.startswith('(place_note-'):
                print(line)
                match = re.search(r'\(place\_note-\d+\_\d+-(\d+)\_(\d+)-(\d+)(([a-gA-G]|[a-gA-G][#b])\d+)', line, re.IGNORECASE)
                print(match)

                if match:
                    string = int(match.group(1))
                    fret = int(match.group(2))
                    sequence = int(match.group(3))
                    note_name = match.group(4)
                    print(f"printing match values: string: {string}, fret: {fret}, sequence: {sequence}, note_name: {note_name}")
                    note = convert_location_to_note(string,fret)
                    notes[sequence] = (note,note_name)
                else:
                    print("Unable to MATCH")


        sorted_notes = [notes[seq] for seq in sorted(notes.keys())]
        print(sorted_notes)
        return sorted_notes

def create_abc_tab(parsed_abc_file_path, notes):
    with open(parsed_abc_file_path, 'r') as abc_file:
        lines = abc_file.readlines()
    
    abc_tab_lines = []
    in_body = False

    for line in lines:
        line = line.strip()

        if line.startswith('%'):
            abc_tab_lines.append(line)
        else:
            def replace_placeholder(match):
                placeholder = match.group(1)
                if placeholder.isdigit():
                    index = int(placeholder)
                    if 0<=index <len(notes):
                        return notes[index][0]
                return match.group(0)
            
            line = re.sub(r'\{(\d+)\}', replace_placeholder, line)
            abc_tab_lines.append(line)
    
    abc_tab = '\n'.join(abc_tab_lines)
    print("abc_tab\n", abc_tab)
    with open("../guitar_tab_input.abc", 'w') as file:
        file.write(abc_tab)


plan_file_path = "../downward/sas_plan"
note_location_file_path = "../noteLocations.txt"
parsed_abc_file_path = "../abc_output.txt"
notes = parse_plan(plan_file_path, note_location_file_path)
print(notes)
create_abc_tab(parsed_abc_file_path, notes)
