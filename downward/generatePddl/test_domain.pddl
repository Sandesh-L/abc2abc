(define (domain guitar_fretboard)
    (:requirements :strips :typing :action-costs)
    (:types
        note location
    )

    (:predicates
        (at ?n - note ?l - location)
        (matches ?l - location ?n - note)
        (note-placed ?n - note)
    )

    (:functions (total-cost))

    (:action place-note
        :parameters (?n - note ?l - location)
        :precondition (matches ?l ?n)
        :effect (and
            (note-placed ?n)
            (increase (total-cost) 1)
        )
    )

    ; Move: 0_1 to 2_1, Cost: 1
    (:action move-0_1-to-2_1
        :parameters (?n - note)
        :precondition (at ?n l0_1)
        :effect (and
            (not (at ?n l0_1))
            (at ?n l2_1)
            (increase (total-cost) 1)
        )
    )

    ; Move: 0_1 to 3_10, Cost: 11
    (:action move-0_1-to-3_10
        :parameters (?n - note)
        :precondition (at ?n l0_1)
        :effect (and
            (not (at ?n l0_1))
            (at ?n l3_10)
            (increase (total-cost) 11)
        )
    )

    ; Move: 0_1 to 4_5, Cost: 7
    (:action move-0_1-to-4_5
        :parameters (?n - note)
        :precondition (at ?n l0_1)
        :effect (and
            (not (at ?n l0_1))
            (at ?n l4_5)
            (increase (total-cost) 7)
        )
    )

    ; Move: 0_1 to 5_15, Cost: 18
    (:action move-0_1-to-5_15
        :parameters (?n - note)
        :precondition (at ?n l0_1)
        :effect (and
            (not (at ?n l0_1))
            (at ?n l5_15)
            (increase (total-cost) 18)
        )
    )

    ; Move: 1_6 to 2_1, Cost: 5
    (:action move-1_6-to-2_1
        :parameters (?n - note)
        :precondition (at ?n l1_6)
        :effect (and
            (not (at ?n l1_6))
            (at ?n l2_1)
            (increase (total-cost) 5)
        )
    )

    ; Move: 1_6 to 3_10, Cost: 5
    (:action move-1_6-to-3_10
        :parameters (?n - note)
        :precondition (at ?n l1_6)
        :effect (and
            (not (at ?n l1_6))
            (at ?n l3_10)
            (increase (total-cost) 5)
        )
    )

    ; Move: 1_6 to 4_5, Cost: 3
    (:action move-1_6-to-4_5
        :parameters (?n - note)
        :precondition (at ?n l1_6)
        :effect (and
            (not (at ?n l1_6))
            (at ?n l4_5)
            (increase (total-cost) 3)
        )
    )

    ; Move: 1_6 to 5_15, Cost: 12
    (:action move-1_6-to-5_15
        :parameters (?n - note)
        :precondition (at ?n l1_6)
        :effect (and
            (not (at ?n l1_6))
            (at ?n l5_15)
            (increase (total-cost) 12)
        )
    )

    ; Move: 2_15 to 2_1, Cost: 15
    (:action move-2_15-to-2_1
        :parameters (?n - note)
        :precondition (at ?n l2_15)
        :effect (and
            (not (at ?n l2_15))
            (at ?n l2_1)
            (increase (total-cost) 15)
        )
    )

    ; Move: 2_15 to 3_10, Cost: 5
    (:action move-2_15-to-3_10
        :parameters (?n - note)
        :precondition (at ?n l2_15)
        :effect (and
            (not (at ?n l2_15))
            (at ?n l3_10)
            (increase (total-cost) 5)
        )
    )

    ; Move: 2_15 to 4_5, Cost: 11
    (:action move-2_15-to-4_5
        :parameters (?n - note)
        :precondition (at ?n l2_15)
        :effect (and
            (not (at ?n l2_15))
            (at ?n l4_5)
            (increase (total-cost) 11)
        )
    )

    ; Move: 2_15 to 5_15, Cost: 2
    (:action move-2_15-to-5_15
        :parameters (?n - note)
        :precondition (at ?n l2_15)
        :effect (and
            (not (at ?n l2_15))
            (at ?n l5_15)
            (increase (total-cost) 2)
        )
    )

    ; Move: 3_10 to 2_1, Cost: 11
    (:action move-3_10-to-2_1
        :parameters (?n - note)
        :precondition (at ?n l3_10)
        :effect (and
            (not (at ?n l3_10))
            (at ?n l2_1)
            (increase (total-cost) 11)
        )
    )

    ; Move: 3_10 to 4_5, Cost: 5
    (:action move-3_10-to-4_5
        :parameters (?n - note)
        :precondition (at ?n l3_10)
        :effect (and
            (not (at ?n l3_10))
            (at ?n l4_5)
            (increase (total-cost) 5)
        )
    )

    ; Move: 3_10 to 5_15, Cost: 6
    (:action move-3_10-to-5_15
        :parameters (?n - note)
        :precondition (at ?n l3_10)
        :effect (and
            (not (at ?n l3_10))
            (at ?n l5_15)
            (increase (total-cost) 6)
        )
    )

    ; Move: 1_1 to 0_8, Cost: 8
    (:action move-1_1-to-0_8
        :parameters (?n - note)
        :precondition (at ?n l1_1)
        :effect (and
            (not (at ?n l1_1))
            (at ?n l0_8)
            (increase (total-cost) 8)
        )
    )

    ; Move: 1_1 to 1_13, Cost: 12
    (:action move-1_1-to-1_13
        :parameters (?n - note)
        :precondition (at ?n l1_1)
        :effect (and
            (not (at ?n l1_1))
            (at ?n l1_13)
            (increase (total-cost) 12)
        )
    )

    ; Move: 1_1 to 3_17, Cost: 18
    (:action move-1_1-to-3_17
        :parameters (?n - note)
        :precondition (at ?n l1_1)
        :effect (and
            (not (at ?n l1_1))
            (at ?n l3_17)
            (increase (total-cost) 18)
        )
    )

    ; Move: 2_10 to 0_8, Cost: 4
    (:action move-2_10-to-0_8
        :parameters (?n - note)
        :precondition (at ?n l2_10)
        :effect (and
            (not (at ?n l2_10))
            (at ?n l0_8)
            (increase (total-cost) 4)
        )
    )

    ; Move: 2_10 to 1_13, Cost: 4
    (:action move-2_10-to-1_13
        :parameters (?n - note)
        :precondition (at ?n l2_10)
        :effect (and
            (not (at ?n l2_10))
            (at ?n l1_13)
            (increase (total-cost) 4)
        )
    )

    ; Move: 2_10 to 3_17, Cost: 8
    (:action move-2_10-to-3_17
        :parameters (?n - note)
        :precondition (at ?n l2_10)
        :effect (and
            (not (at ?n l2_10))
            (at ?n l3_17)
            (increase (total-cost) 8)
        )
    )

    ; Move: 3_5 to 0_8, Cost: 6
    (:action move-3_5-to-0_8
        :parameters (?n - note)
        :precondition (at ?n l3_5)
        :effect (and
            (not (at ?n l3_5))
            (at ?n l0_8)
            (increase (total-cost) 6)
        )
    )

    ; Move: 3_5 to 1_13, Cost: 10
    (:action move-3_5-to-1_13
        :parameters (?n - note)
        :precondition (at ?n l3_5)
        :effect (and
            (not (at ?n l3_5))
            (at ?n l1_13)
            (increase (total-cost) 10)
        )
    )

    ; Move: 3_5 to 3_17, Cost: 12
    (:action move-3_5-to-3_17
        :parameters (?n - note)
        :precondition (at ?n l3_5)
        :effect (and
            (not (at ?n l3_5))
            (at ?n l3_17)
            (increase (total-cost) 12)
        )
    )

    ; Move: 4_15 to 0_8, Cost: 11
    (:action move-4_15-to-0_8
        :parameters (?n - note)
        :precondition (at ?n l4_15)
        :effect (and
            (not (at ?n l4_15))
            (at ?n l0_8)
            (increase (total-cost) 11)
        )
    )

    ; Move: 4_15 to 1_13, Cost: 5
    (:action move-4_15-to-1_13
        :parameters (?n - note)
        :precondition (at ?n l4_15)
        :effect (and
            (not (at ?n l4_15))
            (at ?n l1_13)
            (increase (total-cost) 5)
        )
    )

    ; Move: 4_15 to 3_17, Cost: 3
    (:action move-4_15-to-3_17
        :parameters (?n - note)
        :precondition (at ?n l4_15)
        :effect (and
            (not (at ?n l4_15))
            (at ?n l3_17)
            (increase (total-cost) 3)
        )
    )

)