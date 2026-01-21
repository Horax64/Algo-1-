def contarlineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo,'r')
    lineas: int = 0 
    for i in archivo.readlines():
        lineas += 1
    archivo.close()
    return lineas

def existePalabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo,'r')
    for linea in archivo.readlines():
        if palabra in linea:
            return True
    archivo.close()
    return False
    

def cantidadApariciones(nombre_archivo: str, palabra: str) -> int:
    archivo = open(nombre_archivo,'r')
    apariciones: int = 0
    for i in archivo.readlines():
        apariciones += i.count(palabra)
    archivo.close()
    return apariciones

def clonarSinComentarios(nombre_archivo: str):
    archivo = open(nombre_archivo,'r')
    archivo_sin_comentarios = open('limpio.txt','x')
    lineas = archivo.readlines()
    for linea in lineas:
        i: int = 0
        nuevaLinea = ""
        while linea[i] != '#':
            nuevaLinea += linea[i]
            i += 1 
        archivo_sin_comentarios.write(nuevaLinea + '\n')
    archivo.close()
    archivo_sin_comentarios.close()
    
def reverso (nombre_archivo: str):
    archivo = open(nombre_archivo,'r')
    archivo_inverso = open('invertido.txt','x')
    lines = archivo.readlines()
    for i in range (-1,-len(lines)-1,-1):
        archivo_inverso.writelines(lines[i])
    archivo.close()
    archivo_inverso.close()

def escribir_frase (frase: str, filename: str):
    file = open(filename,'a')
    file.write('\n' + frase)
    file.close()

def escribir_frase_al_inicio (frase: str, filename: str):
    file = open(filename,'r')
    lines = [frase + '\n'] + file.readlines()
    file.close()
    file = open(filename,'w')
    for line in lines:
        file.write(line)
    file.close()

def traducirBinario()
