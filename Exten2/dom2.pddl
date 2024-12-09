(define (domain visionado_basico)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :existential-preconditions :universal-preconditions)
  

  (:types contenido dia)

  (:predicates
    (completado ?contenido - contenido)     ; The content has been watched previous to the plan
    (visto ?contenido - contenido)          ; The content has been watched
    (predecesor ?a ?b - contenido)          ; ?a must be watched before ?b
    (paralelo ?c ?d - contenido)            ; ?c and ?d are parallel and must both be watched
    (asignado ?contenido - contenido ?dia - dia) ; Content is assigned to a day
    (dia_disponible ?dia - dia)             ; The day is available for assignment
    (anterior ?d1 - dia ?d2 - dia)       ; Relación de días consecutivos en sentido inverso
  )

  (:action ver_contenido
    :parameters (?contenido - contenido ?dia - dia)
    :precondition (and
      (dia_disponible ?dia)                 ; The day must be available
      (not (visto ?contenido))              ; The content must not already be watched
      (forall (?pred - contenido) ; Check all predecessors
        (or (not (predecesor ?pred ?contenido))
            (completado ?pred)
            (exists (?prev_dia - dia)
            (and (visto ?pred)(asignado ?pred ?prev_dia)(anterior ?prev_dia ?dia))
            )
        )
      )
      (forall (?par - contenido)
        (imply (paralelo ?contenido ?par)
        (or
            (and (asignado ?par ?dia)) ; Mismo día
            (exists (?rel_dia - dia)
                (or
                    (and (asignado ?par ?rel_dia) (anterior ?rel_dia ?dia))
                    (and (asignado ?par ?rel_dia) (anterior ?dia ?rel_dia)))
            )
        )
    )
)
    )
    :effect (and
      (visto ?contenido)                   ; Mark the content as watched
      (asignado ?contenido ?dia)           ; Assign the content to the day
    )
  )
)
