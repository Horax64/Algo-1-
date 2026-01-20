from math import *

# Guia de IP

# Ejercicio 1

def raizDe2() -> float:
    return round(math.sqrt(2),4)

def imprimir_hola() -> str:
    print('hola')
    
def imprimir_un_verso() -> str:
    print('Bless this immunity')
    
def factorial_de_dos() -> int:
    return 2 

# Idem con los factoriales de 3, 4 y 5

# Ejercicio 2

def imprimir_saludo(nombre: str) -> str:
    print("Hola",nombre) 
    
def raiz_cuadrada_de(numero: int) -> float:
    return sqrt(numero)

def imprimir_dos_veces(estribillo: str):
    print (estribillo + " " + estribillo)

def es_multiplo_de(n:int, m:int):
    if (n % m == 0):
        return True
    else:
        return False
    
def es_Par(n:int):
    return es_multiplo_de(n,2)

def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int):
    porciones_totales = comensales*min_cant_de_porciones
    return ceil(porciones_totales/8)

# Ejercicio 3
def alguno_es_0(numero_1:float, numero_2:float) -> bool:
    return (numero_1 == 0) or (numero_2 == 0)

def ambos_son_0(numero_1:float, numero_2:float) -> bool:
    return (numero_1 == 0) and (numero_2 == 0)

def es_nombre_largo(nombre:str) -> bool:
    return (len(nombre)>=3) and (len(nombre)<=8)

def es_bisiesto(año:int) -> bool:
    return (año % 400 == 0) or ((año % 4 == 0) and not(año % 100 == 0))

# Ejercicio 4 

# Pesando pinos

def peso_pino(altura_m:int):
    
    altura_cm = altura_m*100
    exceso_altura = altura_cm - 300
    
    if(altura_cm <= 300):
        return altura_cm*3
    else:
        return 900 + (2*exceso_altura)

def es_peso_util(peso_pino:int):
    return (400 <= peso_pino<= 1000)

def sirve_pino(altura_pino:int):
    return es_peso_util(peso_pino(altura_pino))

# Ejercicio 5

def devolver_el_doble_si_es_par(un_numero:int):
    if(es_Par(un_numero)):
        return un_numero*2
    else:
        return un_numero
    
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero:int):
    if(es_Par(un_numero)):
        return un_numero
    else:
        return un_numero + 1

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(un_numero:int):
    if(un_numero % 3 == 0):
        if((un_numero/3) % 3 == 0):
            return 3*un_numero
        return 2*un_numero
    return un_numero

def nombre_largo_o_corto(nombre:str):
    if(len(nombre)>=5):
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"
    
def levantar_o_no_la_pala(sexo:str,edad:int) -> str:
    if(edad<18):
        return "Andá de vacaciones"
    if(sexo == "M"):
        if(edad >65):
            return "Andá de vacaciones"
        else:
            return "Te toca trabajar"
    if(sexo == "F"):
        if (edad > 60):
            return "Andá de vacaciones"
        else:
            return "Te toca trabajar"

# Ejercicio 6

def numeros_hasta_el_10() -> str:
    i = 1
    while (i<=10):
        print (i)
        i = i+1

def pares_entre_10_y_40() -> str:
    i=10
    while (i<=40):
        print(i)
        i = i+2

def eco_eco_eco():
    i=1
    while(i<=10):
        print("eco")
        i = i+1

def countdown(t_menos:int):
    i = t_menos
    while (i>=1):
        print(i)
        i = i-1
    print("Despegue!")
    
def viaje_al_pasado(año_partida:int,año_llegada:int):
    i = año_partida -1
    
    while(i >= año_llegada):
        print("Viajó un año al pasado, estamos en el año: ",i)
        i = i -1

def conociendo_a_Aristoteles(año_partida:int):
    i = año_partida - 20
    
    while(i >= -384):
        print("Viajó veinte años al pasado, estamos en el año: ",i)
        i = i - 20

# Ejercicio 7

def numeros_hasta_el_10_b():
    for i in range(1,11,1):
        print(i)
    
def pares_entre_10_y_40_b():
    for i in range(10,42,2):
        print(i)
    
def eco_eco_eco_b():
    for i in range(0,10,1):
        print("eco")
        
def countdown_b(t_minus:int):
    for i in range(t_minus,0,-1):
        print(i)
    print("Despegue!")
    
def viaje_al_pasado_b(año_partida:int, año_llegada:int):
    for año in range(año_partida-1,año_llegada-1,-1):
        print("Viajó un año al pasado, estamos en el año: ", año)

def conociendo_a_Aristoteles_b(año_partida:int):
    for año in range (año_partida,-384,-20):
        print("Viajó veinte años al pasado, estamos en el año: ", año)
    
