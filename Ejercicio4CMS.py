from queue import Queue

def avanzarFila(fila : Queue, min : int):
    timing: int = 0
    ultima_persona : int = fila.qsize() + 1
    fila.put(ultima_persona)
    timing = 1
    persona_colgada : int = 0
    while timing <= min:
        if timing % 4 == 0:
            ultima_persona += 1
            fila.put(ultima_persona)
        if fila.qsize() != 0:
            if timing % 5 == 0:
                ultima_persona = persona_colgada
                fila.put(ultima_persona)
            elif timing % 10 == 1:
                fila.get()
            elif timing % 4 == 3:
                fila.get()
            elif timing % 4 == 2:
                persona_colgada = fila.get()
        timing += 1
        
    return fila

fila_test = Queue()



fila_final = avanzarFila(fila_test,1)


def hacer_lista(fila: Queue) -> list:
    i = fila.qsize()
    lista = []
    while i > 0:
        lista.append(fila.get())
        i -= 1
    return lista

print(hacer_lista(fila_test))


         
    




