(define (domain visionado_basico)
  (:requirements :strips :typing :fluents)

  ;; Tipos
  (:types contenido dia)

  ;; Predicados y funciones
  (:predicates
    (completado ?contenido - contenido)     ; El contenido se completó antes del plan
    (visto ?contenido - contenido)          ; El contenido ya ha sido visto
    (predecesor ?a ?b - contenido)          ; ?a debe verse antes que ?b
    (paralelo ?a ?b - contenido)            ; ?a y ?b son paralelos
    (asignado ?contenido - contenido ?dia - dia) ; El contenido está asignado a un día
    (dia_disponible ?dia - dia)             ; El día está disponible para asignar contenido
    (anterior ?dia1 ?dia2 - dia)            ; ?dia1 es anterior a ?dia2
  )

  ;; Funciones
  (:functions
    (conteo ?dia - dia)                     ; Número de contenidos asignados a un día
  )

  ;; Acción: ver contenido
  (:action ver_contenido
    :parameters (?contenido - contenido ?dia - dia)
    :precondition (and
      (dia_disponible ?dia)                     ; El día debe estar disponible
      (not (visto ?contenido))                  ; El contenido no debe haber sido visto
      (forall (?pred - contenido)               ; Verificar predecesores
        (or (not (predecesor ?pred ?contenido))
            (completado ?pred)
            (exists (?prev_dia - dia)
              (and (visto ?pred)
                   (asignado ?pred ?prev_dia)
                   (anterior ?prev_dia ?dia))
            )
        )
      )
      (forall (?par - contenido)                ; Verificar paralelos
        (or (not (paralelo ?contenido ?par))
            (and (visto ?par)
                 (or (= ?dia ?dia)              ; Mismo día
                     (exists (?rel_dia - dia)
                       (or (anterior ?rel_dia ?dia)
                           (anterior ?dia ?rel_dia))
                     )
                 )
            )
        )
      )
      (< (conteo ?dia) 3)                       ; Límite de contenidos por día
    )
    :effect (and
      (visto ?contenido)                        ; Marcar el contenido como visto
      (asignado ?contenido ?dia)                ; Asignar el contenido al día
      (increase (conteo ?dia) 1)                ; Incrementar el contador del día
    )
  )
)
