from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  
    if l == []:
        return 0

    i:int = 0
    j:int = 0
    
    longestmeseta:int = 1
    
    for k in range(i,len(l)-1,1):
        if l[k] == l[k+1]:
            meseta: int = 1
            j = k
            while j != len(l) -1 and l[j] == l[j+1]:
                meseta += 1
                j += 1
            if meseta >= longestmeseta:
                longestmeseta = meseta
            if not(j+1 == len(l)-1):
                 i=j+1
    
    return longestmeseta

if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))