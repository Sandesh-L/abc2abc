
(define (problem music_piece)
    (:domain guitar_fretboard)
    (:objects
         1G4 2A4 3B4 4C5 5D5 6E5 7D5 8B4 9D5 10E5 11D5 12B4 13D5 14E5 15D5 16B4 17C5 18E5 19C5 20B4 21D5 22B4 23C5 24A4 25A4 - note
         0_3 1_8 2_17 3_12 0_5 1_10 3_14 0_7 1_12 3_16 0_8 1_13 3_17 0_10 1_15 0_12 1_17 - location
    )

    (:init
        ; first note is set
        (note-placed 1G4)
        (prev-loc 0_3)
        
        ; define note location pairs
        (matches 1G4 0_3) (matches 1G4 1_8) (matches 1G4 2_17) (matches 1G4 3_12)
(matches 2A4 0_5) (matches 2A4 1_10) (matches 2A4 3_14)
(matches 3B4 0_7) (matches 3B4 1_12) (matches 3B4 3_16)
(matches 4C5 0_8) (matches 4C5 1_13) (matches 4C5 3_17)
(matches 5D5 0_10) (matches 5D5 1_15)
(matches 6E5 0_12) (matches 6E5 1_17)
(matches 7D5 0_10) (matches 7D5 1_15)
(matches 8B4 0_7) (matches 8B4 1_12) (matches 8B4 3_16)
(matches 9D5 0_10) (matches 9D5 1_15)
(matches 10E5 0_12) (matches 10E5 1_17)
(matches 11D5 0_10) (matches 11D5 1_15)
(matches 12B4 0_7) (matches 12B4 1_12) (matches 12B4 3_16)
(matches 13D5 0_10) (matches 13D5 1_15)
(matches 14E5 0_12) (matches 14E5 1_17)
(matches 15D5 0_10) (matches 15D5 1_15)
(matches 16B4 0_7) (matches 16B4 1_12) (matches 16B4 3_16)
(matches 17C5 0_8) (matches 17C5 1_13) (matches 17C5 3_17)
(matches 18E5 0_12) (matches 18E5 1_17)
(matches 19C5 0_8) (matches 19C5 1_13) (matches 19C5 3_17)
(matches 20B4 0_7) (matches 20B4 1_12) (matches 20B4 3_16)
(matches 21D5 0_10) (matches 21D5 1_15)
(matches 22B4 0_7) (matches 22B4 1_12) (matches 22B4 3_16)
(matches 23C5 0_8) (matches 23C5 1_13) (matches 23C5 3_17)
(matches 24A4 0_5) (matches 24A4 1_10) (matches 24A4 3_14)
(matches 25A4 0_5) (matches 25A4 1_10) (matches 25A4 3_14)


        ; initialize cost
        (= (total-cost) 0)
    )
    (:goal
        (and
             (note-placed 1G4) (note-placed 2A4) (note-placed 3B4) (note-placed 4C5) (note-placed 5D5) (note-placed 6E5) (note-placed 7D5) (note-placed 8B4) (note-placed 9D5) (note-placed 10E5) (note-placed 11D5) (note-placed 12B4) (note-placed 13D5) (note-placed 14E5) (note-placed 15D5) (note-placed 16B4) (note-placed 17C5) (note-placed 18E5) (note-placed 19C5) (note-placed 20B4) (note-placed 21D5) (note-placed 22B4) (note-placed 23C5) (note-placed 24A4) (note-placed 25A4)    
        )
    )
    (:metric minimize (total-cost))
)

