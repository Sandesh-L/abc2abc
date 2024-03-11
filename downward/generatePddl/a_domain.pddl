
    
(define (domain guitar_fretboard)
    (:requirements :strips :typing :action-costs)
    (:types location note)
    (:predicates
        (matches ?n - note ?l - location)
        (note-placed ?n - note)
        (prev-loc ?l - location)
    )

    (:functions
        (total-cost)
    )

    
(:action place_note-0_3-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-0_3-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-0_3-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-1_8-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-1_8-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-1_8-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-2_17-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-2_17-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-2_17-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-3_12-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-3_12-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-3_12-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-1_10-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-3_14-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-0_7-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-1_13-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-3_17-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_10-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-1_13-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-3_17-0_12-5E5
    :precondition (and (matches 5E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 5E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-9E5
    :precondition (and (matches 9E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 9E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-13E5
    :precondition (and (matches 13E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 13E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-17E5
    :precondition (and (matches 17E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 17E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-1_17-5E5
    :precondition (and (matches 5E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 5E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-9E5
    :precondition (and (matches 9E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 9E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-13E5
    :precondition (and (matches 13E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 13E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-17E5
    :precondition (and (matches 17E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 17E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-1_13-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-3_17-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-4D5
    :precondition (and (matches 4D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-6D5
    :precondition (and (matches 6D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-8D5
    :precondition (and (matches 8D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-10D5
    :precondition (and (matches 10D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-12D5
    :precondition (and (matches 12D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-14D5
    :precondition (and (matches 14D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-20D5
    :precondition (and (matches 20D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-4D5
    :precondition (and (matches 4D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 4D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-6D5
    :precondition (and (matches 6D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 6D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-8D5
    :precondition (and (matches 8D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 8D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-10D5
    :precondition (and (matches 10D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 10D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-12D5
    :precondition (and (matches 12D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 12D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-14D5
    :precondition (and (matches 14D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 14D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-20D5
    :precondition (and (matches 20D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 20D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-2B4
    :precondition (and (matches 2B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-7B4
    :precondition (and (matches 7B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-11B4
    :precondition (and (matches 11B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-15B4
    :precondition (and (matches 15B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-19B4
    :precondition (and (matches 19B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-21B4
    :precondition (and (matches 21B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-2B4
    :precondition (and (matches 2B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-7B4
    :precondition (and (matches 7B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-11B4
    :precondition (and (matches 11B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-15B4
    :precondition (and (matches 15B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-19B4
    :precondition (and (matches 19B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-21B4
    :precondition (and (matches 21B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-2B4
    :precondition (and (matches 2B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 2B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-7B4
    :precondition (and (matches 7B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 7B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-11B4
    :precondition (and (matches 11B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 11B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-15B4
    :precondition (and (matches 15B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 15B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-19B4
    :precondition (and (matches 19B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 19B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-21B4
    :precondition (and (matches 21B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 21B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-3C5
    :precondition (and (matches 3C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-16C5
    :precondition (and (matches 16C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-18C5
    :precondition (and (matches 18C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-22C5
    :precondition (and (matches 22C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-3C5
    :precondition (and (matches 3C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-16C5
    :precondition (and (matches 16C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-18C5
    :precondition (and (matches 18C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-22C5
    :precondition (and (matches 22C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-3C5
    :precondition (and (matches 3C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 3C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-16C5
    :precondition (and (matches 16C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 16C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-18C5
    :precondition (and (matches 18C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 18C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-22C5
    :precondition (and (matches 22C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 22C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-0_8-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-0_8-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-0_5-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-0_5-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-0_5-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-1_10-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-1_10-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-1_10-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-3_14-0_5-1A4
    :precondition (and (matches 1A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 1A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-0_5-23A4
    :precondition (and (matches 23A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 23A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-1_10-1A4
    :precondition (and (matches 1A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 1A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-1_10-23A4
    :precondition (and (matches 23A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 23A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-3_14-1A4
    :precondition (and (matches 1A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 1A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

(:action place_note-3_14-3_14-23A4
    :precondition (and (matches 23A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 23A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

(:action place_note-3_14-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

)
