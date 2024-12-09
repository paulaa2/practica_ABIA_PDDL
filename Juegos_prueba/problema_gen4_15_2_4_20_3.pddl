(define (problem visionado_test)
  (:domain visionado_contenidos)
  (:objects
 pelicula_0_g0 pelicula_1_g0 pelicula_2_g0 pelicula_3_g0 pelicula_4_g0 pelicula_5_g0 pelicula_6_g0 pelicula_7_g0 - contenido
 pelicula_0_g1 pelicula_1_g1 pelicula_2_g1 pelicula_3_g1 pelicula_4_g1 pelicula_5_g1 pelicula_6_g1 - contenido

 dia0 dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 dia16 dia17 dia18 dia19 - dia
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
 (siguiente_dia dia9 dia10)
 (siguiente_dia dia10 dia11)
 (siguiente_dia dia11 dia12)
 (siguiente_dia dia12 dia13)
 (siguiente_dia dia13 dia14)
 (siguiente_dia dia14 dia15)
 (siguiente_dia dia15 dia16)
 (siguiente_dia dia16 dia17)
 (siguiente_dia dia17 dia18)
 (siguiente_dia dia18 dia19)
  
 (anterior_dia dia1 dia0)
 (anterior_dia dia2 dia1)
 (anterior_dia dia3 dia2)
 (anterior_dia dia4 dia3)
 (anterior_dia dia5 dia4)
 (anterior_dia dia6 dia5)
 (anterior_dia dia7 dia6)
 (anterior_dia dia8 dia7)
 (anterior_dia dia9 dia8)
 (anterior_dia dia10 dia9)
 (anterior_dia dia11 dia10)
 (anterior_dia dia12 dia11)
 (anterior_dia dia13 dia12)
 (anterior_dia dia14 dia13)
 (anterior_dia dia15 dia14)
 (anterior_dia dia16 dia15)
 (anterior_dia dia17 dia16)
 (anterior_dia dia18 dia17)
 (anterior_dia dia19 dia18)
  
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
  (= (conteo_dia dia10) 0)
  (= (conteo_dia dia11) 0)
  (= (conteo_dia dia12) 0)
  (= (conteo_dia dia13) 0)
  (= (conteo_dia dia14) 0)
  (= (conteo_dia dia15) 0)
  (= (conteo_dia dia16) 0)
  (= (conteo_dia dia17) 0)
  (= (conteo_dia dia18) 0)
  (= (conteo_dia dia19) 0)
  
(predecesor pelicula_0_g0 pelicula_1_g0)
(predecesor pelicula_1_g0 pelicula_2_g0)
(predecesor pelicula_2_g0 pelicula_3_g0)
(predecesor pelicula_3_g0 pelicula_4_g0)
(predecesor pelicula_4_g0 pelicula_5_g0)
(predecesor pelicula_5_g0 pelicula_6_g0)
(predecesor pelicula_6_g0 pelicula_7_g0)
(predecesor pelicula_0_g1 pelicula_1_g1)
(predecesor pelicula_1_g1 pelicula_2_g1)
(predecesor pelicula_2_g1 pelicula_3_g1)
(predecesor pelicula_3_g1 pelicula_4_g1)
(predecesor pelicula_4_g1 pelicula_5_g1)
(predecesor pelicula_5_g1 pelicula_6_g1)


  (visto pelicula_0_g1)
  (visto pelicula_1_g1)
  (visto pelicula_2_g1)
  (visto pelicula_3_g1)) 

(:goal 
 (and
 (visto pelicula_5_g0)
 (visto pelicula_4_g0)
   )
  )
 )