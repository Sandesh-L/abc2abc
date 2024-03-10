
    
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

    
(:action place_note-0_3-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 0_3))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 2
))
)

(:action place_note-0_3-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 0_3))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-0_3-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-0_3-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-0_3-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 0_3))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 14
))
)

(:action place_note-1_8-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 1_8))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 4
))
)

(:action place_note-1_8-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 1_8))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 2
))
)

(:action place_note-1_8-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-1_8-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-1_8-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 1_8))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 8
))
)

(:action place_note-2_17-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 2_17))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 14
))
)

(:action place_note-2_17-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 2_17))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 8
))
)

(:action place_note-2_17-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-2_17-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-2_17-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 2_17))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 4
))
)

(:action place_note-3_12-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 3_12))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 10
))
)

(:action place_note-3_12-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 3_12))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 4
))
)

(:action place_note-3_12-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-3_12-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-3_12-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 3_12))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_5))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 2
))
)

(:action place_note-0_5-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_5))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 8
))
)

(:action place_note-0_5-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-0_5-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_5))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 14
))
)

(:action place_note-1_10-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_10))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 4
))
)

(:action place_note-1_10-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_10))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 2
))
)

(:action place_note-1_10-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-1_10-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_10))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 8
))
)

(:action place_note-3_14-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 3_14))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 10
))
)

(:action place_note-3_14-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 3_14))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 4
))
)

(:action place_note-3_14-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-3_14-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 3_14))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 2
))
)

(:action place_note-0_7-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_8))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_8-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-0_8-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_8))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 8
))
)

(:action place_note-1_13-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_13))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_13))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-3_17-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 3_17))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 10
))
)

(:action place_note-3_17-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-3_17-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 3_17))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_10-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-0_10-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-0_10-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 0_10))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 8
))
)

(:action place_note-1_15-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-1_15-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-1_15-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 1_15))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 4
))
)

(:action place_note-1_17-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 8
))
)

(:action place_note-1_17-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-1_17-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_17))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 2
))
)

(:action place_note-0_10-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 0_8))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 4
))
)

(:action place_note-0_8-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-0_8-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 0_8))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 10
))
)

(:action place_note-1_13-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 1_13))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 2
))
)

(:action place_note-1_13-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-1_13-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 1_13))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 4
))
)

(:action place_note-3_17-0_12-6E5
    :precondition (and (matches 6E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 6E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-10E5
    :precondition (and (matches 10E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 10E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-14E5
    :precondition (and (matches 14E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 14E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-0_12-18E5
    :precondition (and (matches 18E5 0_12) (prev-loc 3_17))
    :effect (and (note-placed 18E5) (prev-loc 0_12) (increase (total-cost) 8
))
)

(:action place_note-3_17-1_17-6E5
    :precondition (and (matches 6E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 6E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-10E5
    :precondition (and (matches 10E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 10E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-14E5
    :precondition (and (matches 14E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 14E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-3_17-1_17-18E5
    :precondition (and (matches 18E5 1_17) (prev-loc 3_17))
    :effect (and (note-placed 18E5) (prev-loc 1_17) (increase (total-cost) 2
))
)

(:action place_note-0_12-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 0_12))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 4
))
)

(:action place_note-0_12-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 0_12))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 2
))
)

(:action place_note-0_12-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-0_12-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 0_12))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 8
))
)

(:action place_note-1_17-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 1_17))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 10
))
)

(:action place_note-1_17-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 1_17))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 4
))
)

(:action place_note-1_17-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-1_17-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 1_17))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 2
))
)

(:action place_note-0_8-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_8))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 1
))
)

(:action place_note-0_8-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_8))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 5
))
)

(:action place_note-0_8-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-0_8-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_8))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 11
))
)

(:action place_note-1_13-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_13))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 7
))
)

(:action place_note-1_13-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_13))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 1
))
)

(:action place_note-1_13-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-1_13-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_13))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 5
))
)

(:action place_note-3_17-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 3_17))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 13
))
)

(:action place_note-3_17-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 3_17))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 7
))
)

(:action place_note-3_17-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-3_17-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 3_17))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-0_7-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-0_7-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 0_7))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 9
))
)

