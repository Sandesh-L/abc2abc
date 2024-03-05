
(define (domain guitar_fretboard)
  (:requirements :strips :typing :action-costs)
  (:types location note)
  (:predicates
    (matches ?l - location ?n - note)
    (note-placed ?n - note)
    (last-note ?n - note)
    (next-note ?current - note ?next - note) ;Indicates sequence of notes
  )

    (:action place-note
    :parameters (?n - note ?l - location ?prev - note)
    :precondition (and (matches ?l ?n) (last-note ?prev) (next-note ?prev ?n))
    :effect (and 
        (note-placed ?n)
        (not (last-note ?prev))
        (last-note ?n)
        )
    )

    (:action move_0_1_to_2_1
        :parameters (?n - note ?start - location ?end - location ?prev - note)
        :precondition (and (matches ?start ?n) (= ?start 0_1) (= ?end 2_1))
        :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 1))
    )

    ; (:action move_0_1_to_3_10
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 0_1) (= ?end 3_10))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 11))
    ; )

    ; (:action move_0_1_to_4_5
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 0_1) (= ?end 4_5))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 7))
    ; )

    ; (:action move_0_1_to_5_15
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 0_1) (= ?end 5_15))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 18))
    ; )

    (:action move_1_6_to_2_1
        :parameters (?n - note ?start - location ?end - location ?prev - note)
        :precondition (and (matches ?start ?n) (= ?start 1_6) (= ?end 2_1))
        :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 5))
    )

    ; (:action move_1_6_to_3_10
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 1_6) (= ?end 3_10))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 5))
    ; )

    ; (:action move_1_6_to_4_5
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 1_6) (= ?end 4_5))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 3))
    ; )

    ; (:action move_1_6_to_5_15
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 1_6) (= ?end 5_15))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 12))
    ; )

    (:action move_2_15_to_2_1
        :parameters (?n - note ?start - location ?end - location ?prev - note)
        :precondition (and (matches ?start ?n) (= ?start 2_15) (= ?end 2_1))
        :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 15))
    )

    ; (:action move_2_15_to_3_10
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 2_15) (= ?end 3_10))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 5))
    ; )

    ; (:action move_2_15_to_4_5
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 2_15) (= ?end 4_5))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 11))
    ; )

    ; (:action move_2_15_to_5_15
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 2_15) (= ?end 5_15))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 2))
    ; )

    (:action move_3_10_to_2_1
        :parameters (?n - note ?start - location ?end - location ?prev - note)
        :precondition (and (matches ?start ?n) (= ?start 3_10) (= ?end 2_1))
        :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 11))
    )

    ; (:action move_3_10_to_3_10
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 3_10) (= ?end 3_10))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 1))
    ; )

    ; (:action move_3_10_to_4_5
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 3_10) (= ?end 4_5))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 5))
    ; )

    ; (:action move_3_10_to_5_15
    ;     :parameters (?n - note ?start - location ?end - location ?prev - note)
    ;     :precondition (and (matches ?start ?n) (= ?start 3_10) (= ?end 5_15))
    ;     :effect (and (not (matches ?start ?n)) (matches ?end ?n) (increase (total-cost) 6))
    ; )

)
