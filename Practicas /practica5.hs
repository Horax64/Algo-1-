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
{-
principio :: [t] -> [t]
principio 
-}

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
