module Auxiliar where

-----------------------------------------------------------
-- longitud
-- Entrada: una lista de cualquier tipo
-- Salida: un entero que representa el número de elementos
-- Descripción: calcula la longitud de la lista contando
-- recursivamente cada elemento hasta llegar a la lista vacía.
-----------------------------------------------------------
longitud :: [a] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs


-----------------------------------------------------------
-- rota1
-- Entrada: una lista
-- Salida: una lista con el primer elemento al final
-- Descripción: toma el primer elemento de la lista y lo
-- coloca al final, desplazando los demás elementos una
-- posición hacia la izquierda.
-----------------------------------------------------------
rota1 :: [a] -> [a]
rota1 [] = []
rota1 (x:xs) = xs ++ [x]


-----------------------------------------------------------
-- rotaNeg1
-- Entrada: una lista
-- Salida: una lista con el último elemento al inicio
-- Descripción: mueve el último elemento de la lista al
-- principio, desplazando los demás elementos una posición
-- hacia la derecha.
-----------------------------------------------------------
rotaNeg1 :: [a] -> [a]
rotaNeg1 [] = []
rotaNeg1 xs = ultimo xs : sinUltimo xs
  where
    -------------------------------------------------------
    -- ultimo
    -- Entrada: una lista no vacía
    -- Salida: el último elemento de la lista
    -- Descripción: recorre la lista hasta encontrar el
    -- último elemento.
    -------------------------------------------------------
    ultimo [x] = x
    ultimo (_:ys) = ultimo ys

    -------------------------------------------------------
    -- sinUltimo
    -- Entrada: una lista no vacía
    -- Salida: la lista sin su último elemento
    -- Descripción: reconstruye la lista descartando el
    -- último elemento mediante recursión.
    -------------------------------------------------------
    sinUltimo [x] = []
    sinUltimo (y:ys) = y : sinUltimo ys
