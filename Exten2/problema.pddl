(define (problem visionado_usuario_complejo)
  (:domain visionado_basico)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    extra1 extra2 extra3 extra3_5 - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 - dia
  )

  ;; Estado inicial
  (:init
    ;; Contenidos ya vistos
    (visto pelicula1)
    (visto capitulo1)

    ;; Dependencias entre contenidos
    (predecesor pelicula1 pelicula2)       ; Para ver pelicula2, debe haberse visto pelicula1
    (predecesor pelicula2 pelicula3)       ; pelicula3 depende de pelicula2
    (predecesor capitulo1 capitulo2)       ; capitulo2 depende de capitulo1
    (predecesor capitulo3 pelicula4)       ;pelicula4 dpende de capitulo 3
    (predecesor capitulo2 capitulo3)      ; capitulo3 depende de capitulo2
    (predecesor pelicula3 pelicula4)       ; pelicula4 depende de pelicula3
    (predecesor capitulo3 capitulo4)       ; capitulo4 depende de capitulo3
    (predecesor capitulo4 capitulo5)       ; capitulo5 depende de capitulo4
    (paralelo extra3_5 capitulo4)
    (paralelo capitulo3 extra3)
    (paralelo capitulo2 extra2)
    (paralelo capitulo1 extra1)
    

    ;; Disponibilidad de días
    (dia_disponible dia1)
    (dia_disponible dia2)
    (dia_disponible dia3)
    (dia_disponible dia4)
    (dia_disponible dia5)
    (dia_disponible dia6)
    (dia_disponible dia7)
    (dia_disponible dia8)
  )

  ;; Estado objetivo
  (:goal
    (and
      (visto pelicula4)                  ; El usuario quiere ver pelicula4
    )
  )
)
