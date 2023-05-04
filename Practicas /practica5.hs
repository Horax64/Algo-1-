--Ejercicio 1 

--Inciso a 
longitud :: [t] -> Int
longitud [] = 0 
longitud (_:xs) = 1 + longitud xs 

--Otra version 
longitud' :: [t] -> Integer 
longitud' xs = sum[1 | _ <- xs]


--Inciso b 
ultimo :: [t] -> t 
ultimo (x:[]) = x 
ultimo (x:xs) = ultimo xs

--Otra version
ultimo' :: [t] -> t 
ultimo' xs = xs!!((longitud xs) - 1)

--Inciso c 
principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 1 = []
                 | otherwise = x : principio xs

--Inciso d 
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

--Otra forma: 
reverso' :: [t] -> [t]
reverso' xs = [xs!!x | x <- [(longitud xs - 1),(longitud xs - 2)..0]]

--Ejercicio 2 

--Inciso a 
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False 
pertenece e (x:xs) = (e == x) || (pertenece e xs)

--Inciso b 
todosIguales :: (Eq t) => [t] -> Bool 
todosIguales [] = True 
todosIguales (x:xs) = (pertenece x xs) && not(todosIguales xs)

--Inciso c 
todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [] = True
todosDistintos (x:xs) = not(pertenece x xs) && (todosDistintos xs)

--Inciso d 
hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos ls = not (todosDistintos ls)

--Inciso e 
quitar :: (Eq t) => t -> [t] -> [t]
quitar x ls | ls == [] = []
            | x == head ls = tail ls 
            | otherwise = [head ls] ++ quitar x (tail ls)

--Inciso f 
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x ls | ls == [] = []
                 | x == head ls = quitarTodos x (tail ls)
                 | otherwise = [head ls] ++ quitarTodos x (tail ls)

--Inciso g 
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos xs | xs == [] = []
                     | todosDistintos xs = xs
                     | pertenece (head xs) (tail xs) = [head xs] ++ eliminarRepetidos (quitarTodos (head xs) (xs))  
                     | otherwise = [head xs] ++ eliminarRepetidos (tail xs)

--Inciso h

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ls | xs == [] && ls == [] = True  
                      | longitud (eliminarRepetidos xs) /= longitud (eliminarRepetidos ls) = False 
                      | not (pertenece (head xs) ls) = False 
                      | otherwise = mismosElementos (tail xs) (tail ls)   

--Inciso i 

capicua :: (Eq t) => [t] -> Bool 
capicua xs | xs == [] = True 
           | longitud xs == 1 = True
           | head xs /= last xs = False
           | otherwise = capicua (init (tail xs))


--Ejercicio 3 

--Inciso a 
sumatoria :: [Integer] -> Integer 
sumatoria [] = 0 
sumatoria (x:xs) = x + sumatoria xs 

--Inciso b 
productoria :: [Integer] -> Integer 
productoria [] = 1 
productoria (x:xs) = x*(productoria xs)

--Inciso c 
maximo :: [Integer] -> Integer 
maximo [] = 0
maximo (x:xs) = max x (maximo xs)

--Inciso d 
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n (x:xs) | xs == [] = [] 
                | otherwise = [(x) + n] ++ sumarN n (xs)

--Inciso e
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN (x) (x:xs) 

--Inciso f
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (last (x:xs)) xs

--Inciso g
pares :: [Integer] -> [Integer]
pares (x:xs) | xs == [] = []
             | par (x) = [x] ++ pares (xs)
             | otherwise = pares (xs)
              where par k = if mod k 2 == 0 then True else False 

--Inciso h 
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n (x:xs) | xs == [] = []
                  | divide (x) n = [x] ++ multiplosDeN n (xs)
                  | otherwise = multiplosDeN n (xs)
                  where divide k l = if mod k l == 0 then True else False 

--Inciso i 
ordenar :: [Integer] -> [Integer]
ordenar xs | xs == [] = []
           | otherwise = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

--Ejercicio 4 
sacarBlancosRepetidos :: String -> String
sacarBlancosRepetidos s | todosDistintos s = s 
                        
--Ejercicio 5 

--Inciso a
nat2bin :: Integer -> [Integer]
nat2bin n | n == 1 = [1]
          | otherwise = nat2bin (div n 2) ++ [mod n 2]  

--Inciso b
--Chequear porque esto tira non-exhaustive patterns 
bin2nat :: [Integer] -> Integer
bin2nat (x:xs) | (x:xs) == [] = 0 
               | x == 1 = 2^(longitud (x:xs) - 1) + bin2nat xs 
               | otherwise = bin2nat xs

bin2nat' :: [Integer] -> Integer
bin2nat' xs  | xs == [] = 0 
             | head xs == 1 = 2^(longitud xs - 1) + bin2nat' (tail xs)
             | otherwise = bin2nat' (tail xs)

--Inciso c 

nat2hex :: Integer -> [Char]
nat2hex n | n == 0 = []
          | otherwise = nat2hex (div n 16) ++ [hexa!!(fromIntegral(mod n 16))]
         where hexa = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']

--Inciso d 

--Definimos la sumatoria:
suma :: (Num t) => [t] -> t
suma [] = 0 
suma (x:xs) = x + suma xs 


sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada xs = [suma(take l xs) | l <- [1,2..longitud(xs)]]

--Inciso e 



