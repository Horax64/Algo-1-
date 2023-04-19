--Ejemplos preliminares 

--Factorial de un número vía recursión 

--Con guardas:
factorial :: Integer -> Integer 
factorial n | n == 0 = 1 
            | otherwise = n*factorial(n-1)

--Con pattern matching: 
factorial2 :: Integer -> Integer
factorial2 0 = 1 
factorial2 n = n*factorial2(n-1)

--Chequear si un número es par con recursión

--Con guardas:
esPar :: Integer -> Bool 
esPar n | n == 0 = True
        | n == 1 = False 
        | otherwise = esPar(n-2)

--Con pattern matching:
esPar' :: Integer -> Bool 
esPar' 0 = True
esPar' 1 = False 
esPar' n = esPar'(n-2)

{-Otra forma (lo que hace la función es agregar una negación por cada paso recursivo que realiza. Entonces, al llegar al caso base se cuenta
cuantas acumuló, y si se trata de un número impar, tiene un número impar de not's, por lo que aplicándolas al caso base, nos queda False.-} 
esPar2 :: Integer -> Bool 
esPar2 n | n == 0 = True 
         | otherwise = not(esPar2(n-1))

--Sumar los primeros n números impares 

sumaLosPrimerosNImpares :: Integer -> Integer
sumaLosPrimerosNImpares n | n == 1 = 1 
                          | n > 1 = (2*n-1) + sumaLosPrimerosNImpares (n-1)

--Sumar los divisores de un número entero 
{-Para esto no nos alcanza con una sola función sobre la cual hacer recursión, ya que no hay una relación entre sumaDivisores n y sumaDivisores (n-1).
Para resolver dicho problema, construimos una función auxiliar, sumaDivisoresHasta, que nos devuelve la suma de todos los divisores del n menores a algún k.-}

sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta n k | k == 1 = 1 
                       | (mod n k == 0) = k + sumaDivisoresHasta n (k-1)
                       | otherwise = sumaDivisoresHasta n (k-1)

{-Hecho esto, ya podemos definir nuestra función principal-}

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresHasta n n 







--Ejercicio 10:

--Inciso a 

f1 :: Float -> Float
f1 n | n == 0 = 1 
     | otherwise = 2**n + f1 (n-1)

--Inciso b 

f2 :: Float -> Float -> Float
f2 n q | n == 0 = 1 
       | otherwise = q**n + f2 (n-1) q