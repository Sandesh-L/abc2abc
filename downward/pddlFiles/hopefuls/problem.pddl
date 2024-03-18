(define (problem music_piece)
  (:domain guitar_fretboard)
  (:objects
    F4 C4 - note
    loc0_1 loc1_6 loc2_15 loc3_10 loc1_1 loc2_10 loc3_5 loc4_15 - location
  )
  (:init
    (matches loc0_1 F4)
    (matches loc1_6 F4)
    (matches loc2_15 F4)
    (matches loc3_10 F4)

    (matches loc1_1 C4)
    (matches loc2_10 C4)
    (matches loc3_5 C4)
    (matches loc4_15 C4)

  )
  (:goal
    (and
      (note-placed F4) (note-placed C4)
    )
  )
  (:metric minimize (total-cost))
)
