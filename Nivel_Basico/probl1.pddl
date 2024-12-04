(define (problem visionado_usuario_complejo)
  (:domain visionado_basico)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 - dia
  )

  ;; Estado inicial
  (:init
    ;; Contenidos ya vistos
    (visto pelicula1)


    (predecesor pelicula1 pelicula2)       
    (predecesor pelicula2 pelicula3)                
    (predecesor pelicula3 pelicula4)    
    (predecesor capitulo1 capitulo2)   


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
      (visto pelicula4) 
      (visto capitulo2)                   
    )
  )
)
