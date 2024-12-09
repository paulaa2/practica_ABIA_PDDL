(define (domain visionado_contenidos)
    (:requirements :typing :negative-preconditions :disjunctive-preconditions :existential-preconditions :universal-preconditions :fluents)

    ;; Tipos
    (:types
        contenido dia - object
    )

    ;; Predicados
    (:predicates
        (visto ?c - contenido)                  ; El contenido ya ha sido visto
        (predecesor ?c1 - contenido ?c2 - contenido) ; ?c1 debe verse antes que ?c2
        (paralelo ?c1 - contenido ?c2 - contenido)   ; ?c1 y ?c2 son paralelos
        (asignado ?c - contenido ?d - dia)     ; El contenido está asignado a un día
        (dia_actual ?d - dia)                  ; Día en el que estamos actualmente
        (siguiente_dia ?d1 - dia ?d2 - dia)    ; Relación de días consecutivos
        (anterior_dia ?d1 - dia ?d2 - dia)     ; Relación de días consecutivos en sentido inverso
    )

    ;; Funciones
    (:functions
        (conteo_min_dia ?d - dia)                  ; Número de contenidos asignados al día
        (minutos ?c - contenido)                   ; Duración del contenido
    )

    ;; Acciones
(:action asignar_contenido
    :parameters (?c - contenido ?actuald - dia)
    :precondition (and
        (dia_actual ?actuald)             ; Solo asignar al día actual
        (not (visto ?c))                  ; El contenido no debe haberse visto
        ;; Los predecesores deben haberse visto antes del día actual
        (forall (?pre - contenido)
            (imply (predecesor ?pre ?c)
                (and (visto ?pre) (not (asignado ?pre ?actuald)))
            )
        )
        ;; Los paralelos deben asignarse el mismo día o en días consecutivos
        (forall (?par - contenido)
        (imply (paralelo ?c ?par)
        (or
            (and (asignado ?par ?actuald)) ; Mismo día
            (exists (?rel_dia - dia)
                (or
                    (and (asignado ?par ?rel_dia) (anterior_dia ?rel_dia ?actuald))
                    (and (asignado ?par ?rel_dia) (anterior_dia ?actuald ?rel_dia)))
            )
        )
    )
)

        (< (conteo_min_dia ?actuald) 200)
        (< (+ (conteo_min_dia ?actuald) (minutos ?c)) 200)
    )
    :effect (and
        (visto ?c)                         
        (asignado ?c ?actuald)             
        (increase (conteo_min_dia ?actuald) (minutos ?c)) 
    )
)

    (:action avanzar_dia
        :parameters (?nextd - dia ?actuald - dia ?prevd - dia)
        :precondition (and
            (dia_actual ?actuald)        
            (anterior_dia ?prevd ?actuald) 
            (siguiente_dia ?actuald ?nextd)   
        )
        :effect (and
            (not (dia_actual ?actuald))      
            (not (dia_actual ?prevd))         
            (dia_actual ?nextd)                
        )
    )
)
