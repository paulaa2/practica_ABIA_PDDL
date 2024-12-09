import networkx as nx
import random
import numpy as np
import sys
import matplotlib.pyplot as plt
from random import Random
import argparse
import time


# Funciones generadoras de problemas

# def gen0():
#     pass

# def gen1():
#     rng = Random(semilla)

#     f = open('problema_gen4_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numDies)+ '_' + str(semilla) + '.pddl', 'w')

#     f.write('(define (problem visionado_test)\n  (:domain visionado_contenidos)\n  (:objects')
#     f.write('\n')

#     # Definir Objetos

#     grups = {}
#     count = [0]
#     for i in range(sagas):
#         count.append(0)

#     for _ in range(numContingut):
#         grup = rng.randint(0, sagas)  # Asignar a uno de las sagas
#         if grup not in grups:
#             grups[grup] = []
#         grups[grup].append(count[grup])
#         count[grup] += 1

#     for grup, pelicules in grups.items():
#         for pelicula in pelicules:
#             f.write(' pelicula_' + str(pelicula) + '_g' + str(grup))
#         f.write(' - contenido\n')
    
#     f.write('\n')

#     for i in range(numDies):
#         aux = ' dia' + str(i)
#         f.write(aux)


#     f.write(' - dia\n  )')

#     f.write('\n(:init')


#     # Añadir relaciones entre dias

#     f.write('\n  ')

#     for i in range(0, numDies-1):
#         aux = '\n (dia_disponible dia' + str(i)+ ')'
#         f.write(aux)

#     f.write('\n  ')

#     for i in range(0, numDies-1):
#         aux = '\n (anterior_dia dia' + str(i+1) + ' dia' + str(i) + ')'
#         f.write(aux)

#     f.write('\n  ')

#     ## Añadir predecesores 
#     for grup, pelicules in grups.items():
#         for i in range(len(pelicules)-1):
#             f.write('\n(predecesor pelicula_' + str(i) + '_g' + str(grup)+ ' pelicula_' + str(i+1) + '_g' + str(grup) + ')')
#     f.write('\n')

#     ## Añadir vistas

#     visto = [0]*sagas
#     for _ in range(numVist):
#         aux = rng.randint(0, sagas)
#         aux2 = 'pelicula_' + str(visto[aux]) + '_g' + str(aux) + ')'
#         f.write('\n  (visto ' + aux2 +')')
#         visto[aux] += 1
#     f.write('\n')


#     # Añadir objetivos

#     f.write('(:goal \n (and')
#     for i in range(numObjectiu):
#         aux = rng.randint(0, sagas)
#         aux2 = rng.randint(0, len(grups[aux]))
#         obj = '\n (visto pelicula_' + str(aux2) + '_g' + str(aux) + ')'
#         f.write(obj)

#     f.write('\n  )\n )\n)')
#     f.close()

# def gen2():
#     pass

# def gen3(numContingut, numVist, numObjectiu, numDies, semilla):
#     rng = Random(semilla)

#     f = open('problema_gen3_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numDies)+ '_' + str(semilla) + '.pddl', 'w')

#     f.write('(define (problem visionado_test)\n  (:domain visionado_contenidos)\n  (:objects')
#     f.write('\n')

#     # Definir Objetos

#     grups = {}
#     count = [0]
#     for i in range(sagas):
#         count.append(0)

#     for _ in range(numContingut):
#         grup = rng.randint(0, sagas)  # Asignar a uno de las sagas
#         if grup not in grups:
#             grups[grup] = []
#         grups[grup].append(count[grup])
#         count[grup] += 1

#     for grup, pelicules in grups.items():
#         for pelicula in pelicules:
#             f.write(' pelicula_' + str(pelicula) + '_g' + str(grup))
#         f.write(' - contenido\n')
    
#     f.write('\n')

#     for i in range(numDies):
#         aux = ' dia' + str(i)
#         f.write(aux)


#     f.write(' - dia\n  )')

#     f.write('\n(:init')


#     # Añadir relaciones entre dias

#     f.write('\n   (dia_actual dia1)')
#     f.write('\n  ')

#     for i in range(0, numDies-1):
#         aux = '\n (siguiente_dia dia' + str(i) + ' dia' + str(i+1) + ')'
#         f.write(aux)

#     f.write('\n  ')

#     for i in range(0, numDies-1):
#         aux = '\n (anterior_dia dia' + str(i+1) + ' dia' + str(i) + ')'
#         f.write(aux)

#     f.write('\n  ')

#     for i in range(numDies):
#         aux = '\n  (= (conteo_dia dia' + str(i)  + ') 0)'
#         f.write(aux)

#     f.write('\n  ')


#     # Añadir carateristicas y relaciones de las peliculas

