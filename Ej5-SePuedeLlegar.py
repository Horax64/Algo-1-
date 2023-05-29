from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  for vuelo in vuelos:
        if origen == vuelo[0]:
            i: int = 0
            ruta: int = 1
            partida: str = origen
            llegada: str = vuelo[1]
            while i<len(vuelos):
                if vuelos[i][0] == llegada and llegada != origen and (llegada != destino):
                   partida = vuelos[i][0]
                   llegada = vuelos[i][1]
                   ruta += 1
                   i = 0
                else:
                    i += 1
            if llegada == destino or (llegada == origen and ruta>1 and destino == origen):
                return ruta
  return -1

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))