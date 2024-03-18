(define (problem music_piece)
  (:domain guitar_fretboard)
  (:objects
    A4 A5 B4 C5 D5 E4 E5 F4 F5 G4 G5 - note
    loc0_0 loc0_1 loc0_10 loc0_12 loc0_13 loc0_15 loc0_17 loc0_3 loc0_5 loc0_7 loc0_8 loc1_10 loc1_12 loc1_13 loc1_15 loc1_17 loc1_18 loc1_5 loc1_6 loc1_8 loc2_14 loc2_15 loc2_17 loc3_10 loc3_12 loc3_14 loc3_16 loc3_17 loc3_9 - location
  )
  (:init
    (matches loc0_0 E4)
    (matches loc0_1 F4)
    (matches loc0_10 D5)
    (matches loc0_12 E5)
    (matches loc0_13 F5)
    (matches loc0_15 G5)
    (matches loc0_17 A5)
    (matches loc0_3 G4)
    (matches loc0_5 A4)
    (matches loc0_7 B4)
    (matches loc0_8 C5)
    (matches loc1_10 A4)
    (matches loc1_12 B4)
    (matches loc1_13 C5)
    (matches loc1_15 D5)
    (matches loc1_17 E5)
    (matches loc1_18 F5)
    (matches loc1_5 E4)
    (matches loc1_6 F4)
    (matches loc1_8 G4)
    (matches loc2_14 E4)
    (matches loc2_15 F4)
    (matches loc2_17 G4)
    (matches loc3_10 F4)
    (matches loc3_12 G4)
    (matches loc3_14 A4)
    (matches loc3_16 B4)
    (matches loc3_17 C5)
    (matches loc3_9 E4)
  )
  (:goal
    (and
      (note-placed A5) (note-placed A4) (note-placed F5) (note-placed G5) (note-placed E4) (note-placed F4) (note-placed B4) (note-placed G4) (note-placed D5) (note-placed E5) (note-placed C5)
    )
  )
)
