module Proyecto where

-- | Tipo de dato que representa un árbol binario de Huffman.
-- Una hoja almacena un carácter junto con la cantidad de veces
-- que aparece dentro de la cadena original.
-- Un nodo interno almacena el peso total del subárbol y sus hijos.
data Huffman
    = Hoja Char Int
    | Nodo Int Huffman Huffman
    deriving Show


-- | Devuelve el peso asociado a un nodo del árbol.
-- Si el nodo es una hoja, regresa la frecuencia del carácter.
-- Si es un nodo interno, regresa la suma total de frecuencias
-- de todos los símbolos contenidos en su subárbol.
peso :: Huffman -> Int
peso (Hoja _ n) = n
peso (Nodo n _ _) = n


-- | Cuenta cuántas veces aparece un carácter específico
-- dentro de una cadena de texto.
-- Recorre la cadena de manera recursiva y suma 1 cada vez
-- que encuentra una coincidencia.
--
-- Ejemplo:
-- contar 'a' "banana" = 3
contar :: Char -> String -> Int
contar _ [] = 0
contar c (x:xs)
    | c == x = 1 + contar c xs
    | otherwise = contar c xs


-- | Elimina caracteres repetidos conservando únicamente
-- una aparición de cada símbolo.
-- Esto es útil para obtener el conjunto base de símbolos
-- sobre el cual se calcularán frecuencias.
--
-- Ejemplo:
-- unicos "banana" = "ban"
unicos :: String -> String
unicos [] = []
unicos (x:xs)
    | pertenece x xs = unicos xs
    | otherwise = x : unicos xs


-- | Determina si un carácter pertenece a una cadena.
-- Devuelve True si encuentra el símbolo y False en caso contrario.
--
-- Esta función es auxiliar para eliminar repeticiones.
pertenece :: Char -> String -> Bool
pertenece _ [] = False
pertenece c (x:xs)
    | c == x = True
    | otherwise = pertenece c xs


-- | Calcula la frecuencia de aparición de cada símbolo
-- y devuelve la lista ordenada de forma descendente.
--
-- Esta información es la base para construir el árbol Huffman.
frecuencias :: String -> [(Char, Int)]
frecuencias xs = ordenar (freqAux (unicos xs) xs)


-- | Función auxiliar que genera pares
-- (carácter, frecuencia) para cada símbolo único.
freqAux :: String -> String -> [(Char, Int)]
freqAux [] _ = []
freqAux (x:xs) texto =
    (x, contar x texto) : freqAux xs texto


-- | Ordena una lista de frecuencias de mayor a menor
-- utilizando inserción recursiva.
ordenar :: [(Char,Int)] -> [(Char,Int)]
ordenar [] = []
ordenar (x:xs) =
    insertar x (ordenar xs)


-- | Inserta un elemento en una lista manteniendo
-- el orden descendente por frecuencia.
insertar :: (Char,Int) -> [(Char,Int)] -> [(Char,Int)]
insertar x [] = [x]
insertar x (y:ys)
    | snd x > snd y = x:y:ys
    | otherwise = y : insertar x ys

-- Ordena una lista de árboles Huffman de menor a mayor
-- según su peso. Esto es importante porque el algoritmo
-- siempre debe combinar primero los dos nodos menos frecuentes
-- para garantizar una codificación óptima.
ordenarArboles :: [Huffman] -> [Huffman]
ordenarArboles [] = []
ordenarArboles (x:xs) =
    insertarArbol x (ordenarArboles xs)

-- Construye recursivamente el árbol de Huffman.
-- Toma los dos árboles con menor peso, los combina
-- en un nuevo nodo cuya frecuencia es la suma de ambos
-- y vuelve a insertarlo ordenadamente hasta que solo
-- queda un árbol final.
construir :: [Huffman] -> Huffman
construir [x] = x
construir (x:y:xs) =
    construir (insertarArbol nuevo xs)
    where nuevo = Nodo (peso x + peso y) x y

-- Genera el árbol de Huffman completo para una cadena.
-- Primero calcula las frecuencias de cada carácter,
-- luego las transforma en hojas, las ordena y finalmente
-- construye el árbol completo.
arbolHuffman :: String -> Huffman
arbolHuffman xs =
    construir (ordenarArboles (hacerHojas (frecuencias xs)))



-- Busca el código binario asociado a un carácter dentro
-- del árbol de Huffman. Si avanza a la izquierda agrega
-- un 0 y si avanza a la derecha agrega un 1 hasta llegar
-- a la hoja correspondiente.
codigo :: Char -> Huffman -> String
codigo c (Hoja x _)
    | c == x = ""
    | otherwise = error "No encontrado"

codigo c (Nodo _ izq der)
    | existe c izq = '0' : codigo c izq
    | otherwise = '1' : codigo c der

-- Verifica si un carácter existe dentro de un árbol.
-- Esto permite decidir qué rama recorrer durante la
-- búsqueda del código binario correspondiente.
existe :: Char -> Huffman -> Bool
existe c (Hoja x _) = c == x
existe c (Nodo _ izq der) =
    existe c izq || existe c der

-- Convierte una cadena completa a su representación
-- binaria usando el árbol de Huffman. Codifica cada
-- carácter individual y concatena todos los resultados.
codificar :: String -> Huffman -> String
codificar [] _ = []
codificar (x:xs) arbol =
    codigo x arbol ++ codificar xs arbol

-- Realiza la compresión completa de una cadena.
-- Primero construye automáticamente el árbol de Huffman
-- y después utiliza dicho árbol para codificar el texto.
comprimir :: String -> String
comprimir xs =
    codificar xs (arbolHuffman xs)



-- Calcula el tamaño original del texto suponiendo
-- codificación ASCII estándar de 8 bits por carácter.
bitsOriginal :: String -> Int
bitsOriginal [] = 0
bitsOriginal (_:xs) = 8 + bitsOriginal xs

-- Calcula el número total de bits de una cadena binaria
-- comprimida. Cada símbolo binario ocupa un bit.
bitsComprimido :: String -> Int
bitsComprimido [] = 0
bitsComprimido (_:xs) = 1 + bitsComprimido xs

-- Calcula el porcentaje de reducción obtenido al
-- comprimir una cadena respecto a su tamaño original.
-- Un valor alto indica mejor compresión.
porcentaje :: String -> Float
porcentaje xs =
    ((fromIntegral original - fromIntegral comprimido)
    / fromIntegral original) * 100
    where
        original = bitsOriginal xs
        comprimido = bitsComprimido (comprimir xs)



-- Función auxiliar para decodificar.
-- Recorre recursivamente el árbol siguiendo los bits:
-- 0 hacia la izquierda y 1 hacia la derecha.
-- Cuando llega a una hoja reconstruye el carácter
-- y reinicia desde la raíz.
decAux :: String -> Huffman -> Huffman -> String
decAux [] _ (Hoja c _) = [c]
decAux [] _ _ = []

decAux bits raiz (Hoja c _) =
    c : decAux bits raiz raiz

decAux (b:bs) raiz (Nodo _ izq der)
    | b == '0' = decAux bs raiz izq
    | otherwise = decAux bs raiz der

-- Decodifica una cadena binaria comprimida usando
-- el árbol de Huffman original y reconstruye
-- exactamente el texto inicial.
decodificar :: String -> Huffman -> String
decodificar bits arbol =
    decAux bits arbol arbol