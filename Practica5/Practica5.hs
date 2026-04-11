-- Practica5.hs
-- Práctica 05: Recursión sobre listas
-- Facultad de Ciencias, UNAM

module Practica5 where

import Auxiliar
import Data.Char (toUpper)

-----------------------------------------------------------
-- hollerBack
-- Entrada: una cadena de caracteres (String)
-- Salida: una cadena con todos los caracteres en mayúsculas
-- Descripción: recorre la cadena carácter por carácter y
-- aplica la función toUpper de manera recursiva.
-----------------------------------------------------------
hollerBack :: String -> String
hollerBack [] = []
hollerBack (x:xs) = toUpper x : hollerBack xs


-----------------------------------------------------------
-- decimal_binario
-- Entrada: un entero no negativo
-- Salida: una lista de enteros que representa el número en binario
-- Descripción: divide recursivamente el número entre 2 y
-- construye la lista con los residuos (0 o 1).
-----------------------------------------------------------
decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario n = binAux n
  where
    binAux 0 = []
    binAux x = binAux (x `div` 2) ++ [x `mod` 2]


-----------------------------------------------------------
-- replica
-- Entrada: un entero x y un entero n
-- Salida: una lista con n repeticiones del valor x
-- Descripción: construye la lista agregando x en cada
-- llamada recursiva hasta que n es 0.
-----------------------------------------------------------
replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = x : replica x (n - 1)


-----------------------------------------------------------
-- recuperaElemento
-- Entrada: una lista y un índice entero
-- Salida: el elemento en la posición indicada
-- Descripción: recorre la lista reduciendo el índice hasta
-- llegar a 0, donde devuelve el elemento correspondiente.
-----------------------------------------------------------
recuperaElemento :: [a] -> Int -> a
recuperaElemento (x:_) 0 = x
recuperaElemento (_:xs) n = recuperaElemento xs (n - 1)


-----------------------------------------------------------
-- rota
-- Entrada: una lista y un entero n
-- Salida: la lista rotada n posiciones
-- Descripción: si n es positivo, rota la lista hacia la
-- izquierda; si es negativo, rota hacia la derecha.
-- Utiliza funciones auxiliares definidas en Auxiliar.hs.
-----------------------------------------------------------
rota :: [a] -> Int -> [a]
rota [] _ = []
rota xs 0 = xs
rota xs n
    | n > 0     = rota (rota1 xs) (n - 1)
    | otherwise = rota (rotaNeg1 xs) (n + 1)


-----------------------------------------------------------
-- extranio
-- Entrada: un entero positivo
-- Salida: una lista con la secuencia de Collatz
-- Descripción: si el número es par se divide entre 2,
-- si es impar se multiplica por 3 y se suma 1.
-- El proceso se repite hasta llegar a 1.
-----------------------------------------------------------
extranio :: Int -> [Int]
extranio 1 = [1]
extranio n
    | n `mod` 2 == 0 = n : extranio (n `div` 2)
    | otherwise      = n : extranio (3*n + 1)


