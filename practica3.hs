{-Ejercicios del labo:

doubleMe x = 2*x

f :: Integer -> Integer
f 1 = 8
f 4 = 131 
f 16 = 15

g :: Integer -> Integer
g 8 = 16 
g 16 = 4 
g 131 = 1

h :: Integer -> Integer 
h 8 = (f 16)
h 16 = (f 4)
h 131 = (f 1)

-}

--Ejercicio 2

--Inciso a: 

absoluto :: Int -> Int
absoluto x | x >= 0 = x     
           | otherwise = -x 

--Inciso b:

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto x >= absoluto y = x 
                   | otherwise = y 

--Inciso c:

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x>=y && x>=z = x 
              | y>=x && y>=z = y 
              | z>=y && z>=x = z 

--Inciso d:

--Con guardas
algunoEs0 :: Float -> Float -> Bool 
algunoEs0 x y | x == 0 || y == 0 = True        
              | otherwise = False

--Con pattern matching 
algunoEs0' :: Float -> Float -> Bool 
algunoEs0' 0 y = True
algunoEs0' x 0 = True
algunoEs0' x y = False 

--Inciso e:

--Con guardas
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

--Con pattern matching 
ambosSon0' :: Float -> Float -> Bool 
ambosSon0' 0 0 = True
ambosSon0' x y = False 

--Inciso f:

mismoIntervalo :: Float -> Float -> Bool 
mismoIntervalo x y | x <= 3 && y <= 3 = True 
                   | (3 < x && x <= 7) && (3 < y && y <= 7) = True 
                   | x > 7 && y > 7 = True 
                   | otherwise = False 

--Inciso g:

sumaDistintos :: Int -> Int -> Int -> Int 
sumaDistintos x y z | (x == y) && (y == z) = x
                    |  x == y = y + z
                    |  y == z = x + z 
                    |  x == z = x + y 
                    | otherwise = x + y + z

--Inciso h:

esMultiploDe :: Int -> Int -> Bool 
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False 

--Inciso i:

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10 

--Inciso j:

digitoDecenas :: Int -> Int 
digitoDecenas x = mod (div x 10) 10 



--Ejercicio 3

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b | mod a (-b) == 0 = True 
                      | otherwise = False

--Ejercicio 4 

--Inciso a: 
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt u v = (fst u)*(fst v) + (snd u)*(snd v)

--Con pattern matching 
prodInt' :: (Float, Float) -> (Float, Float) -> Float
prodInt' (ux, uy) (vx, vy) = ux*vx + uy*vy

--Inciso b:
todoMenos :: (Float, Float) -> (Float, Float) -> Bool
todoMenos u v | (fst u < fst v) && (snd u < snd v) = True
              | otherwise = False

--Inciso c: 
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos u v = sqrt((fst u - fst v)**2 + (snd u - snd v)**2)

--Con pattern matching
distanciaPuntos' :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos' (ux, uy) (vx, vy) = sqrt((ux-vx)**2 + (uy-vy)**2)

--Inciso d:
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x,y,z) = x + y + z 

--Inciso e:
--Forma medio a los ponchazos:
sumaSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumaSoloMultiplos (x, y, z) k | (mod x k == 0) && (mod y k == 0) && (mod z k == 0) = x + y + z 
                              | (mod x k == 0) && (mod y k == 0) = x + y 
                              | (mod y k == 0) && (mod z k == 0) = y + z
                              | (mod x k == 0) && (mod z k == 0) = x + z
                              | (mod x k == 0) = x 
                              | (mod y k == 0) = y
                              | (mod z k == 0) = z
                              | otherwise = 0 

--Utilizando if:
sumaSoloMultiplosv2 :: (Int, Int, Int) -> Int -> Int
sumaSoloMultiplosv2 (x,y,z) k = (if mod x k == 0 then k else 0) + (if mod y k == 0 then k else 0) + (if mod z k == 0 then k else 0)


--Inciso f: 
posPrimerPar :: (Int, Int, Int) -> Int 
posPrimerPar (x,y,z) | mod x 2 == 0 = 0
                     | mod y 2 == 0 = 1
                     | mod z 2 == 0 = 2 
                     | otherwise = 4
                
--Inciso g:
crearPar :: t -> t -> (t, t)
crearPar x y = (x, y)


--Inciso h: 
invertir :: (t, t) -> (t, t)
invertir (x, y) = (y, x)


--Ejercicio 5
--Funciones auxiliares: 
f1 :: Int -> Int
f1 n | n <= 7 = n*n 
     | otherwise = 2*n -1

{- La misma pero con if:

f1 :: Int -> Int 
f1 n = if n <= 7 then n*n else 2*n -1  

-}

f2 :: Int -> Int
f2 n | mod n 2 == 0 = div n 2 
     | otherwise = 3*n + 1 

{- Con if:
 
f2 :: Int -> Int 
f2 n = if mod n 2 == 0 then div n 2 else 3*n + 1


-}

--Función principal
todosMenores :: (Int, Int, Int) -> Bool 
todosMenores (x, y, z) | (f1 x < f2 x) && (f1 y < f2 y) && (f1 z < f2 z) = True
                       | otherwise = False 


--Ejercicio 6:
esBisiesto :: Int -> Bool 
esBisiesto y | esMultiplo y 4 == True && (esMultiplo y 100 == False || esMultiplo y 400 == True) = True
             | otherwise = False
             where esMultiplo y k = if mod y k == 0 then True else False 

--Ejercicio 7: 
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float 
distanciaManhattan (x1,x2,x3) (y1,y2,y3) = abval (x1-y1) + abval (x2-y2) + abval (x3-y3) 
                                        where abval k = if k >= 0 then k else -k 


--Ejercicio 8: 
comparar :: Int -> Int -> Int 
comparar x y | (sumaDosUltimosDigitos x) < (sumaDosUltimosDigitos y) = 1
             | (sumaDosUltimosDigitos x) > (sumaDosUltimosDigitos y) = (-1)
             | otherwise = 0 
              where sumaDosUltimosDigitos a = mod a 10 + mod (div a 10) 10