#     ## Añadir predecesores 
#     for grup, pelicules in grups.items():
#         for i in range(len(pelicules)-1):
#             f.write('\n(predecesor pelicula_' + str(i) + '_g' + str(grup)+ ' pelicula_' + str(i+1) + '_g' + str(grup) + ')')
#     f.write('\n')

#     ## Añadir predesesores extra

    

#     ## Añadir paralelos y predesesores extra
#     paralelos = []

#     for _ in range(rng.randint(4, numContingut//2)):
#         aux = rng.randint(0, sagas-1)
#         AUX = rng.randint(0, count[aux]-1)
#         aux2 = 'pelicula_' + str(AUX) + '_g' + str(aux)

#         help = rng.randint(0, sagas-1)
#         HELP = rng.randint(0, count[help]-1)
#         help2 = 'pelicula_' + str(HELP) + '_g' + str(help)

#         # Nuevo paralelo propuesto
#         nuevo_paralelo = [[AUX, HELP], [aux, help]]
#         paralelo_inverso = [[HELP, AUX], [help, aux]]

#         # Comprobamos que no sea el mismo paralelo o su inverso
#         is_different_group = aux != help
#         is_new_paralelo = nuevo_paralelo not in paralelos
#         is_new_paralelo_inverse = paralelo_inverso not in paralelos

#         if is_different_group and is_new_paralelo and is_new_paralelo_inverse:
#             # Verificar que no cruza con ninguno existente
#             se_puede_poner = True
#             for existente in paralelos:
                
#                 X1, Y1 = existente[0] # grupo
#                 x1, y1 = existente[1] # pelicula

#                 # Verificamos si grupos distintos
#                 grupos_iguales = (X1 == AUX and Y1 == HELP) or (X1 == HELP and Y1 == AUX)
                
#                 # Verificamos el orden para el par X1/AUX con x1/aux

#                 mas_grande_x = (x1 < AUX) #
#                 mas_grande_y = (y1 < HELP) #

#                 no_cruce = mas_grande_x == mas_grande_y

#                 # Inverso
#                 mas_grande_x_inv = (x1 < HELP) #
#                 mas_grande_y_inv = (y1 < AUX) #

#                 no_cruce_inverso = mas_grande_x_inv == mas_grande_y_inv

                
#                 if grupos_iguales:
#                     if no_cruce or no_cruce_inverso:
#                         se_puede_poner = True
#                     else:
#                         se_puede_poner = False
#                         break

#             if se_puede_poner:
#                 var = rng.randint(0, 100)
#                 if var % 2 == 0:
#                     f.write('\n(paralelo ' + help2 + ' ' + aux2 + ')')
#                     paralelos.append(nuevo_paralelo)
#                 else:
#                     f.write('\n(predecesor ' + help2 + ' ' + aux2 + ')')
#                     paralelos.append(nuevo_paralelo)

#     f.write('\n')

#     ## Añadir vistas

#     visto = [0]
#     for i in range(sagas):
#         visto.append(0)

#     for _ in range(numVist):
#         aux = rng.randint(0, sagas)
#         aux2 = 'pelicula_' + str(visto[aux]) + '_g' + str(aux)
#         f.write('\n  (visto ' + aux2 +')')
#         visto[aux] += 1
#     f.write(') \n')
#     f.write('\n')


#     # Añadir objetivos

#     f.write('(:goal \n (and')
#     for i in range(numObjectiu):
#         aux = rng.randint(0, sagas)
#         aux2 = rng.randint(0, len(grups[aux]))
#         obj = '\n (visto pelicula_' + str(aux2) + '_g' + str(aux) + ')'
#         f.write(obj)

#     f.write('\n   )\n  )\n )')
#     f.close()


