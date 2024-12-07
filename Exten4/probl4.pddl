(define (problem visionado_test)
  (:domain visionado_contenidos)

  ;; Objetos
  (:objects
    pelicula1 pelicula2 pelicula3 pelicula4 pelicula5 - contenido
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 - contenido
    extra1 extra2 extra3 - contenido
    ggg lll - contenido
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 - dia
  )

  ;; Estado inicial
  (:init

    (= (minutos pelicula1) 90)
    (= (minutos pelicula2) 90)
    (= (minutos pelicula3) 90)
    (= (minutos pelicula4) 90)
    (= (minutos pelicula5) 90)
    (= (minutos capitulo1) 45)
    (= (minutos capitulo2) 50)
    (= (minutos capitulo3) 40)
    (= (minutos capitulo4) 55)
    (= (minutos capitulo5) 60)
    (= (minutos extra1) 30)
    (= (minutos extra2) 35)
    (= (minutos extra3) 25)
    (= (minutos ggg) 20)
    (= (minutos lll) 15)



    (visto pelicula1)
    (visto capitulo1)
    ;; Relación entre días
    (siguiente_dia dia1 dia2)
    (siguiente_dia dia2 dia3)
    (siguiente_dia dia3 dia4)
    (siguiente_dia dia4 dia5)
    (siguiente_dia dia5 dia6)
    (siguiente_dia dia6 dia7)
    (siguiente_dia dia7 dia8)
    (siguiente_dia dia8 dia9)
    (siguiente_dia dia9 dia10)

    (anterior_dia dia2 dia1)
    (anterior_dia dia3 dia2)
    (anterior_dia dia4 dia3)
    (anterior_dia dia5 dia4)
    (anterior_dia dia6 dia5)
    (anterior_dia dia7 dia6)
    (anterior_dia dia8 dia7)
    (anterior_dia dia9 dia8)
    (anterior_dia dia10 dia9)

    ;; Día actual
    (dia_actual dia1)

    ;; Relaciones entre contenidos
    (predecesor pelicula1 pelicula2)       ; Para ver pelicula2, debe haberse visto pelicula1
    (predecesor pelicula2 pelicula3)       ; pelicula3 depende de pelicula2
    (predecesor capitulo1 capitulo2) 
    (predecesor extra1 extra2)
    (predecesor extra2 extra3)
    (predecesor ggg lll)
    (paralelo pelicula2 capitulo2)

    ;; Inicialización de funciones
    (= (conteo_min_dia dia1) 0)
    (= (conteo_min_dia dia2) 0)
    (= (conteo_min_dia dia3) 0)
    (= (conteo_min_dia dia4) 0)
    (= (conteo_min_dia dia5) 0)
    (= (conteo_min_dia dia6) 0)
    (= (conteo_min_dia dia7) 0)
    (= (conteo_min_dia dia8) 0)
    (= (conteo_min_dia dia9) 0)
    (= (conteo_min_dia dia10) 0)
  )

  ;; Estado objetivo
  (:goal
    (and
      (visto pelicula3) 
      (visto extra3) 
      (visto lll)
    )
  )
)