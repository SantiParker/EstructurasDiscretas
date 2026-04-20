module Practica6 where

-- Definición del tipo de dato
-- Un árbol puede estar vacío o tener un valor con subárbol izquierdo y derecho
data Arbol a = Vacio | AB a (Arbol a) (Arbol a)
    deriving (Eq, Ord, Show)

-- Tipo de recorrido para el árbol
data Recorrido = InOrden | PreOrden | PosOrden
    deriving (Eq, Show)

--------------------------------------------------
-- 1. nVacios
--------------------------------------------------

-- nVacios cuenta el número de nodos vacíos en un árbol
-- Caso base: un árbol vacío cuenta como 1
-- Ejemplo:
-- ghci> nVacios (AB 4 Vacio (AB 3 Vacio Vacio))
-- 3
nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB _ izq der) = nVacios izq + nVacios der

--------------------------------------------------
-- 2. refleja
--------------------------------------------------

-- refleja intercambia recursivamente los subárboles izquierdo y derecho
-- Ejemplo:
-- ghci> refleja (AB 4 Vacio (AB 3 Vacio Vacio))
-- AB 4 (AB 3 Vacio Vacio) Vacio
refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB x izq der) = AB x (refleja der) (refleja izq)

--------------------------------------------------
-- 3. minimo
--------------------------------------------------

-- minimo obtiene el valor mínimo en todo el árbol
-- No asume que el árbol sea BST
-- Ejemplo:
-- ghci> minimo (AB 4 Vacio (AB 3 Vacio Vacio))
-- 3
minimo :: Ord a => Arbol a -> a
minimo Vacio = error "Árbol vacío"
minimo (AB x Vacio Vacio) = x
minimo (AB x izq Vacio) = min x (minimo izq)
minimo (AB x Vacio der) = min x (minimo der)
minimo (AB x izq der) = min x (min (minimo izq) (minimo der))

--------------------------------------------------
-- 4. recorrido
--------------------------------------------------

-- recorrido devuelve una lista de elementos según el tipo de recorrido
-- InOrden: izquierda, raíz, derecha
-- PreOrden: raíz, izquierda, derecha
-- PosOrden: izquierda, derecha, raíz
-- Ejemplo:
-- ghci> recorrido (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) InOrden
-- [4,3,5]
recorrido :: Arbol a -> Recorrido -> [a]
recorrido Vacio _ = []

-- InOrden
recorrido (AB x izq der) InOrden =
    recorrido izq InOrden ++ [x] ++ recorrido der InOrden

-- PreOrden
recorrido (AB x izq der) PreOrden =
    [x] ++ recorrido izq PreOrden ++ recorrido der PreOrden

-- PosOrden
recorrido (AB x izq der) PosOrden =
    recorrido izq PosOrden ++ recorrido der PosOrden ++ [x]

--------------------------------------------------
-- 5. esBalanceado
--------------------------------------------------

-- altura calcula la altura de un árbol
altura :: Arbol a -> Int
altura Vacio = 0
altura (AB _ izq der) =
    1 + max (altura izq) (altura der)

-- esBalanceado verifica si la diferencia de alturas es a lo más 1
-- Ejemplo:
-- ghci> esBalanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio))
-- True
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB _ izq der) =
    abs (altura izq - altura der) <= 1
    && esBalanceado izq
    && esBalanceado der

--------------------------------------------------
-- 6. listaArbol
--------------------------------------------------

-- insertar inserta un elemento en un árbol binario de búsqueda
insertar :: Ord a => a -> Arbol a -> Arbol a
insertar x Vacio = AB x Vacio Vacio
insertar x (AB y izq der)
    | x < y     = AB y (insertar x izq) der
    | otherwise = AB y izq (insertar x der)

-- listaArbol construye un BST a partir de una lista
-- El árbol no necesariamente queda balanceado
-- Ejemplo:
-- ghci> listaArbol [5,3,7,1,9]
-- AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
listaArbol :: Ord a => [a] -> Arbol a
listaArbol xs = construir xs Vacio

-- Función auxiliar que inserta todos los elementos en el árbol
construir :: Ord a => [a] -> Arbol a -> Arbol a
construir [] arbol = arbol
construir (x:xs) arbol = construir xs (insertar x arbol)