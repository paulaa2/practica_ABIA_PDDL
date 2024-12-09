(define (problem visionado_test)
  (:domain visionado_contenidos)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 pelicula5 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    extra1 extra2 extra3 - contenido
    ggg lll - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )

  ;; Estado inicial
  (:init
    (visto pelicula1)
    (visto capitulo1)

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

    ;; Relaciones entre contenidos
    

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
      (visto pelicula2) 
      (visto pelicula3)
      (visto pelicula4)
      (visto pelicula5)
      (visto capitulo2)
      (visto capitulo3)
      (visto capitulo4)
      (visto capitulo5)
      (visto extra3)
      
           
    )
  )
)
