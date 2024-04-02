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

    
    (:action place_note-2_2-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 2_2))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4)(increase (total-cost) 3
))
    )
    
    (:action place_note-2_2-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 2_2))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4)(increase (total-cost) 3
))
    )
    
    (:action place_note-2_2-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 2_2))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4)(increase (total-cost) 3
))
    )
    
    (:action place_note-2_2-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 2_2))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4)(increase (total-cost) 3
))
    )
    
    (:action place_note-2_2-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_2-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_2-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_2-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_2-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-2_2-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-2_2-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-2_2-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-2_2-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-2_2-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-2_2-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-2_2-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 2_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-3_7-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_7-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_7-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_7-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_7-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_7-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_7-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_7-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_7-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 3_7) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_12-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_12-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_12-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_12-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_12-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_12-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_12-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_12-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_12-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-4_12-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-4_12-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-4_12-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-4_12-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-4_12-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-4_12-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-4_12-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 4_12) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-5_17-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_17-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_17-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_17-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_17-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 23
))
    )
    
    (:action place_note-5_17-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 23
))
    )
    
    (:action place_note-5_17-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 23
))
    )
    
    (:action place_note-5_17-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 23
))
    )
    
    (:action place_note-5_17-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-5_17-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-5_17-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-5_17-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-5_17-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-5_17-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-5_17-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-5_17-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 5_17) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 1
))
    )
    
    (:action place_note-1_3-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 9
))
    )
    
    (:action place_note-1_3-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 9
))
    )
    
    (:action place_note-1_3-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 18
))
    )
    
    (:action place_note-1_3-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 18
))
    )
    
    (:action place_note-1_3-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_3-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 27
))
    )
    
    (:action place_note-2_7-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 11
))
    )
    
    (:action place_note-2_7-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 11
))
    )
    
    (:action place_note-2_7-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_7-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_12-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_12-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_12-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_17-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_17-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_17-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_17-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_17-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_17-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_7-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_7-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_7-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_7-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_7-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_7-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_7-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_7-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_12-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_12-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_12-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_12-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_12-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_12-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_12-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_12-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 16
))
    )
    
    (:action place_note-2_16-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_16-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_16-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_16-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_16-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_16-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_16-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_16-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_5-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_5-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_5-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 15
))
    )
    
    (:action place_note-0_5-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 15
))
    )
    
    (:action place_note-0_5-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-0_5-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_10-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 7
))
    )
    
    (:action place_note-1_10-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 7
))
    )
    
    (:action place_note-1_10-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_10-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_10-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-1_10-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_14-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-2_14-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-2_14-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_14-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_14-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_14-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_19-0_7-2B4
        :precondition (and (matches 2B4 0_7) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 0_7) (prev-note 2B4) (increase (total-cost) 27
))
    )
    
    (:action place_note-3_19-0_7-4B4
        :precondition (and (matches 4B4 0_7) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 0_7) (prev-note 4B4) (increase (total-cost) 27
))
    )
    
    (:action place_note-3_19-1_12-2B4
        :precondition (and (matches 2B4 1_12) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 1_12) (prev-note 2B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_19-1_12-4B4
        :precondition (and (matches 4B4 1_12) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 1_12) (prev-note 4B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_19-2_16-2B4
        :precondition (and (matches 2B4 2_16) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 2B4) (prev-loc 2_16) (prev-note 2B4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_19-2_16-4B4
        :precondition (and (matches 4B4 2_16) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 4B4) (prev-loc 2_16) (prev-note 4B4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_7-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_7-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_7-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 1
))
    )
    
    (:action place_note-0_7-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 1
))
    )
    
    (:action place_note-0_7-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_7-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_7-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 21
))
    )
    
    (:action place_note-0_7-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 0_7) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 21
))
    )
    
    (:action place_note-1_12-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 21
))
    )
    
    (:action place_note-1_12-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 21
))
    )
    
    (:action place_note-1_12-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_12-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_12-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 3
))
    )
    
    (:action place_note-1_12-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 3
))
    )
    
    (:action place_note-1_12-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_12-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 1_12) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_16-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 30
))
    )
    
    (:action place_note-2_16-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 30
))
    )
    
    (:action place_note-2_16-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 19
))
    )
    
    (:action place_note-2_16-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 19
))
    )
    
    (:action place_note-2_16-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_16-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_16-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 1
))
    )
    
    (:action place_note-2_16-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 2_16) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 1
))
    )
    
    (:action place_note-0_2-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_2-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_2-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_2-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_2-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_2-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_2-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_2-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_2-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 38
))
    )
    
    (:action place_note-0_2-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 38
))
    )
    
    (:action place_note-1_7-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_7-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_7-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_7-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_7-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_7-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_7-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_7-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_7-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_7-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-2_11-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_11-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_11-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_11-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_11-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_11-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_11-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_11-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_11-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_11-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_16-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 35
))
    )
    
    (:action place_note-3_16-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 35
))
    )
    
    (:action place_note-3_16-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_16-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_16-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_16-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_16-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_16-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_16-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_16-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_0-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-0_0-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-0_0-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-0_0-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 30
))
    )
    
    (:action place_note-0_0-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 30
))
    )
    
    (:action place_note-0_0-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 41
))
    )
    
    (:action place_note-0_0-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 41
))
    )
    
    (:action place_note-1_5-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-1_5-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-1_5-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_5-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_5-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 19
))
    )
    
    (:action place_note-1_5-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 19
))
    )
    
    (:action place_note-1_5-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 30
))
    )
    
    (:action place_note-1_5-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 30
))
    )
    
    (:action place_note-2_9-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_9-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_9-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 3
))
    )
    
    (:action place_note-2_9-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 3
))
    )
    
    (:action place_note-2_9-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_9-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_9-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-2_9-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_14-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_14-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-3_14-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_14-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_14-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_14-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-3_14-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_14-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 10
))
    )
    
    (:action place_note-4_19-0_5-3A4
        :precondition (and (matches 3A4 0_5) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 0_5) (prev-note 3A4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-0_5-7A4
        :precondition (and (matches 7A4 0_5) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 0_5) (prev-note 7A4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_10-3A4
        :precondition (and (matches 3A4 1_10) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 1_10) (prev-note 3A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_19-1_10-7A4
        :precondition (and (matches 7A4 1_10) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 1_10) (prev-note 7A4) (increase (total-cost) 21
))
    )
    
    (:action place_note-4_19-2_14-3A4
        :precondition (and (matches 3A4 2_14) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 2_14) (prev-note 3A4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_19-2_14-7A4
        :precondition (and (matches 7A4 2_14) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 2_14) (prev-note 7A4) (increase (total-cost) 12
))
    )
    
    (:action place_note-4_19-3_19-3A4
        :precondition (and (matches 3A4 3_19) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 3A4) (prev-loc 3_19) (prev-note 3A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-4_19-3_19-7A4
        :precondition (and (matches 7A4 3_19) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 7A4) (prev-loc 3_19) (prev-note 7A4) (increase (total-cost) 1
))
    )
    
    (:action place_note-0_5-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_5-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_5-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-0_5-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-0_5-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_5-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_5-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 25
))
    )
    
    (:action place_note-0_5-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 0_5) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 25
))
    )
    
    (:action place_note-1_10-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 17
))
    )
    
    (:action place_note-1_10-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 17
))
    )
    
    (:action place_note-1_10-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_10-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_10-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 3
))
    )
    
    (:action place_note-1_10-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 3
))
    )
    
    (:action place_note-1_10-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_10-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 1_10) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_14-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-2_14-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-2_14-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-2_14-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-2_14-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_14-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_14-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_14-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 2_14) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-3_19-0_2-5F#4
        :precondition (and (matches 5F#4 0_2) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 0_2) (prev-note 5F#4) (increase (total-cost) 37
))
    )
    
    (:action place_note-3_19-0_2-8F#4
        :precondition (and (matches 8F#4 0_2) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 0_2) (prev-note 8F#4) (increase (total-cost) 37
))
    )
    
    (:action place_note-3_19-1_7-5F#4
        :precondition (and (matches 5F#4 1_7) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 1_7) (prev-note 5F#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-3_19-1_7-8F#4
        :precondition (and (matches 8F#4 1_7) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 1_7) (prev-note 8F#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-3_19-2_11-5F#4
        :precondition (and (matches 5F#4 2_11) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 2_11) (prev-note 5F#4) (increase (total-cost) 17
))
    )
    
    (:action place_note-3_19-2_11-8F#4
        :precondition (and (matches 8F#4 2_11) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 2_11) (prev-note 8F#4) (increase (total-cost) 17
))
    )
    
    (:action place_note-3_19-3_16-5F#4
        :precondition (and (matches 5F#4 3_16) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 5F#4) (prev-loc 3_16) (prev-note 5F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-3_19-3_16-8F#4
        :precondition (and (matches 8F#4 3_16) (prev-loc 3_19) (prev-note 15D4))
        :effect (and (note-placed 8F#4) (prev-loc 3_16) (prev-note 8F#4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_2-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_2-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_2-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_2-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_2-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_2-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_2-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_2-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_2-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 38
))
    )
    
    (:action place_note-0_2-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 0_2) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 38
))
    )
    
    (:action place_note-1_7-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_7-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-1_7-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_7-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_7-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_7-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_7-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_7-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_7-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_7-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 1_7) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 27
))
    )
    
    (:action place_note-2_11-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_11-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_11-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_11-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_11-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_11-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_11-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_11-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_11-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_11-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 2_11) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_16-0_0-6E4
        :precondition (and (matches 6E4 0_0) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 0_0) (prev-note 6E4) (increase (total-cost) 35
))
    )
    
    (:action place_note-3_16-0_0-9E4
        :precondition (and (matches 9E4 0_0) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 0_0) (prev-note 9E4) (increase (total-cost) 35
))
    )
    
    (:action place_note-3_16-1_5-6E4
        :precondition (and (matches 6E4 1_5) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 1_5) (prev-note 6E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_16-1_5-9E4
        :precondition (and (matches 9E4 1_5) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 1_5) (prev-note 9E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_16-2_9-6E4
        :precondition (and (matches 6E4 2_9) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 2_9) (prev-note 6E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_16-2_9-9E4
        :precondition (and (matches 9E4 2_9) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 2_9) (prev-note 9E4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_16-3_14-6E4
        :precondition (and (matches 6E4 3_14) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 3_14) (prev-note 6E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_16-3_14-9E4
        :precondition (and (matches 9E4 3_14) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 3_14) (prev-note 9E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_16-4_19-6E4
        :precondition (and (matches 6E4 4_19) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 6E4) (prev-loc 4_19) (prev-note 6E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_16-4_19-9E4
        :precondition (and (matches 9E4 4_19) (prev-loc 3_16) (prev-note 15D4))
        :effect (and (note-placed 9E4) (prev-loc 4_19) (prev-note 9E4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-0_0-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_0-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_0-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_0-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-0_0-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 38
))
    )
    
    (:action place_note-0_0-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 38
))
    )
    
    (:action place_note-0_0-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 38
))
    )
    
    (:action place_note-0_0-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 0_0) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 38
))
    )
    
    (:action place_note-1_5-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_5-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_5-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_5-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_5-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_5-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_5-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_5-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_5-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_5-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_5-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-1_5-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 1_5) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 27
))
    )
    
    (:action place_note-2_9-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_9-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_9-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_9-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_9-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_9-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_9-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_9-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_9-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_9-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_9-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-2_9-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 2_9) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_14-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_14-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_14-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_14-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_14-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_14-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_14-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_14-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_14-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_14-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_14-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_14-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 3_14) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-4_19-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 35
))
    )
    
    (:action place_note-4_19-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 35
))
    )
    
    (:action place_note-4_19-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 35
))
    )
    
    (:action place_note-4_19-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 35
))
    )
    
    (:action place_note-4_19-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 26
))
    )
    
    (:action place_note-4_19-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 26
))
    )
    
    (:action place_note-4_19-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 26
))
    )
    
    (:action place_note-4_19-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 26
))
    )
    
    (:action place_note-4_19-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-4_19-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-4_19-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-4_19-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 15
))
    )
    
    (:action place_note-4_19-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_19-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_19-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_19-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 4_19) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_3-1_0-11B3
        :precondition (and (matches 11B3 1_0) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 1_0) (prev-note 11B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_3-2_4-11B3
        :precondition (and (matches 11B3 2_4) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 2_4) (prev-note 11B3) (increase (total-cost) 3
))
    )
    
    (:action place_note-1_3-3_9-11B3
        :precondition (and (matches 11B3 3_9) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 3_9) (prev-note 11B3) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_3-4_14-11B3
        :precondition (and (matches 11B3 4_14) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 4_14) (prev-note 11B3) (increase (total-cost) 25
))
    )
    
    (:action place_note-1_3-5_19-11B3
        :precondition (and (matches 11B3 5_19) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 5_19) (prev-note 11B3) (increase (total-cost) 36
))
    )
    
    (:action place_note-2_7-1_0-11B3
        :precondition (and (matches 11B3 1_0) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 1_0) (prev-note 11B3) (increase (total-cost) 15
))
    )
    
    (:action place_note-2_7-2_4-11B3
        :precondition (and (matches 11B3 2_4) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 2_4) (prev-note 11B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_7-3_9-11B3
        :precondition (and (matches 11B3 3_9) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 3_9) (prev-note 11B3) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_7-4_14-11B3
        :precondition (and (matches 11B3 4_14) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 4_14) (prev-note 11B3) (increase (total-cost) 16
))
    )
    
    (:action place_note-2_7-5_19-11B3
        :precondition (and (matches 11B3 5_19) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 5_19) (prev-note 11B3) (increase (total-cost) 27
))
    )
    
    (:action place_note-3_12-1_0-11B3
        :precondition (and (matches 11B3 1_0) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 1_0) (prev-note 11B3) (increase (total-cost) 26
))
    )
    
    (:action place_note-3_12-2_4-11B3
        :precondition (and (matches 11B3 2_4) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 2_4) (prev-note 11B3) (increase (total-cost) 17
))
    )
    
    (:action place_note-3_12-3_9-11B3
        :precondition (and (matches 11B3 3_9) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 3_9) (prev-note 11B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-3_12-4_14-11B3
        :precondition (and (matches 11B3 4_14) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 4_14) (prev-note 11B3) (increase (total-cost) 5
))
    )
    
    (:action place_note-3_12-5_19-11B3
        :precondition (and (matches 11B3 5_19) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 5_19) (prev-note 11B3) (increase (total-cost) 16
))
    )
    
    (:action place_note-4_17-1_0-11B3
        :precondition (and (matches 11B3 1_0) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 1_0) (prev-note 11B3) (increase (total-cost) 37
))
    )
    
    (:action place_note-4_17-2_4-11B3
        :precondition (and (matches 11B3 2_4) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 2_4) (prev-note 11B3) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-3_9-11B3
        :precondition (and (matches 11B3 3_9) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 3_9) (prev-note 11B3) (increase (total-cost) 17
))
    )
    
    (:action place_note-4_17-4_14-11B3
        :precondition (and (matches 11B3 4_14) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 4_14) (prev-note 11B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-4_17-5_19-11B3
        :precondition (and (matches 11B3 5_19) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 11B3) (prev-loc 5_19) (prev-note 11B3) (increase (total-cost) 5
))
    )
    
    (:action place_note-1_0-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_0-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_0-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-1_0-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-1_0-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_0-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_0-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 35
))
    )
    
    (:action place_note-1_0-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 1_0) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 35
))
    )
    
    (:action place_note-2_4-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_4-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 5
))
    )
    
    (:action place_note-2_4-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_4-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_4-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-2_4-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-2_4-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-2_4-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 2_4) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 26
))
    )
    
    (:action place_note-3_9-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_9-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_9-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_9-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-3_9-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_9-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_9-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-3_9-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 3_9) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 15
))
    )
    
    (:action place_note-4_14-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 27
))
    )
    
    (:action place_note-4_14-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 27
))
    )
    
    (:action place_note-4_14-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_14-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_14-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-4_14-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-4_14-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_14-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 4_14) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 4
))
    )
    
    (:action place_note-5_19-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 38
))
    )
    
    (:action place_note-5_19-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 38
))
    )
    
    (:action place_note-5_19-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 29
))
    )
    
    (:action place_note-5_19-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 29
))
    )
    
    (:action place_note-5_19-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-5_19-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-5_19-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-5_19-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 5_19) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-1_2-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-2_6-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_11-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_16-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_3-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_3-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_3-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-1_3-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 7
))
    )
    
    (:action place_note-1_3-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-1_3-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 18
))
    )
    
    (:action place_note-1_3-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 29
))
    )
    
    (:action place_note-1_3-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 1_3) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 29
))
    )
    
    (:action place_note-2_7-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 11
))
    )
    
    (:action place_note-2_7-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 11
))
    )
    
    (:action place_note-2_7-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 9
))
    )
    
    (:action place_note-2_7-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 9
))
    )
    
    (:action place_note-2_7-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 20
))
    )
    
    (:action place_note-2_7-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 2_7) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 20
))
    )
    
    (:action place_note-3_12-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_12-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_12-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_12-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_12-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_12-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 3_12) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_17-1_2-12C#4
        :precondition (and (matches 12C#4 1_2) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 1_2) (prev-note 12C#4) (increase (total-cost) 33
))
    )
    
    (:action place_note-4_17-1_2-14C#4
        :precondition (and (matches 14C#4 1_2) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 1_2) (prev-note 14C#4) (increase (total-cost) 33
))
    )
    
    (:action place_note-4_17-2_6-12C#4
        :precondition (and (matches 12C#4 2_6) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 2_6) (prev-note 12C#4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_17-2_6-14C#4
        :precondition (and (matches 14C#4 2_6) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 2_6) (prev-note 14C#4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_17-3_11-12C#4
        :precondition (and (matches 12C#4 3_11) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 3_11) (prev-note 12C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_17-3_11-14C#4
        :precondition (and (matches 14C#4 3_11) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 3_11) (prev-note 14C#4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_17-4_16-12C#4
        :precondition (and (matches 12C#4 4_16) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 12C#4) (prev-loc 4_16) (prev-note 12C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_17-4_16-14C#4
        :precondition (and (matches 14C#4 4_16) (prev-loc 4_17) (prev-note 15D4))
        :effect (and (note-placed 14C#4) (prev-loc 4_16) (prev-note 14C#4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_2-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 11
))
    )
    
    (:action place_note-1_2-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-1_2-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-1_2-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 1_2) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 33
))
    )
    
    (:action place_note-2_6-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 7
))
    )
    
    (:action place_note-2_6-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_6-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-2_6-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_6-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 2_6) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_11-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_11-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-3_11-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_11-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-3_11-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 3_11) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 13
))
    )
    
    (:action place_note-4_16-1_3-1D4
        :precondition (and (matches 1D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 1_3) (prev-note 1D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-10D4
        :precondition (and (matches 10D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 1_3) (prev-note 10D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-13D4
        :precondition (and (matches 13D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 1_3) (prev-note 13D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-1_3-15D4
        :precondition (and (matches 15D4 1_3) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 1_3) (prev-note 15D4) (increase (total-cost) 29
))
    )
    
    (:action place_note-4_16-2_7-1D4
        :precondition (and (matches 1D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 2_7) (prev-note 1D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-10D4
        :precondition (and (matches 10D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 2_7) (prev-note 10D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-13D4
        :precondition (and (matches 13D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 2_7) (prev-note 13D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-2_7-15D4
        :precondition (and (matches 15D4 2_7) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 2_7) (prev-note 15D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_16-3_12-1D4
        :precondition (and (matches 1D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 3_12) (prev-note 1D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-10D4
        :precondition (and (matches 10D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 3_12) (prev-note 10D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-13D4
        :precondition (and (matches 13D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 3_12) (prev-note 13D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-3_12-15D4
        :precondition (and (matches 15D4 3_12) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 3_12) (prev-note 15D4) (increase (total-cost) 9
))
    )
    
    (:action place_note-4_16-4_17-1D4
        :precondition (and (matches 1D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 1D4) (prev-loc 4_17) (prev-note 1D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-10D4
        :precondition (and (matches 10D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 10D4) (prev-loc 4_17) (prev-note 10D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-13D4
        :precondition (and (matches 13D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 13D4) (prev-loc 4_17) (prev-note 13D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-4_16-4_17-15D4
        :precondition (and (matches 15D4 4_17) (prev-loc 4_16) (prev-note 15D4))
        :effect (and (note-placed 15D4) (prev-loc 4_17) (prev-note 15D4) (increase (total-cost) 2
))
    )
    
)
