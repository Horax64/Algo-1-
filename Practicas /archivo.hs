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

--Ejercicio 2) a)


absoluto :: Int -> Int
absoluto x | x >= 0 = x     
           | otherwise = -x 

--Ejercicio 2) b)

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto x >= absoluto y = x 
                   | otherwise = y 

--Ejercicio 2) c)

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x>=y && x>=z = x 
              | y>=x && y>=z = y 
              | z>=y && z>=x = z 

--Ejercicio 2) d)

--Forma funcional común
algunoEs0 :: Float -> Float -> Bool 
algunoEs0 x y | x == 0 || y == 0 = True        
              | otherwise = False

--Con pattern matching 
algunoEs0' :: Float -> Float -> Bool 
algunoEs0' 0 y = True
algunoEs0' x 0 = True
algunoEs0' x y = False 

--Ejercicio 2) e) 

--Forma funcional común
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

--Con pattern matching 
ambosSon0' :: Float -> Float -> Bool 
ambosSon0' 0 0 = True
ambosSon0' x y = False 

--Ejercicio 2) f) 

mismoIntervalo :: Float -> Float -> Bool 
mismoIntervalo x y | x <= 3 && y <= 3 = True 
                   | (3 < x && x <= 7) && (3 < y && y <= 7) = True 
                   | x > 7 && y > 7 = True 
                   | otherwise = False 

--Ejercicio 2) g) 

sumaDistintos :: Int -> Int -> Int -> Int 
sumaDistintos x y z | (x == y) && (y == z) = x
                    |  x == y = y + z
                    |  y == z = x + z 
                    |  x == z = x + y 
                    | otherwise = x + y + z

--Ejercicio 2) h)

esMultiploDe :: Int -> Int -> Bool 
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False 

--Ejercicio 2) i)

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10 

--Ejercicio 2) j)

digitoDecenas :: Int -> Int 
digitoDecenas x = mod (div x 10) 10 