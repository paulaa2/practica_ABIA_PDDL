(define (domain visionado_basico)
  (:requirements :strips :typing)
  

  (:types contenido dia)

  (:predicates
    (visto ?contenido - contenido)          ; The content has been watched
    (predecesor ?a ?b - contenido)          ; ?a must be watched before ?b
    (paralelo ?c ?d - contenido)            ; ?c and ?d are parallel and must both be watched
    (asignado ?contenido - contenido ?dia - dia) ; Content is assigned to a day
    (dia_disponible ?dia - dia)             ; The day is available for assignment
  )

  (:action ver_contenido
    :parameters (?contenido - contenido ?dia - dia)
    :precondition (and
      (dia_disponible ?dia)                 ; The day must be available
      (not (visto ?contenido))              ; The content must not already be watched
      (forall (?pred - contenido)           ; Check all predecessors
        (or (not (predecesor ?pred ?contenido)) (visto ?pred))
      )
      (forall (?paral - contenido)          ; Check parallel contents of predecessors
        (or (not (exists (?pred - contenido)
                         (and (predecesor ?pred ?contenido) (or (paralelo ?pred ?paral)(paralelo ?paral ?pred)))))
            (visto ?paral))
      )
    )
    :effect (and
      (visto ?contenido)                   ; Mark the content as watched
      (asignado ?contenido ?dia)           ; Assign the content to the day
      (not (dia_disponible ?dia))          ; The day is no longer available
    )
  )
)
