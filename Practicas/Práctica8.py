#Primera parte 

#Ejercicio 8 

def cuentaBancaria(cuenta: list) -> int:
    saldo: int = 0 
    for movimiento in cuenta:
        if movimiento[0] == 'I':
            saldo += movimiento[1]
        else:
            saldo -= movimiento[1]
    return saldo

#Ejercicio 9:

def tiene_al_menos_tres_vocales(palabra:str) -> bool:
    vocales: list = ['A','E','I','O','U','a','e','i','o','u']
    cantidad_de_vocales : int = 0 
    for vocal in vocales:
        cantidad_de_vocales += palabra.count(vocal)
    if cantidad_de_vocales >= 3:
        return True
    else:
        return False 
    

#Segunda parte

#Ejercicio 1 

#Inciso 1 

def cambiar_pares_por_0(números:list) -> list:
    i: int = 0 
    for i in range(0,len(números),1):
        if números[i] % 2 == 0:
            números.pop(i)
            números.insert(i,0)
    return números 

#Inciso 2 

def misma_lista_pero_con_0(números: list) -> list:
    i: int = 0
    sinpares: list = []
    for numero in números:
        if numero % 2 == 0: 
            sinpares.append(0)
        else: 
            sinpares.append(numero)
    return sinpares 

#Inciso 3:

def saca_vocales(palabra:str) -> str:
    vocales: list = ['A','E','I','O','U','a','e','i','o','u']
    palabra_consonantes : str = ""
    for letra in palabra:
        if letra not in vocales:
            palabra_consonantes += letra 
    return palabra_consonantes

#Inciso 4 

def reemplazaVocales(palabra:str) -> str:
    palabra_con_espacios : str = ""
    vocales: list = ['A','E','I','O','U','a','e','i','o','u']
    for letra in palabra:
        if letra not in vocales:
            palabra_con_espacios += letra
        else: 
            palabra_con_espacios += ''
    return palabra_con_espacios

#Inciso 5 

def daVueltaStr(palabra:str) -> str:
    palabra_invertida: str = ""
    for i in range(len(palabra)-1,-1,-1):
        palabra_invertida += palabra[i]
    return palabra_invertida

#Ejercicio 2

#Inciso 1

def listaEstudiantes() -> list:
    lista_de_estudiantes: list = []
    estudiante: str = ""
    while estudiante != "listo":
        estudiante = input("Nombre del estudiante: ")
        lista_de_estudiantes.append(estudiante)
    if estudiante == "listo":
        lista_de_estudiantes.pop(len(lista_de_estudiantes)-1)
        return lista_de_estudiantes
    
#Inciso 2
    
def sube() -> list:
    movimientos : list = []
    movimiento: str = ""
    monto: int = 0
    operación: tuple = []
    while movimiento != 'X':
        movimiento = input("OPERACION A REALIZAR: ")
        if movimiento == 'C':
            monto = input("MONTO: ")
            operación = ['C',monto]
            movimientos.append(operación)
        if movimiento == 'D':
            monto = input("MONTO: ")
            operación = ['D',monto]
            movimientos.append(operación)
    return movimientos

#Inciso 3 







