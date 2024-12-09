(define (problem visionado_usuario_complejo)
  (:domain visionado_basico)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 pelicula5 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    extra1 extra2 extra3 extra4 extra5 extra6 extra7 - contenido

    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 - dia
  )

  ;; Estado inicial
  (:init
    ;; Contenidos ya vistos
    (completado pelicula1)
    (completado capitulo1)

    ;; Dependencias entre contenidos
    (predecesor pelicula1 pelicula2)       ; Para ver pelicula2, debe haberse visto pelicula1
    (predecesor pelicula2 pelicula3)       ; pelicula3 depende de pelicula2
    (predecesor pelicula3 pelicula4)       ; pelicula4 depende de pelicula3
    (predecesor pelicula4 pelicula5)
    
    (predecesor extra2 pelicula4)
    (predecesor extra3 pelicula4)
    
    (predecesor extra1 extra2)
    

    (predecesor capitulo1 capitulo2)       ; capitulo2 depende de capitulo1
    (predecesor capitulo2 capitulo3)
    (predecesor capitulo3 capitulo4)       ; capitulo4 depende de capitulo3
    (predecesor capitulo4 capitulo5)       ; capitulo5 depende de capitulo4 

    (predecesor extra4 capitulo4)
    (predecesor extra5 capitulo4)
    (predecesor extra6 capitulo4)
    (predecesor extra7 capitulo4)

  

    ;relacion dias
    (anterior dia1 dia2)
    (anterior dia2 dia3)
    (anterior dia3 dia4)
    (anterior dia4 dia5)
    (anterior dia5 dia6)
    (anterior dia6 dia7)
    (anterior dia7 dia8)
    (anterior dia8 dia9)
    

    ;; Disponibilidad de días
    (dia_disponible dia1)
    (dia_disponible dia2)
    (dia_disponible dia3)
    (dia_disponible dia4)
    (dia_disponible dia5)
    (dia_disponible dia6)
    (dia_disponible dia7)
    (dia_disponible dia8)
    (dia_disponible dia9)
    

    
  )

  ;; Estado objetivo
  (:goal
    (and
      (visto pelicula5) 
      (visto capitulo5)               ; El usuario quiere ver pelicula4
    )
  )
)