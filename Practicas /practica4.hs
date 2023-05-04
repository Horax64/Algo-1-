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


--Función para expresar una sumatoria doble: 

sumatoriaInterna :: Integer -> Integer -> Integer
sumatoriaInterna i 1 = i
sumatoriaInterna i m = i^m + sumatoriaInterna i (m-1)

sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble 1 m = (sumatoriaInterna m 1) 
sumatoriaDoble n m = (sumatoriaInterna n m) + sumatoriaDoble (n-1) m

--Guía de ejercicios: 

--Ejercicio 1
fibonacci :: Integer -> Integer 
fibonacci 0 = 0 
fibonacci 1 = 1 
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

--Ejercicio 2 (desarrollado para que cumpla la especificación)
parteEntera :: Float -> Integer 
parteEntera n | n < 1 && n >= 0 = 0
              | n < 0 && n > (-1) = -1
              | n >= 1 = parteEntera (n-1) + 1
              | otherwise = parteEntera (n+1) - 1
         
--Ejercicio 3

absoluto :: Integer -> Integer 
absoluto n = if n < 0 then -n else n 

esDivisible :: Integer -> Integer -> Bool 
esDivisible n m | n == 0 = True
                | absoluto n < absoluto m = False     
                | n < 0 || m < 0 =  esDivisible (absoluto n) (absoluto m)
                | otherwise = esDivisible (n-m) m

--Ejercicio 4
sumaImpares :: Integer -> Integer 
sumaImpares 1 = 1 
sumaImpares n = (2*n-1) + sumaImpares (n-1)

--Ejercicio 5 
medioFactorial :: Integer -> Integer 
medioFactorial 0 = 1
medioFactorial (-1) = 1
medioFactorial n = n*medioFactorial(n-2)

--Ejercicio 6
sumaDigitos :: Integer -> Integer 
sumaDigitos n | n == 0 = 0
              | otherwise = (mod n 10) + sumaDigitos (div n 10)

--Ejercicio 7 
todosDigitosIguales :: Integer -> Bool 
todosDigitosIguales n | n < 10 = True  
                      | (mod n 10) /= (mod (div n 10) 10) = False
                      | otherwise = todosDigitosIguales (div n 10)

--Ejercicio 8 
cantDigitos :: Integer -> Integer 
cantDigitos n | n == 0 = 0 
              | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer 
iesimoDigito n i = mod (div n (10^(cantDigitos n - i))) 10

--Ejercicio 9
capAux :: Integer -> Integer 
capAux n = n - (iesimoDigito n 1)*(10^(cantDigitos n - 1))

esCapicua :: Integer -> Bool 
esCapicua n | n < 10 = True
            | iesimoDigito n 1 /= iesimoDigito n (cantDigitos n) = False
            | otherwise = esCapicua (mod (capAux n) 10)

--Ejercicio 10

--Inciso a 

f1 :: Integer -> Integer
f1 n | n == 0 = 1 
     | otherwise = 2^n + f1 (n-1)

--Inciso b 

f2 :: Integer -> Float -> Float
f2 n q | n == 0 = 1 
       | otherwise = q**(fromIntegral n) + f2 (n-1) q

--Inciso c 

f3 :: Integer -> Float -> Float
f3 n q = f2 (2*n) q

--Inciso d
f4 :: Integer -> Float -> Float
f4 n q = (f3 n q) - (f2 (n-1) q)

--Ejercicio 11 

--Inciso a

eAprox :: Integer -> Float
eAprox 0 = 1 
eAprox n = (1/(fromIntegral(factorial n))) + eAprox (n-1)

--Inciso b 

e :: Float 
e = eAprox 10

--Ejercicio 12

sucesion :: Integer -> Float
sucesion 1 = 2 
sucesion n = 2 + (1/(sucesion(n-1)))

raizDe2Aprox :: Integer -> Float 
raizDe2Aprox n = sucesion n - 1

--Ejercicio 13
--Ya está hecho más arriba

--Ejercicio 14 

sumatoriaAdentro :: Integer -> Integer -> Integer -> Integer
sumatoriaAdentro q i 1 = q^(i+1)
sumatoriaAdentro q i j = q^(i+j) + sumatoriaAdentro q i (j-1)

sumatoriaPotencias :: Integer -> Integer -> Integer -> Integer
sumatoriaPotencias q 1 b = sumatoriaAdentro q 1 b 
sumatoriaPotencias q n m = sumatoriaAdentro q n m + sumatoriaAdentro q (n-1) m

--Ejercicio 15 

sumaInterna :: Integer -> Integer -> Float 
sumaInterna i 1 = fromIntegral i
sumaInterna i j = (fromIntegral i / fromIntegral j) + sumaInterna i (j-1)

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 m = sumaInterna 1 m
sumaRacionales n m = sumaInterna n m + sumaInterna (n-1) m 

--Ejercicio 16 

--Inciso a 
menorDivisor :: Integer -> Integer
menorDivisor n | min n (menorDivisorAux n (n-1)) 


menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux x y | maximoDivisorHasta x y 

maximoDivisorHasta :: Integer -> Integer -> Integer 
maximoDivisorHasta n k | k == 1 = 1 
                       | esDivisible n k = k
                       | otherwise = maximoDivisorHasta n (k-1)

--Ejercicio 18
--Funcion auxiliar 
par :: Integer -> Bool
par a = mod a 2 == 0


mayorDigitoPar :: Integer -> Integer 
mayorDigitoPar n | n == 0 = -1
                 | par (ultimo) = max (ultimo) (mayorDigitoPar (resto))
                 | otherwise = mayorDigitoPar (resto)
                 where ultimo  = mod n 10 
                       resto   = div n 10  

--Ejercicio 19

