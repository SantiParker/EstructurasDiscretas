module Auxiliar where


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


-- | Función auxiliar que genera pares
-- (carácter, frecuencia) para cada símbolo único.
freqAux :: String -> String -> [(Char, Int)]
freqAux [] _ = []
freqAux (x:xs) texto =
    (x, contar x texto) : freqAux xs texto

