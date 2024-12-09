(define (problem visionado_test)
  (:domain visionado_contenidos)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 pelicula5 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    extra1 extra2 extra3 extra4 extra5 extra6 extra7 - contenido
    ggg lll - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )

  ;; Estado inicial
  (:init
    (visto pelicula1)
    (visto capitulo1)

    (predecesor pelicula1 pelicula2)       ; Para ver pelicula2, debe haberse visto pelicula1
    (predecesor pelicula2 pelicula3)       ; pelicula3 depende de pelicula2
    (predecesor pelicula3 pelicula4)       ; pelicula4 depende de pelicula3
    (predecesor pelicula4 pelicula5)
    (paralelo pelicula4 extra1 )
    (paralelo pelicula4 extra2 )
    (paralelo pelicula4 extra3)
    (paralelo extra3 extra4)
    
    (paralelo pelicula2 capitulo2)

    (predecesor capitulo1 capitulo2)
    (predecesor capitulo2 capitulo3)
    (predecesor capitulo3 capitulo4)       ; capitulo4 depende de capitulo3
    (predecesor capitulo4 capitulo5)       ; capitulo5 depende de capitulo4 

    (paralelo capitulo4 extra4 )
    (paralelo capitulo4 extra5 )
    (paralelo capitulo4 extra6 )
    (paralelo capitulo4 extra7 )

    ;; Relación entre días
    (siguiente_dia dia1 dia2)
    (siguiente_dia dia2 dia3)
    (siguiente_dia dia3 dia4)
    (siguiente_dia dia4 dia5)
    (siguiente_dia dia5 dia6)

    (anterior_dia dia2 dia1)
    (anterior_dia dia3 dia2)
    (anterior_dia dia4 dia3)
    (anterior_dia dia5 dia4)
    (anterior_dia dia6 dia5)

    ;; Día actual
    (dia_actual dia1)

   

    ;; Inicialización de funciones
    (= (conteo_dia dia1) 0)
    (= (conteo_dia dia2) 0)
    (= (conteo_dia dia3) 0)
    (= (conteo_dia dia4) 0)
    (= (conteo_dia dia5) 0)
    (= (conteo_dia dia6) 0)
  )

  ;; Estado objetivo
  (:goal
    (and
      (visto pelicula5) 
      (visto capitulo5) 
    )
  )
)
