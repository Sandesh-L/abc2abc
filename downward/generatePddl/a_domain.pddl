(define (domain move_object)
    (:requirements :strips :typing :action-costs)
    (:types location object hand)
    (:predicates

        (placed ?o - object)
        (obj_at ?o - object ?l - location)
        (hand_at ?h - hand ?l - location)
        (grab ?h - hand ?o - object)
        (move_hand ?h - hand ?l - location)
        (drop ?h - hand)


    )
    
    (:action place_object
        :precondition (and (obj_at obj podium) (not(placed obj)) (hand_at right_hand podium))
        :effect (and (grab right_hand obj) (move_hand right_hand speaker) (drop right_hand)
                (placed obj))
    )
)