(:action place_note-1_12-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-1_12-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 1_12))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-0_10-5D5
    :precondition (and (matches 5D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-7D5
    :precondition (and (matches 7D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-9D5
    :precondition (and (matches 9D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-11D5
    :precondition (and (matches 11D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-13D5
    :precondition (and (matches 13D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-15D5
    :precondition (and (matches 15D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-0_10-21D5
    :precondition (and (matches 21D5 0_10) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 0_10) (increase (total-cost) 9
))
)

(:action place_note-3_16-1_15-5D5
    :precondition (and (matches 5D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 5D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-7D5
    :precondition (and (matches 7D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 7D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-9D5
    :precondition (and (matches 9D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 9D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-11D5
    :precondition (and (matches 11D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 11D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-13D5
    :precondition (and (matches 13D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 13D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-15D5
    :precondition (and (matches 15D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 15D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-3_16-1_15-21D5
    :precondition (and (matches 21D5 1_15) (prev-loc 3_16))
    :effect (and (note-placed 21D5) (prev-loc 1_15) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-0_10-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-0_10-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 0_10))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-3B4
    :precondition (and (matches 3B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-8B4
    :precondition (and (matches 8B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-12B4
    :precondition (and (matches 12B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-16B4
    :precondition (and (matches 16B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-20B4
    :precondition (and (matches 20B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-0_7-22B4
    :precondition (and (matches 22B4 0_7) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 0_7) (increase (total-cost) 9
))
)

(:action place_note-1_15-1_12-3B4
    :precondition (and (matches 3B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-8B4
    :precondition (and (matches 8B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-12B4
    :precondition (and (matches 12B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-16B4
    :precondition (and (matches 16B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-20B4
    :precondition (and (matches 20B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-1_12-22B4
    :precondition (and (matches 22B4 1_12) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 1_12) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-3B4
    :precondition (and (matches 3B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 3B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-8B4
    :precondition (and (matches 8B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 8B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-12B4
    :precondition (and (matches 12B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 12B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-16B4
    :precondition (and (matches 16B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 16B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-20B4
    :precondition (and (matches 20B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 20B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-1_15-3_16-22B4
    :precondition (and (matches 22B4 3_16) (prev-loc 1_15))
    :effect (and (note-placed 22B4) (prev-loc 3_16) (increase (total-cost) 3
))
)

(:action place_note-0_7-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 1
))
)

(:action place_note-0_7-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 7
))
)

(:action place_note-0_7-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-0_7-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 0_7))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 13
))
)

(:action place_note-1_12-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 5
))
)

(:action place_note-1_12-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 1
))
)

(:action place_note-1_12-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-1_12-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 1_12))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 7
))
)

(:action place_note-3_16-0_8-4C5
    :precondition (and (matches 4C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-17C5
    :precondition (and (matches 17C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-19C5
    :precondition (and (matches 19C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-0_8-23C5
    :precondition (and (matches 23C5 0_8) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 0_8) (increase (total-cost) 11
))
)

(:action place_note-3_16-1_13-4C5
    :precondition (and (matches 4C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-17C5
    :precondition (and (matches 17C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-19C5
    :precondition (and (matches 19C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-1_13-23C5
    :precondition (and (matches 23C5 1_13) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 1_13) (increase (total-cost) 5
))
)

(:action place_note-3_16-3_17-4C5
    :precondition (and (matches 4C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 4C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-17C5
    :precondition (and (matches 17C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 17C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-19C5
    :precondition (and (matches 19C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 19C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-3_16-3_17-23C5
    :precondition (and (matches 23C5 3_17) (prev-loc 3_16))
    :effect (and (note-placed 23C5) (prev-loc 3_17) (increase (total-cost) 1
))
)

(:action place_note-0_8-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 0_8))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 0_8))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-0_8-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-0_8-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-0_8-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 0_8))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 1_13))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 9
))
)

(:action place_note-1_13-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 1_13))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-1_13-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 1_13))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 3_17))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 15
))
)

(:action place_note-3_17-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 3_17))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 9
))
)

(:action place_note-3_17-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-3_17-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 3_17))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 3
))
)

(:action place_note-0_5-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 0_5))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 0
))
)

(:action place_note-0_5-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 0_5))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-0_5-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-0_5-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-0_5-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 0_5))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 12
))
)

(:action place_note-1_10-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 1_10))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 6
))
)

(:action place_note-1_10-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 1_10))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 0
))
)

(:action place_note-1_10-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-1_10-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-1_10-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 1_10))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 6
))
)

(:action place_note-3_14-0_5-2A4
    :precondition (and (matches 2A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 2A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-0_5-24A4
    :precondition (and (matches 24A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-0_5-25A4
    :precondition (and (matches 25A4 0_5) (prev-loc 3_14))
    :effect (and (note-placed 25A4) (prev-loc 0_5) (increase (total-cost) 12
))
)

(:action place_note-3_14-1_10-2A4
    :precondition (and (matches 2A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 2A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-1_10-24A4
    :precondition (and (matches 24A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-1_10-25A4
    :precondition (and (matches 25A4 1_10) (prev-loc 3_14))
    :effect (and (note-placed 25A4) (prev-loc 1_10) (increase (total-cost) 6
))
)

(:action place_note-3_14-3_14-2A4
    :precondition (and (matches 2A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 2A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

(:action place_note-3_14-3_14-24A4
    :precondition (and (matches 24A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 24A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

(:action place_note-3_14-3_14-25A4
    :precondition (and (matches 25A4 3_14) (prev-loc 3_14))
    :effect (and (note-placed 25A4) (prev-loc 3_14) (increase (total-cost) 0
))
)

)
