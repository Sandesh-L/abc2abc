
(define (problem music_piece)
    (:domain guitar_fretboard)
    (:objects
         0G4 1A4 2B4 3C5 4D5 5E5 6D5 7B4 8D5 9E5 10D5 11B4 12D5 13E5 14D5 15B4 16C5 17E5 18C5 19B4 20D5 21B4 22C5 23A4 24A4 - note
         0_3 1_8 2_17 3_12 0_5 1_10 3_14 0_7 1_12 3_16 0_8 1_13 3_17 0_10 1_15 0_12 1_17 - location
    )

    (:init
        ; first note is set
        (note-placed 0G4)
        (prev-loc 0_3)
        
        ; define note location pairs
        (matches 0G4 0_3) (matches 0G4 1_8) (matches 0G4 2_17) (matches 0G4 3_12)
(matches 1A4 0_5) (matches 1A4 1_10) (matches 1A4 3_14)
(matches 2B4 0_7) (matches 2B4 1_12) (matches 2B4 3_16)
(matches 3C5 0_8) (matches 3C5 1_13) (matches 3C5 3_17)
(matches 4D5 0_10) (matches 4D5 1_15)
(matches 5E5 0_12) (matches 5E5 1_17)
(matches 6D5 0_10) (matches 6D5 1_15)
(matches 7B4 0_7) (matches 7B4 1_12) (matches 7B4 3_16)
(matches 8D5 0_10) (matches 8D5 1_15)
(matches 9E5 0_12) (matches 9E5 1_17)
(matches 10D5 0_10) (matches 10D5 1_15)
(matches 11B4 0_7) (matches 11B4 1_12) (matches 11B4 3_16)
(matches 12D5 0_10) (matches 12D5 1_15)
(matches 13E5 0_12) (matches 13E5 1_17)
(matches 14D5 0_10) (matches 14D5 1_15)
(matches 15B4 0_7) (matches 15B4 1_12) (matches 15B4 3_16)
(matches 16C5 0_8) (matches 16C5 1_13) (matches 16C5 3_17)
(matches 17E5 0_12) (matches 17E5 1_17)
(matches 18C5 0_8) (matches 18C5 1_13) (matches 18C5 3_17)
(matches 19B4 0_7) (matches 19B4 1_12) (matches 19B4 3_16)
(matches 20D5 0_10) (matches 20D5 1_15)
(matches 21B4 0_7) (matches 21B4 1_12) (matches 21B4 3_16)
(matches 22C5 0_8) (matches 22C5 1_13) (matches 22C5 3_17)
(matches 23A4 0_5) (matches 23A4 1_10) (matches 23A4 3_14)
(matches 24A4 0_5) (matches 24A4 1_10) (matches 24A4 3_14)


        ; initialize cost
        (= (total-cost) 0)
    )
    (:goal
        (and
             (note-placed 0G4) (note-placed 1A4) (note-placed 2B4) (note-placed 3C5) (note-placed 4D5) (note-placed 5E5) (note-placed 6D5) (note-placed 7B4) (note-placed 8D5) (note-placed 9E5) (note-placed 10D5) (note-placed 11B4) (note-placed 12D5) (note-placed 13E5) (note-placed 14D5) (note-placed 15B4) (note-placed 16C5) (note-placed 17E5) (note-placed 18C5) (note-placed 19B4) (note-placed 20D5) (note-placed 21B4) (note-placed 22C5) (note-placed 23A4) (note-placed 24A4)    
        )
    )
    (:metric minimize (total-cost))
)

