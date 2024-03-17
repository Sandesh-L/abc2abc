Look at the individual folders for each application (downward, Tabctoabc, abctab2ps) and to build them.


use `cea`, or `lmcut` heuristics. `cea` is faster but `lmcut` is better

./fast-downward.py ./generatePddl/a_domain.pddl ./generatePddl/a_problem.pddl --search "astar(lmcut(verbosity=debug), cost_type=normal)"