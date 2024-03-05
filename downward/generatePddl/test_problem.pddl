(define (problem guitar_fretboard_problem)
    (:domain guitar_fretboard)
    (:objects
        1f4 2c4 3c5 - note
        l0_1 l1_6 l2_15 l3_10 l1_1 l2_10 l3_5 l4_15 l0_8 l1_13 l3_17 - location
    )

    (:init

        (= (total-cost) 0)

        ;Define note locations
        (at 1f4 l0_1) (at 1f4 l1_6) (at 1f4 l2_15) (at 1f4 l3_10)
        (at 2c4 l2_10) (at 2c4 l3_5) (at 2c4 l4_15) (at 2c4 l1_1) 
        (at 3c5 l1_13) (at 3c5 l3_17) (at 3c5 l0_8)

        (matches l0_1 1f4)
        (matches l1_6 1f4)
        (matches l2_15 1f4)
        (matches l3_10 1f4)

        (matches l2_10 2c4)
        (matches l3_5 2c4)
        (matches l4_15 2c4)
        (matches l1_1 2c4)

        (matches l1_13 3c5)
        (matches l3_17 3c5)
        (matches l0_8 3c5)

        
    )

    (:goal
        (and
            (exists (?l - location) (at 1f4 ?l))
            (exists (?l - location) (at 2c4 ?l))
            (exists (?l - location) (at 3c5 ?l))
            (note-placed 2c4)
            (note-placed 1f4)
            (note-placed 3c5)

        )
    )
    (:metric minimize (total-cost))
)