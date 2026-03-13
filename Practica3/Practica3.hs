import Practica2 (esPar)


-- Tipo de dato que representa las materias
data Materia = AlgebraSuperior
             | EstructurasDiscretas
             | InglesI
             | IntroduccionCC
             | MatematicasAplicadas
             deriving (Show, Eq)

-- Función que devuelve las materias según la cantidad de créditos
creditos :: Int -> [Materia]
creditos n
    | n == 4  = [InglesI]
    | n == 12 = [IntroduccionCC, MatematicasAplicadas]
    | n == 10 = [EstructurasDiscretas, AlgebraSuperior]
    | otherwise = []



-- Devuelve únicamente los números pares de una lista
soloPares :: [Int] -> [Int]
soloPares xs = [x | x <- xs, esPar x]

-- negativos cuenta cuántos números negativos hay en una lista
negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]


-- primos devuelve los números primos de una lista
primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]


-- esPrimo determina si un número es primo
esPrimo :: Int -> Bool
esPrimo n =
    if n < 2 then False
    else length [x | x <- [1..n], mod n x == 0] == 2


-- mcd' calcula el máximo común divisor usando el algoritmo de Euclides
mcd' :: Int -> Int -> Int
mcd' a b =
    if b == 0
    then a
    else mcd' b (mod a b)

-- coprimos devuelve los números coprimos con n
coprimos :: Int -> [Int]
coprimos n = [x | x <- [1..n-1], mcd' n x == 1]

