#!/bin/bash

process_tabtoabc(){
    local file="$1"
    
    cd Tabctoabc
    make clean
    make Tabctoabc
    ls
    ./Tabctoabc "$file"

    cd ..
}

process_filterFrets(){
    cd guitar
        python3 filterFrets.py
        cd ..
}

process_downward(){
    cd downward
        ./build.py
        echo "Generating PDDL files"
        cd generatePddl
            python3 generateDomain.py
            python3 generateProblem.py
            cd ..
        echo "Running Fast downward"
        # ./fast-downward.py  --alias seq-sat-lama-2011 ./generatePddl/a_domain.pddl ./generatePddl/a_problem.pddl 
        ./fast-downward.py ./generatePddl/a_domain.pddl ./generatePddl/a_problem.pddl --search "astar(lmcut(verbosity=debug), cost_type=normal)"
        cd ..
    cd guitar
        ls
        python3 convertToGuitarTab.py
        cd ..
}

process_abctab2ps(){
    cd abctab2ps
        cd src
            make
            ./abctab2ps ../../guitar_tab_input.abc
            
            ps2pdf out.ps
            mv ./out.pdf ../../out.pdf
            cd ..
        cd ..

}

# Check if a file name is provided as a parameter
if [ $# -eq 0 ]; then
    echo "Please provide a file name as a parameter."
    exit 1
fi

file="$1"

echo "input file: $file"

# Call the functions with different variables
process_tabtoabc "$file"
process_filterFrets
process_downward
process_abctab2ps

echo "Processing complete."