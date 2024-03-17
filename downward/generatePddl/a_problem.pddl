
(define (problem music_piece)
    (:domain guitar_fretboard)
    (:objects
         0G4 1E4 2D4 3G4 4E4 5D4 6B3 7D4 8D4 9G4 10B4 11D5 12B4 13A4 14G4 15A4 - note
         0_3 1_8 0_0 1_5 2_9 1_3 2_7 1_0 2_4 3_9 0_7 0_10 0_5 1_10 - location
    )

    (:init
        ; first note is set
        (note-placed 0G4)
        (prev-loc 0_3)
        (prev-note 0G4)

        ; define note location pairs
        (matches 0G4 0_3) (matches 0G4 1_8)
(matches 1E4 0_0) (matches 1E4 1_5) (matches 1E4 2_9)
(matches 2D4 1_3) (matches 2D4 2_7)
(matches 3G4 0_3) (matches 3G4 1_8)
(matches 4E4 0_0) (matches 4E4 1_5) (matches 4E4 2_9)
(matches 5D4 1_3) (matches 5D4 2_7)
(matches 6B3 1_0) (matches 6B3 2_4) (matches 6B3 3_9)
(matches 7D4 1_3) (matches 7D4 2_7)
(matches 8D4 1_3) (matches 8D4 2_7)
(matches 9G4 0_3) (matches 9G4 1_8)
(matches 10B4 0_7)
(matches 11D5 0_10)
(matches 12B4 0_7)
(matches 13A4 0_5) (matches 13A4 1_10)
(matches 14G4 0_3) (matches 14G4 1_8)
(matches 15A4 0_5) (matches 15A4 1_10)


        ; initialize cost
        (= (total-cost) 0)
    )
    (:goal
        (and
             (note-placed 0G4) (note-placed 1E4) (note-placed 2D4) (note-placed 3G4) (note-placed 4E4) (note-placed 5D4) (note-placed 6B3) (note-placed 7D4) (note-placed 8D4) (note-placed 9G4) (note-placed 10B4) (note-placed 11D5) (note-placed 12B4) (note-placed 13A4) (note-placed 14G4) (note-placed 15A4)    
        )
    )
    (:metric minimize (total-cost))
)