def gen4(numContingut, numVist, numObjectiu, numDies, semilla, sagas):

    rng = Random(semilla)

    f = open('experimento_gen4_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numDies)+ '_' + str(semilla) + '.pddl', 'w')

    # f = open('MECAGO_FUNCIONA'+'.pddl', 'w')

    f.write('(define (problem visionado_test)\n  (:domain visionado_contenidos)\n  (:objects')
    f.write('\n')

    # Definir Objetos

    grups = {}
    count = [0]
    for i in range(sagas):
        count.append(0)

    for _ in range(numContingut):
        grup = rng.randint(0, sagas)  # Asignar a uno de las sagas
        if grup not in grups:
            grups[grup] = []
        grups[grup].append(count[grup])
        count[grup] += 1

    for grup, pelicules in grups.items():
        for pelicula in pelicules:
            f.write(' pelicula_' + str(pelicula) + '_g' + str(grup))
        f.write(' - contenido\n')
    
    f.write('\n')

    for i in range(numDies):
        aux = ' dia' + str(i)
        f.write(aux)


    f.write(' - dia\n  )')

    f.write('\n(:init')


    # Añadir relaciones entre dias

    f.write('\n   (dia_actual dia1)')
    f.write('\n  ')

    for i in range(0, numDies-1):
        aux = '\n (siguiente_dia dia' + str(i) + ' dia' + str(i+1) + ')'
        f.write(aux)

    f.write('\n  ')

    for i in range(0, numDies-1):
        aux = '\n (anterior_dia dia' + str(i+1) + ' dia' + str(i) + ')'
        f.write(aux)

    f.write('\n  ')

    for i in range(numDies):
        aux = '\n  (= (conteo_min_dia dia' + str(i)  + ') 0)'
        f.write(aux)

    f.write('\n  ')


    # Añadir carateristicas y relaciones de las peliculas

    for grup, pelicules in grups.items():
        min = rng.randint(20, 150)
        for i in range(len(pelicules)):
            f.write('\n  (= (minutos pelicula_' + str(i) + '_g' + str(grup)+ ') ' +  str(min) + ')')
    f.write('\n')

    ## Añadir predecesores 
    for grup, pelicules in grups.items():
        for i in range(len(pelicules)-1):
            f.write('\n(predecesor pelicula_' + str(i) + '_g' + str(grup)+ ' pelicula_' + str(i+1) + '_g' + str(grup) + ')')
    f.write('\n')

    ## Añadir predesesores extra

    

    ## Añadir paralelos y predesesores extra
    grup_n = []
    pel_n = []


    valid=False
    for _ in range(rng.randint(4, sagas)):
        while not valid:
            gr1 = rng.randint(0, sagas)
            num1 = rng.randint(0, count[gr1]-1)
            aux2 = 'pelicula_' + str(num1) + '_g' + str(gr1)

            gr2 = rng.randint(0, sagas-1)
            if num1 >= count[gr2]-1 or rng.randint(0, 100) % 2 == 0:
                num2 = rng.randint(0, count[gr2]-1)
            else:
                num2 = num1

            help2 = 'pelicula_' + str(num2) + '_g' + str(gr2)
            
            if [gr1, gr2] in grup_n or [num1,gr1] in pel_n or [num2,gr2] in pel_n or gr1 == gr2:
                valid = False
            else:
                if rng.randint(0, 100) % 2 == 0:
                    f.write('\n(paralelo ' + help2 + ' ' + aux2 + ')')
                    valid = True
                    grup_n.append([gr1, gr2])
                    pel_n.append([num1, gr1])
                    pel_n.append([num2, gr2])

                else:
                    if num1 == num2:
                        valid = False
                    else: 
                        f.write('\n(predecesor ' + help2 + ' ' + aux2 + ')')
                        valid = True
                        grup_n.append([gr1, gr2])
                        pel_n.append([num1, gr1])
                        pel_n.append([num2, gr2])

                
        valid = False


        

        

    f.write('\n')

    ## Añadir vistas

    visto = [0]
    no_obj = []
    for i in range(sagas):
        visto.append(0)

    for _ in range(numVist):
        aux = rng.randint(0, sagas)
        aux2 = 'pelicula_' + str(visto[aux]) + '_g' + str(aux)
        f.write('\n  (visto ' + aux2 +')')
        visto[aux] += 1
        no_obj.append([visto[aux], aux])

    f.write(') \n')
    f.write('\n')

    # Añadir objetivos
    cumplido = False

    f.write('(:goal \n (and')
    for i in range(numObjectiu):
        while not cumplido:
            aux = rng.randint(0, sagas)
            aux2 = rng.randint(0, len(grups[aux])-1)

            if [aux2, aux] in no_obj:
                cumplido = False
            else:
                obj = '\n (visto pelicula_' + str(aux2) + '_g' + str(aux) + ')'
                no_obj.append([aux2, aux])

                f.write(obj)
                cumplido = True
        cumplido = False

    f.write('\n   )\n  )\n )')
    f.close()



###########################################################################################

extension = int(sys.argv[1])

numContingut = int(sys.argv[2])
sagas = int(sys.argv[3])
numVist = int(sys.argv[4])
numObjectiu = int(sys.argv[5])
numDies = int(sys.argv[6])
semilla = int(sys.argv[7])

start_time = time.time()

# if extension == 0:
#     gen0(numContingut, numVist, numObjectiu, numDies, semilla)
# elif extension == 1:
#     gen1(numContingut, numVist, numObjectiu, numDies, semilla)
# elif extension == 2:
#     gen2(numContingut, numVist, numObjectiu, numDies, semilla)
# elif extension == 3:
#     gen3(numContingut, numVist, numObjectiu, numDies, semilla)
if extension == 4:
    gen4(numContingut, numVist, numObjectiu, numDies, semilla, sagas)
else:
    print("Extension no valida")
    sys.exit()

    


    

