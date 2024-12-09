import subprocess
import time

# Inicializar variables
total_time = 0
average_time = 0

# Comando a ejecutar
command = ['./ff', '-O', '-o', 'domini.pddl', '-f', 'experimento_gen4_20_2_2_20_4.pddl']

def execute_command(command):
    start_time = time.time()
    result = subprocess.run(command, capture_output=True, text=True)
    end_time = time.time()
    execution_time = end_time - start_time

    print("Resultado de la ejecución:")
    print(result.stdout)
    print("Errores de la ejecución:")
    print(result.stderr)
    print(f"Tiempo de ejecución: {execution_time:.2f} segundos")

    return execution_time

execution_time = execute_command(command)
total_time += execution_time
average_time += 1

print("__________________________________________________________")

command = ['./ff', '-O', '-o', 'domini.pddl', '-f', 'experimento_gen4_20_2_2_20_5.pddl']


execution_time = execute_command(command)
total_time += execution_time
average_time += 1

print("__________________________________________________________")

command = ['./ff', '-O', '-o', 'domini.pddl', '-f', 'experimento_gen4_20_2_2_20_6.pddl']

execution_time = execute_command(command)
total_time += execution_time
average_time += 1

print("__________________________________________________________")

command = ['./ff', '-O', '-o', 'domini.pddl', '-f', 'experimento_gen4_20_2_2_20_7.pddl']

execution_time = execute_command(command)
total_time += execution_time
average_time += 1

print("__________________________________________________________")

command = ['./ff', '-O', '-o', 'domini.pddl', '-f', 'experimento_gen4_20_2_2_20_8.pddl']

execution_time = execute_command(command)
total_time += execution_time
average_time += 1

average_time = total_time / average_time
print(f"Tiempo promedio de ejecución: {average_time:.2f} segundos")



