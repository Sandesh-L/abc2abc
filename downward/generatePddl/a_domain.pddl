
    
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

    
    (:action place_note-0_3-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 0_3))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4)(increase (total-cost) 6
))
    )
    
    (:action place_note-0_3-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 0_3))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4)(increase (total-cost) 6
))
    )
    
    (:action place_note-0_3-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 12
))
    )
    
    (:action place_note-0_3-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 12
))
    )
    
    (:action place_note-1_8-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_8-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_8-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_8-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_12-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_12-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_12-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_12-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-3_17-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 34
))
    )
    
    (:action place_note-3_17-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 34
))
    )
    
    (:action place_note-3_17-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_17-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_5-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-4_19-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_3-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_3-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_3-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_7-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-3_12-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-3_12-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-4_17-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_17-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_17-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-0_3-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_3-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_3-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 12
))
    )
    
    (:action place_note-0_3-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 12
))
    )
    
    (:action place_note-1_8-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_8-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_8-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_8-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_12-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_12-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_12-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_12-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 6
))
    )
    
    (:action place_note-3_17-0_0-1E4
        :precondition (and (matches 1E4 0_0) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 0_0) (prev-note 1E4) (increase (total-cost) 34
))
    )
    
    (:action place_note-3_17-0_0-4E4
        :precondition (and (matches 4E4 0_0) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 0_0) (prev-note 4E4) (increase (total-cost) 34
))
    )
    
    (:action place_note-3_17-1_5-1E4
        :precondition (and (matches 1E4 1_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 1_5) (prev-note 1E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-1_5-4E4
        :precondition (and (matches 4E4 1_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 1_5) (prev-note 4E4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-2_9-1E4
        :precondition (and (matches 1E4 2_9) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 1E4) (prev-loc 2_9) (prev-note 1E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_17-2_9-4E4
        :precondition (and (matches 4E4 2_9) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 4E4) (prev-loc 2_9) (prev-note 4E4) (increase (total-cost) 16
))
    )
    
    (:action place_note-0_0-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_0-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_0-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 0_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_5-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_5-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 1_5) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_9-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_9-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 2_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_14-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_14-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_14-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 3_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-4_19-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-4_19-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-4_19-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 4_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_3-1_0-6B3
        :precondition (and (matches 6B3 1_0) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 1_0) (prev-note 6B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_3-2_4-6B3
        :precondition (and (matches 6B3 2_4) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 2_4) (prev-note 6B3) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_3-3_9-6B3
        :precondition (and (matches 6B3 3_9) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 3_9) (prev-note 6B3) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_7-1_0-6B3
        :precondition (and (matches 6B3 1_0) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 1_0) (prev-note 6B3) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_7-2_4-6B3
        :precondition (and (matches 6B3 2_4) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 2_4) (prev-note 6B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_7-3_9-6B3
        :precondition (and (matches 6B3 3_9) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 3_9) (prev-note 6B3) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_12-1_0-6B3
        :precondition (and (matches 6B3 1_0) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 1_0) (prev-note 6B3) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_12-2_4-6B3
        :precondition (and (matches 6B3 2_4) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 2_4) (prev-note 6B3) (increase (total-cost) 16
))
    )
    
    (:action place_note-3_12-3_9-6B3
        :precondition (and (matches 6B3 3_9) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 3_9) (prev-note 6B3) (increase (total-cost) 6
))
    )
    
    (:action place_note-4_17-1_0-6B3
        :precondition (and (matches 6B3 1_0) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 1_0) (prev-note 6B3) (increase (total-cost) 34
))
    )
    
    (:action place_note-4_17-2_4-6B3
        :precondition (and (matches 6B3 2_4) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 2_4) (prev-note 6B3) (increase (total-cost) 26
))
    )
    
    (:action place_note-4_17-3_9-6B3
        :precondition (and (matches 6B3 3_9) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 6B3) (prev-loc 3_9) (prev-note 6B3) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_0-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_0-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_0-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_0-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_0-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_0-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_0-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_0-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 1_0) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_4-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_4-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_4-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_4-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_4-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_4-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_4-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-2_4-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 2_4) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 6
))
    )
    
    (:action place_note-3_9-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-3_9-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-3_9-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-3_9-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 12
))
    )
    
    (:action place_note-3_9-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_9-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_9-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_9-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 3_9) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 4
))
    )
    
    (:action place_note-4_14-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-4_14-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-4_14-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-4_14-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 22
))
    )
    
    (:action place_note-4_14-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-4_14-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-4_14-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-4_14-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 4_14) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 14
))
    )
    
    (:action place_note-5_19-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_19-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_19-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_19-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 32
))
    )
    
    (:action place_note-5_19-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-5_19-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-5_19-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-5_19-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 5_19) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 24
))
    )
    
    (:action place_note-1_3-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-1_3-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-1_3-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-1_3-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-2_7-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-2_7-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-2_7-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 0
))
    )
    
    (:action place_note-3_12-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_12-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_12-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_12-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 10
))
    )
    
    (:action place_note-4_17-1_3-2D4
        :precondition (and (matches 2D4 1_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 1_3) (prev-note 2D4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-1_3-5D4
        :precondition (and (matches 5D4 1_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 1_3) (prev-note 5D4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-1_3-7D4
        :precondition (and (matches 7D4 1_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 1_3) (prev-note 7D4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-1_3-8D4
        :precondition (and (matches 8D4 1_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 1_3) (prev-note 8D4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-2_7-2D4
        :precondition (and (matches 2D4 2_7) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 2D4) (prev-loc 2_7) (prev-note 2D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_17-2_7-5D4
        :precondition (and (matches 5D4 2_7) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 5D4) (prev-loc 2_7) (prev-note 5D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_17-2_7-7D4
        :precondition (and (matches 7D4 2_7) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 7D4) (prev-loc 2_7) (prev-note 7D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-4_17-2_7-8D4
        :precondition (and (matches 8D4 2_7) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 8D4) (prev-loc 2_7) (prev-note 8D4) (increase (total-cost) 20
))
    )
    
    (:action place_note-1_3-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 0
))
    )
    
    (:action place_note-1_3-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_3-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-1_3-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 1_3) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_7-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-2_7-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_7-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 2_7) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 2
))
    )
    
    (:action place_note-3_12-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-3_12-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-3_12-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-3_12-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 3_12) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 8
))
    )
    
    (:action place_note-4_17-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 28
))
    )
    
    (:action place_note-4_17-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_17-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-4_17-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 4_17) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 18
))
    )
    
    (:action place_note-0_3-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 8
))
    )
    
    (:action place_note-0_3-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 8
))
    )
    
    (:action place_note-1_8-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-1_8-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 2
))
    )
    
    (:action place_note-2_12-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 10
))
    )
    
    (:action place_note-2_12-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 10
))
    )
    
    (:action place_note-3_17-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 20
))
    )
    
    (:action place_note-3_17-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 20
))
    )
    
    (:action place_note-0_7-0_10-11D5
        :precondition (and (matches 11D5 0_10) (prev-loc 0_7) (prev-note 4E4))
        :effect (and (note-placed 11D5) (prev-loc 0_10) (prev-note 11D5) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_12-0_10-11D5
        :precondition (and (matches 11D5 0_10) (prev-loc 1_12) (prev-note 4E4))
        :effect (and (note-placed 11D5) (prev-loc 0_10) (prev-note 11D5) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_16-0_10-11D5
        :precondition (and (matches 11D5 0_10) (prev-loc 2_16) (prev-note 4E4))
        :effect (and (note-placed 11D5) (prev-loc 0_10) (prev-note 11D5) (increase (total-cost) 12
))
    )
    
    (:action place_note-0_10-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 0_10) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_10-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 0_10) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_15-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 1_15) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-1_15-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 1_15) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 16
))
    )
    
    (:action place_note-2_19-0_7-10B4
        :precondition (and (matches 10B4 0_7) (prev-loc 2_19) (prev-note 4E4))
        :effect (and (note-placed 10B4) (prev-loc 0_7) (prev-note 10B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-2_19-0_7-12B4
        :precondition (and (matches 12B4 0_7) (prev-loc 2_19) (prev-note 4E4))
        :effect (and (note-placed 12B4) (prev-loc 0_7) (prev-note 12B4) (increase (total-cost) 24
))
    )
    
    (:action place_note-0_7-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 0_7) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_7-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 0_7) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_7-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 0_7) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_7-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 0_7) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_12-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 1_12) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_12-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 1_12) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_12-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 1_12) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_12-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 1_12) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_16-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 2_16) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 22
))
    )
    
    (:action place_note-2_16-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 2_16) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 22
))
    )
    
    (:action place_note-2_16-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 2_16) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_16-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 2_16) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 12
))
    )
    
    (:action place_note-0_5-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_5-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_5-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_5-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_5-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 6
))
    )
    
    (:action place_note-0_5-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 0_5) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_10-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_10-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_10-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_10-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_10-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_10-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 1_10) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_14-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-2_14-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-2_14-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-2_14-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_14-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 12
))
    )
    
    (:action place_note-2_14-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 2_14) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 12
))
    )
    
    (:action place_note-3_19-0_3-3G4
        :precondition (and (matches 3G4 0_3) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 0_3) (prev-note 3G4) (increase (total-cost) 32
))
    )
    
    (:action place_note-3_19-0_3-9G4
        :precondition (and (matches 9G4 0_3) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 0_3) (prev-note 9G4) (increase (total-cost) 32
))
    )
    
    (:action place_note-3_19-0_3-14G4
        :precondition (and (matches 14G4 0_3) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 0_3) (prev-note 14G4) (increase (total-cost) 32
))
    )
    
    (:action place_note-3_19-1_8-3G4
        :precondition (and (matches 3G4 1_8) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 3G4) (prev-loc 1_8) (prev-note 3G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_19-1_8-9G4
        :precondition (and (matches 9G4 1_8) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 9G4) (prev-loc 1_8) (prev-note 9G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-3_19-1_8-14G4
        :precondition (and (matches 14G4 1_8) (prev-loc 3_19) (prev-note 4E4))
        :effect (and (note-placed 14G4) (prev-loc 1_8) (prev-note 14G4) (increase (total-cost) 22
))
    )
    
    (:action place_note-0_3-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-0_3-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-0_3-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 0_3) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-1_8-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 6
))
    )
    
    (:action place_note-1_8-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-1_8-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 1_8) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_12-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-2_12-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-2_12-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 2_12) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 4
))
    )
    
    (:action place_note-3_17-0_5-13A4
        :precondition (and (matches 13A4 0_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 0_5) (prev-note 13A4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-0_5-15A4
        :precondition (and (matches 15A4 0_5) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 0_5) (prev-note 15A4) (increase (total-cost) 24
))
    )
    
    (:action place_note-3_17-1_10-13A4
        :precondition (and (matches 13A4 1_10) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 13A4) (prev-loc 1_10) (prev-note 13A4) (increase (total-cost) 14
))
    )
    
    (:action place_note-3_17-1_10-15A4
        :precondition (and (matches 15A4 1_10) (prev-loc 3_17) (prev-note 4E4))
        :effect (and (note-placed 15A4) (prev-loc 1_10) (prev-note 15A4) (increase (total-cost) 14
))
    )
    
)
