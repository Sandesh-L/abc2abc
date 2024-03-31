The project is used to generate guitar tab music from music in ABC notation. This project is a work in progress and will continued to be improved on.

Usage:
    - Look at the individual folders for each package (downward, Tabctoabc, abctab2ps) and to build them.
    - For default use: Run the `get_tab.sh` file with the location of the `.abc` file you want to convert.
        - example use: `source get_tab.sh ../abcMusic/forTesting/LakesOfPontchartrain_s.abc`
        - `../` the abc file is used by a program in a different folder 
    - If you want to use a different algorithm to decide note location then change the `--search` criteria in the `get_tab.sh` file  
        - use `cea`, or `lmcut` heuristics. `cea` is faster but `lmcut` is better
        - visit the fast-downward website for other search algorithms