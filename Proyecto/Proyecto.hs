module Proyecto where

-- Árbol Huffman
data Huffman
    = Hoja Char Int
    | Nodo Int Huffman Huffman
    deriving Show

-- Peso
peso :: Huffman -> Int
peso (Hoja _ n) = n
peso (Nodo n _ _) = n

-- Contar apariciones
contar :: Char -> String -> Int
contar _ [] = 0
contar c (x:xs)
    | c == x = 1 + contar c xs
    | otherwise = contar c xs

-- Eliminar repeticiones
unicos :: String -> String
unicos [] = []
unicos (x:xs)
    | pertenece x xs = unicos xs
    | otherwise = x : unicos xs

pertenece :: Char -> String -> Bool
pertenece _ [] = False
pertenece c (x:xs)
    | c == x = True
    | otherwise = pertenece c xs

-- Frecuencias
frecuencias :: String -> [(Char, Int)]
frecuencias xs = ordenar (freqAux (unicos xs) xs)

freqAux :: String -> String -> [(Char, Int)]
freqAux [] _ = []
freqAux (x:xs) texto =
    (x, contar x texto) : freqAux xs texto

-- Orden descendente
ordenar :: [(Char,Int)] -> [(Char,Int)]
ordenar [] = []
ordenar (x:xs) =
    insertar x (ordenar xs)

insertar :: (Char,Int) -> [(Char,Int)] -> [(Char,Int)]
insertar x [] = [x]
insertar x (y:ys)
    | snd x > snd y = x:y:ys
    | otherwise = y : insertar x ys