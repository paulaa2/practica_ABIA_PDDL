(define (domain visionado_basico)
  (:requirements :strips :typing)
  

  (:types contenido dia)


  (:predicates
    (visto ?contenido - contenido)          
    (predecesor ?a ?b - contenido)         
    (asignado ?contenido - contenido ?dia - dia) 
    (dia_disponible ?dia - dia)        
  )

  (:action ver_contenido
    :parameters (?contenido - contenido ?dia - dia)
    :precondition (and
      (dia_disponible ?dia)                 
      (not (visto ?contenido))              
      (forall (?pred - contenido)          
        (imply (predecesor ?pred ?contenido) (visto ?pred))
      )
    )
    :effect (and
      (visto ?contenido)                   
      (asignado ?contenido ?dia)         
      (not (dia_disponible ?dia))        
    )
  )
)
