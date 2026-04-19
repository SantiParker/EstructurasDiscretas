module Practica6 where

-- Definición del tipo de dato
data Arbol a = Vacio | AB a (Arbol a) (Arbol a)
    deriving (Eq, Ord, Show)

-- Tipo de recorrido
data Recorrido = InOrden | PreOrden | PosOrden
    deriving (Eq, Show)

--------------------------------------------------
-- 1. nVacios
--------------------------------------------------

nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB _ izq der) = nVacios izq + nVacios der

--------------------------------------------------
-- 2. refleja
--------------------------------------------------

refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB x izq der) = AB x (refleja der) (refleja izq)

--------------------------------------------------
-- 3. minimo (CORREGIDO)
-- Funciona para cualquier árbol, no solo BST
--------------------------------------------------

minimo :: Ord a => Arbol a -> a
minimo Vacio = error "Árbol vacío"
minimo (AB x Vacio Vacio) = x
minimo (AB x izq Vacio) = min x (minimo izq)
minimo (AB x Vacio der) = min x (minimo der)
minimo (AB x izq der) = min x (min (minimo izq) (minimo der))

--------------------------------------------------
-- 4. recorrido
--------------------------------------------------

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

altura :: Arbol a -> Int
altura Vacio = 0
altura (AB _ izq der) =
    1 + max (altura izq) (altura der)

esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB _ izq der) =
    abs (altura izq - altura der) <= 1
    && esBalanceado izq
    && esBalanceado der

--------------------------------------------------
-- 6. listaArbol (CORREGIDO)
-- Construye correctamente el BST
--------------------------------------------------

insertar :: Ord a => a -> Arbol a -> Arbol a
insertar x Vacio = AB x Vacio Vacio
insertar x (AB y izq der)
    | x < y     = AB y (insertar x izq) der
    | otherwise = AB y izq (insertar x der)

listaArbol :: Ord a => [a] -> Arbol a
listaArbol xs = construir xs Vacio

-- Función auxiliar
construir :: Ord a => [a] -> Arbol a -> Arbol a
construir [] arbol = arbol
construir (x:xs) arbol = construir xs (insertar x arbol)