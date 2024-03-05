(define (problem music_piece)
  (:domain guitar_fretboard)
  (:objects
    F4-1 C4-1 - note
    loc4_15 loc1_1 loc0_1 loc2_15 loc2_10 loc3_10 loc1_6 loc3_5 - location
  )
  (:init
    (matches loc0_1 F4-1)
    (matches loc1_6 F4-1)
    (matches loc2_15 F4-1)
    (matches loc3_10 F4-1)
    (matches loc1_1 C4-1)
    (matches loc2_10 C4-1)
    (matches loc3_5 C4-1)
    (matches loc4_15 C4-1)
    (next-note F4-1 C4-1)
    (last-note C4-1)
  )
  (:goal
    (and
      (note-placed F4-1) (note-placed C4-1)
    )
  )
)
