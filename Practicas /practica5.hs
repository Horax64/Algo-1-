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
sumarN n xs | xs == [] = [] 
            | otherwise = [(head xs) + n] ++ sumarN n (tail xs)

--Inciso e
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero xs = sumarN (head xs) xs 

--Inciso f
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (last xs) xs

--Inciso g
pares :: [Integer] -> [Integer]
pares xs | xs == [] = []
         | par (head xs) = [head xs] ++ pares (tail xs)
         | otherwise = pares (tail xs)
         where par k = if mod k 2 == 0 then True else False 

--Inciso h 
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n xs | xs == [] = []
                  | divide (head xs) n = [head xs] ++ multiplosDeN n (tail xs)
                  | otherwise = multiplosDeN n (tail xs)
                  where divide k l = if mod k l == 0 then True else False 

--Inciso i 
ordenar :: [Integer] -> [Integer]
ordenar xs | xs == [] = []
           | otherwise = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

--Ejercicio 4 
sacarBlancosRepetidos :: String -> String
sacarBlancosRepetidos s | todosDistintos s = s 
                        | 
