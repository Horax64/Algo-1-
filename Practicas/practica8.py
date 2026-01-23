from math import *


# Ejercicio 1

# Primera parte

def pertenece (lista:list,elemento:int) -> bool:
    return elemento in lista

def pertenece_b (lista:list, elemento:int) -> bool:
    i = 0
    while (i < len(lista)):
        if(lista[i]==elemento):
            return True
        i = i+1
    return False

def pertenece_c (lista:list, elemento:int) -> bool:
    for lugar in range(0,len(lista)):
        if(lista[lugar] == elemento):
            return True
    return False

# Ejercicio 2

def divide_a_todos (lista:list, elemento:int) -> bool:
    for lugar in range(0,len(lista)):
        if(lista[lugar] % elemento != 0):
            return False
    return True

# Ejercicio 3

def suma_total (lista:list) -> int:
    suma = 0
    for elemento in lista:
        suma = suma + elemento
    return suma

# Ejercicio 4

def ordenados (lista:list):
    for lugar in range(0,len(lista)-1):
        if (lista[lugar]>=lista[lugar+1]):
            return False
    return True

# Ejercicio 5

def palabra_mayor_a_7(lista_palabras:list) -> bool:
    for palabra in lista_palabras:
        if(len(palabra)>7):
            return True
    return False
    
# Ejercicio 6 

def palindroma(palabra:str) -> bool:
    if len(palabra) == 1:
        return True
    if len(palabra) == 2:
        return palabra[0]==palabra[1]
    if (palabra[0] != palabra[len(palabra)-1]):
        return False
    else:
        return palindroma(palabra[1:len(palabra)-1])

# Ejercicio 7

def contraseña_segura(contraseña:str):
    v = "VERDE"
    a = "AMARILLA"
    r = "ROJA"
    
    mayusculas = 0
    minusculas = 0
    numeros = 0

    if(len(contraseña)< 5):
        return r
    
    for letra in contraseña:
        if (97<= ord(letra) <= 122):
            minusculas += 1
        if (65 <= ord(letra) <= 90):
            mayusculas += 1 
        if (48 <= ord(letra)<= 57):
            numeros += 1
            
    if mayusculas >= 1 and minusculas >= 1 and numeros >= 1:
        return v
    
    return a

# Ejercicio 8 

def saldo_actual(movimientos:list) -> int:
    
    saldo = 0 
    
    for movimiento in movimientos:
        monto = movimiento[1]
        if movimiento[0]=="I":
            saldo += monto
        else:
            saldo -= monto
        
    return saldo
        
# Ejercicio 9

def tres_vocales_distintas(palabra:str) -> bool:
    
    vocales_mayusculas = ['A','E','I','O','U']
    vocales_minusculas = ['a','e','i','o','u']
    
    for letra in palabra:
        
        if letra in vocales_mayusculas:
            posicion = vocales_mayusculas.index(letra)
            del vocales_mayusculas[posicion]
            del vocales_minusculas[posicion]
           
        if letra in vocales_minusculas: 
            posicion = vocales_minusculas.index(letra)
            del vocales_mayusculas[posicion]
            del vocales_minusculas[posicion]
         
        if len(vocales_mayusculas) <= 2:
            return True
    
    return False

# Segunda parte

# Ejercicio 10

def pares_por_ceros(lista:list) -> list:
    for i in range(0,len(lista)):
        if lista[i] % 2 == 0:
            lista[i] = 0
    return lista

# Ejercicio 11

def pares_por_ceros_b(lista:list) -> list:
    lista_out =[]
    for i in range(0,len(lista)):
        if lista[i] % 2 == 0:
            lista_out.append(0)
        else:
            lista_out.append(lista[i])
    return lista_out

# Ejercicio 12 


            
            


    


