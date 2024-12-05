(define (problem visionado_test_extenso)
  (:domain visionado_basico)

  ;; Objetos
  (:objects
    ;; 20 contenidos
    pelicula1 pelicula2 pelicula3 pelicula4 pelicula5 
    pelicula6 pelicula7 pelicula8 pelicula9 pelicula10 
    capitulo1 capitulo2 capitulo3 capitulo4 capitulo5 
    capitulo6 capitulo7 capitulo8 capitulo9 capitulo10 - contenido

    ;; 10 días
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 - dia
  )

  ;; Estado inicial
  (:init
    ;; Contenidos ya vistos
    (completado pelicula1)

    ;; Dependencias entre contenidos
    (predecesor pelicula1 pelicula2)       ; Para ver pelicula2, debe haberse visto pelicula1
    (predecesor pelicula2 pelicula3)
    (predecesor pelicula3 pelicula4)
    (predecesor pelicula4 pelicula5)
    (predecesor capitulo1 capitulo2)
    (predecesor capitulo2 capitulo3)
    (predecesor capitulo3 capitulo4)
    (predecesor capitulo4 capitulo5)

    ;; Relaciones paralelas
    (paralelo pelicula6 pelicula7)         ; Paralelos
    (paralelo pelicula8 pelicula9)
    (paralelo capitulo6 capitulo7)
    (paralelo capitulo8 capitulo9)

    ;; Relaciones entre días
    (anterior dia1 dia2)
    (anterior dia2 dia3)
    (anterior dia3 dia4)
    (anterior dia4 dia5)
    (anterior dia5 dia6)
    (anterior dia6 dia7)
    (anterior dia7 dia8)
    (anterior dia8 dia9)
    (anterior dia9 dia10)

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
    (dia_disponible dia10)

    ;; Conteos iniciales de contenidos por día
    (= (conteo dia1) 0)
    (= (conteo dia2) 0)
    (= (conteo dia3) 0)
    (= (conteo dia4) 0)
    (= (conteo dia5) 0)
    (= (conteo dia6) 0)
    (= (conteo dia7) 0)
    (= (conteo dia8) 0)
    (= (conteo dia9) 0)
    (= (conteo dia10) 0)
  )

  ;; Estado objetivo
  (:goal
    (and
      (visto pelicula5)    ; Películas 1 a 5 en orden
      (visto pelicula6)    ; Películas paralelas y sin orden estricto
      (visto pelicula7)
      (visto pelicula8)
      (visto pelicula9)
      (visto pelicula10)
      (visto capitulo5)    ; Capítulos 1 a 5 en orden
      (visto capitulo6)    ; Capítulos paralelos y sin orden estricto
      (visto capitulo7)
      (visto capitulo8)
      (visto capitulo9)
      (visto capitulo10)
    )
  )
)
