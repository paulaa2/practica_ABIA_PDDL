import networkx as nx
import random
import numpy as np
import sys
import matplotlib.pyplot as plt
from random import Random
import argparse


# Funciones generadoras de problemas

def gen0():
    pass

def gen1():
    rng = Random(semilla)

    f = open('problema_gen4_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numDies)+ '_' + str(semilla) + '.pddl', 'w')

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
            f.write(' pelicula' + str(pelicula) + '_g' + str(grup))
        f.write(' - contenido\n')
    
    f.write('\n')

    for i in range(numDies):
        aux = ' dia' + str(i)
        f.write(aux)


    f.write(' - dia\n  )')

    f.write('\n(:init')


    # Añadir relaciones entre dias

    f.write('\n  ')

    for i in range(0, numDies-1):
        aux = '\n (dia_disponible dia' + str(i)+ ')'
        f.write(aux)

    f.write('\n  ')

    for i in range(0, numDies-1):
        aux = '\n (anterior_dia dia' + str(i+1) + ' dia' + str(i) + ')'
        f.write(aux)

    f.write('\n  ')

    ## Añadir predecesores 
    for grup, pelicules in grups.items():
        for i in range(len(pelicules)-1):
            f.write('\n(predecesor pelicula' + str(i) + '_g' + str(grup)+ ' pelicula' + str(i+1) + '_g' + str(grup) + ')')
    f.write('\n')

    ## Añadir vistas

    visto = [0]*sagas
    for _ in range(numVist):
        aux = rng.randint(0, sagas)
        aux2 = 'pelicula' + str(visto[aux]) + '_g' + str(aux) + ')'
        f.write('\n  (visto ' + aux2 +')')
        visto[aux] += 1
    f.write('\n')


    # Añadir objetivos

    f.write('(:goal \n (and')
    for i in range(numObjectiu):
        aux = rng.randint(0, sagas)
        aux2 = rng.randint(0, len(grups[aux]))
        obj = '\n (visto pelicula' + str(aux2) + '_g' + str(aux) + ')'
        f.write(obj)

    f.write('\n  )\n )\n)')
    f.close()

def gen2():
    pass

def gen3():
    pass

def gen4(numContingut, numVist, numObjectiu, numDies, semilla):

    rng = Random(semilla)

    f = open('problema_gen4_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numDies)+ '_' + str(semilla) + '.pddl', 'w')

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
            f.write(' pelicula' + str(pelicula) + '_g' + str(grup))
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

    for i in range(numContingut):
        min = rng.randint(20, 180)
        f.write('\n  (= (minutos pelicula' + str(i) + ') ' +  str(min) + ')')
    f.write('\n')

    ## Añadir predecesores 
    for grup, pelicules in grups.items():
        for i in range(len(pelicules)-1):
            f.write('\n(predecesor pelicula' + str(i) + '_g' + str(grup)+ ' pelicula' + str(i+1) + '_g' + str(grup) + ')')
    f.write('\n')

    var = int(rng.random())           
    if var % 2 == 0:
        aux = rng.randint(0, sagas)
        AUX = rng.randint(0, count[aux])
        aux2 = 'pelicula' + str(AUX) + '_g' + str(aux) 

        help = rng.randint(0, sagas)
        HELP = rng.randint(0, count[help])
        help2 = 'pelicula' + str(HELP) + '_g' + str(help)

        if aux != help:
            f.write('\n(predecesor ' + aux2 + ' ' + help2 + ')')  

    ## Añadir paralelos
    paralelos = []
    for _ in range(rng.randint(1, numContingut//2)):
        aux = rng.randint(0, sagas)
        AUX = rng.randint(0, count[aux])
        aux2 = 'pelicula' + str(AUX) + '_g' + str(aux) 

        help = rng.randint(0, sagas)
        HELP = rng.randint(0, count[help])
        help2 = 'pelicula' + str(HELP) + '_g' + str(help)

        if aux != help and [[AUX,HELP], [aux,help]] not in paralelos and [[HELP,AUX], [help,aux]] not in paralelos:

            for all in paralelos:
                if [aux,help] == all[1] or [help,aux] == all[1]:
                    if all[1][0] < AUX and all[1][1] < HELP or all[1][0] > AUX and all[1][1] > HELP:
                        f.write('\n(paralelo pelicula' + help2 + ' ' + aux2 + ')')
                        paralelos.append([[AUX,HELP], [aux,help]])
                else:
                    f.write('\n(paralelo pelicula' + help2 + ' ' + aux2 + ')')
                    paralelos.append([[AUX,HELP], [aux,help]])


    ## Añadir vistas

    visto = [0]
    for i in range(sagas):
        visto.append(0)

    for _ in range(numVist):
        aux = rng.randint(0, sagas)
        aux2 = 'pelicula' + str(visto[aux]) + '_g' + str(aux) + ')'
        f.write('\n  (visto ' + aux2 +')')
        visto[aux] += 1
    f.write('\n')


    # Añadir objetivos

    f.write('(:goal \n (and')
    for i in range(numObjectiu):
        aux = rng.randint(0, sagas)
        aux2 = rng.randint(0, len(grups[aux]))
        obj = '\n (visto pelicula' + str(aux2) + '_g' + str(aux) + ')'
        f.write(obj)

    f.write('\n  )\n )\n)')
    f.close()



###########################################################################################

extension = int(sys.argv[1])

numContingut = int(sys.argv[2])
sagas = int(sys.argv[3])
numVist = int(sys.argv[4])
numObjectiu = int(sys.argv[5])
numDies = int(sys.argv[6])
semilla = int(sys.argv[7])


if extension == 0:
    gen0(numContingut, numVist, numObjectiu, numDies, semilla)
elif extension == 1:
    gen1(numContingut, numVist, numObjectiu, numDies, semilla)
elif extension == 2:
    gen2(numContingut, numVist, numObjectiu, numDies, semilla)
elif extension == 3:
    gen3(numContingut, numVist, numObjectiu, numDies, semilla)
elif extension == 4:
    gen4(numContingut, numVist, numObjectiu, numDies, semilla)
else:
    print("Extension no valida")
    sys.exit()
