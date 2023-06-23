

def unir_diccionarios(a_unir):
    unionDiccionarios = {}
    for diccionario in a_unir:
        for clave in diccionario:
            if clave in unionDiccionarios:
                (unionDiccionarios[clave]).append(diccionario[clave])
            else:
                unionDiccionarios[clave] = [diccionario[clave]]
    
    return unionDiccionarios

print(unir_diccionarios([{'a': 1, 'b': 2}, {'b': 3}, {'c': 5}]))

