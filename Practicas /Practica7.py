#Practica 7 - Introducción a Python 

from math import *

#Ejercicio 1 - Definir las siguientes funciones y procedimientos 

#Inciso a: 

def raizDe2() -> float: 
    x = sqrt(2)
    return round(x,4)

#Inciso b: 

def imprimir_hola():
    print("hola")
   
#Inciso c: 

def imprimir_un_verso() -> str:
    print('Remember, we are eternal, all this pain is an illusion...')

#Incisos d, e, f y g:

def factorial_de_2() -> int:
    return 2*1 

def factorial_de_3() -> int: 
    return 3*factorial_de_2() 

def factorial_de_4() -> int: 
    return 4 *factorial_de_3() 

def factorial_de_5() -> int: 
    return 5*factorial_de_4()

#Ejercicio 2 - Definir las siguientes funciones y procedimientos con parámetros: 

#Inciso a:

def imprimir_saludo(nombre: str) -> str:
    print("Hola",nombre) 

#Inciso b:

def raiz_cuadrada_de(numero:int) -> float: 
    return sqrt(numero)

#Inciso c:

def imprimir_dos_veces(estribillo:str) -> str:
    print(estribillo,estribillo)

#Inciso d:

def es_Multiplo_de(n:int, m:int) -> bool: 
    if n % m 