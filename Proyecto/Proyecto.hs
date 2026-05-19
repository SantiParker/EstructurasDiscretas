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



-- Convertir frecuencias a hojas
hacerHojas :: [(Char,Int)] -> [Huffman]
hacerHojas [] = []
hacerHojas ((c,n):xs) =
    Hoja c n : hacerHojas xs

-- Insertar árbol ordenado por peso ascendente
insertarArbol :: Huffman -> [Huffman] -> [Huffman]
insertarArbol x [] = [x]
insertarArbol x (y:ys)
    | peso x <= peso y = x:y:ys
    | otherwise = y : insertarArbol x ys

ordenarArboles :: [Huffman] -> [Huffman]
ordenarArboles [] = []
ordenarArboles (x:xs) =
    insertarArbol x (ordenarArboles xs)

-- Construcción Huffman
construir :: [Huffman] -> Huffman
construir [x] = x
construir (x:y:xs) =
    construir (insertarArbol nuevo xs)
    where nuevo = Nodo (peso x + peso y) x y

-- Árbol de una cadena
arbolHuffman :: String -> Huffman
arbolHuffman xs =
    construir (ordenarArboles (hacerHojas (frecuencias xs)))



-- Buscar código de un caracter
codigo :: Char -> Huffman -> String
codigo c (Hoja x _)
    | c == x = ""
    | otherwise = error "No encontrado"

codigo c (Nodo _ izq der)
    | existe c izq = '0' : codigo c izq
    | otherwise = '1' : codigo c der

-- Verifica si existe
existe :: Char -> Huffman -> Bool
existe c (Hoja x _) = c == x
existe c (Nodo _ izq der) =
    existe c izq || existe c der

-- Codificar texto
codificar :: String -> Huffman -> String
codificar [] _ = []
codificar (x:xs) arbol =
    codigo x arbol ++ codificar xs arbol

-- Comprimir
comprimir :: String -> String
comprimir xs =
    codificar xs (arbolHuffman xs)