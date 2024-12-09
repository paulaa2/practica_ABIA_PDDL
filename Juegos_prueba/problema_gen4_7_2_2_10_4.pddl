(define (problem visionado_test)
  (:domain visionado_contenidos)
  (:objects
 pelicula_0_g0 pelicula_1_g0 pelicula_2_g0 pelicula_3_g0 - contenido
 pelicula_0_g1 pelicula_1_g1 pelicula_2_g1 - contenido

 dia0 dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 - dia
  )
(:init
   (dia_actual dia1)
  
 (siguiente_dia dia0 dia1)
 (siguiente_dia dia1 dia2)
 (siguiente_dia dia2 dia3)
 (siguiente_dia dia3 dia4)
 (siguiente_dia dia4 dia5)
 (siguiente_dia dia5 dia6)
 (siguiente_dia dia6 dia7)
 (siguiente_dia dia7 dia8)
 (siguiente_dia dia8 dia9)
  
 (anterior_dia dia1 dia0)
 (anterior_dia dia2 dia1)
 (anterior_dia dia3 dia2)
 (anterior_dia dia4 dia3)
 (anterior_dia dia5 dia4)
 (anterior_dia dia6 dia5)
 (anterior_dia dia7 dia6)
 (anterior_dia dia8 dia7)
 (anterior_dia dia9 dia8)
  
  (= (conteo_dia dia0) 0)
  (= (conteo_dia dia1) 0)
  (= (conteo_dia dia2) 0)
  (= (conteo_dia dia3) 0)
  (= (conteo_dia dia4) 0)
  (= (conteo_dia dia5) 0)
  (= (conteo_dia dia6) 0)
  (= (conteo_dia dia7) 0)
  (= (conteo_dia dia8) 0)
  (= (conteo_dia dia9) 0)
  
(predecesor pelicula_0_g0 pelicula_1_g0)
(predecesor pelicula_1_g0 pelicula_2_g0)
(predecesor pelicula_2_g0 pelicula_3_g0)
(predecesor pelicula_0_g1 pelicula_1_g1)
(predecesor pelicula_1_g1 pelicula_2_g1)


  (visto pelicula_0_g0)
  (visto pelicula_0_g1)) 

(:goal 
 (and
 (visto pelicula_1_g1)
 (visto pelicula_2_g0)
   )
  )
 )