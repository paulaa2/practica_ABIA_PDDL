import networkx as nx
import random
import numpy as np
import sys
import matplotlib.pyplot as plt

numContingut= int(sys.argv[1])
numObjectiu= int(sys.argv[2])
numVist = int(sys.argv[3])
numParalels = int(sys.argv[4])
densitatPredecessors = int(sys.argv[5])
numDies = int(sys.argv[6])

f = open('problema_gen45_' + str(numContingut) + '_' + str(numObjectiu) + '_' + str(numVist) + '_' + str(numParalels) + '_' + str(densitatPredecessors) + '_' + str(numDies)  + '.pddl', 'w')

G = nx.gnp_random_graph(numContingut, (densitatPredecessors/10), directed=True)

DAG = nx.DiGraph([(u, v, {'weight': random.randint(1, 1)}) for (u, v) in G.edges() if u < v])
nx.is_directed_acyclic_graph(DAG)
nx.nodes(DAG)

f.write('(define (problem visionado_test)\n  (:domain visionado_contenidos)\n  (:objects')
f.write('\n')

# Definir Objetos

for i in range(numContingut):
    aux = ' pelicula' + str(i)
    f.write(aux)

f.write(' - contenido\n')

for i in range(numDies):
    aux = ' dia' + str(i)
    f.write(aux)


f.write(' - dia\n  )')

f.write('\n(:init')

# Añadir relaciones entre dias

f.write('\n   (dia_actual dia1)')

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

perm = list(DAG.edges())
topological_sorted = list(nx.topological_sort(DAG))

for i in range(numContingut):
    u = topological_sorted[i-1]
    min = random.randint(20, 180)
    f.write('\n  (= (minutos pelicula' + str(u) + ') ' +  str(min) + ')')
f.write('\n')

p = 0

for i in range(len(topological_sorted) - 1):
    if (p < numParalels and i % 2 == 0):
        u = topological_sorted[i]
        v = topological_sorted[i + 1]
        if (u, v) in perm or (v, u) in perm:
            perm.remove((u, v)) if (u, v) in perm else perm.remove((v, u))
        f.write('\n  (paralelo pelicula' + str(u) + ' pelicula' + str(v) + ')')
        p += 1
f.write('\n')

io = 0
ipred = numDies-1 - densitatPredecessors
if densitatPredecessors in range(1,10):
    for (u, v) in perm:
        if (v < numContingut) and (u < numContingut):
            if (io % ipred == 0):
                f.write('\n')
                f.write('\n  (predecesor pelicula' + str(v) + ' pelicula' + str(u) + ')')
            io += 1
f.write('\n')

pelicules = list(DAG.nodes())
ordre = list(nx.topological_sort(DAG))

# Añadir peliculas vistas

for i in range(numVist):
    f.write('\n  (visto pelicula' + str(ordre[i]) + ')')
    pelicules.remove(ordre[i])

f.write('\n')


f.write('\n)')
f.write('\n')

# Añadir objetivos

f.write('(:goal \n (and \n')
for i in range(numObjectiu):
    if len(pelicules) > 0:
        aux = np.random.randint(0, len(pelicules))
        if aux < len(ordre):
            obj = '\n  (visto pelicula' + str(i)  + ')'
            f.write(obj)

f.write('\n)))')
f.close()

# Visualize the graph
plt.figure(figsize=(12, 8))
pos = nx.spring_layout(DAG)
nx.draw(DAG, pos, with_labels=True, node_size=500, node_color="skyblue", font_size=10, font_weight="bold", arrows=True)
plt.title("Directed Acyclic Graph (DAG)")
plt.show()