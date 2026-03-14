-- Importamos la función esPar desde la práctica 2
import Practica2 (esPar)

-- | Tipo de dato que representa las materias disponibles en el plan de estudios.
-- Cada constructor corresponde a una materia específica.
data Materia = AlgebraSuperior
             | EstructurasDiscretas
             | InglesI
             | IntroduccionCC
             | MatematicasAplicadas
             deriving (Show, Eq)  -- Permite mostrar la materia como texto y compararlas

-- | Devuelve una lista de materias según la cantidad de créditos proporcionada.
-- Por ejemplo:
-- creditos 4  => [InglesI]
-- creditos 12 => [IntroduccionCC, MatematicasAplicadas]
-- creditos 10 => [EstructurasDiscretas, AlgebraSuperior]
-- Cualquier otro número de créditos devuelve una lista vacía.
creditos :: Int -> [Materia]
creditos n
    | n == 4  = [InglesI]
    | n == 12 = [IntroduccionCC, MatematicasAplicadas]
    | n == 10 = [EstructurasDiscretas, AlgebraSuperior]
    | otherwise = []

-- | Devuelve únicamente los números pares de una lista.
-- Utiliza la función esPar importada de Practica2.
-- Ejemplo: soloPares [1,2,3,4] => [2,4]
soloPares :: [Int] -> [Int]
soloPares xs = [x | x <- xs, esPar x]

-- | Cuenta cuántos números negativos hay en una lista.
-- Ejemplo: negativos [-1,2,-3,4] => 2
negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]

-- | Devuelve los números primos de una lista.
-- Ejemplo: primos [1,2,3,4,5] => [2,3,5]
primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]

-- | Determina si un número es primo.
-- Un número primo es mayor que 1 y solo divisible entre 1 y él mismo.
-- Ejemplo: esPrimo 7 => True, esPrimo 8 => False
esPrimo :: Int -> Bool
esPrimo n =
    if n < 2 then False
    else length [x | x <- [1..n], mod n x == 0] == 2

-- | Calcula el máximo común divisor (MCD) de dos números
-- usando el algoritmo de Euclides.
-- Ejemplo: mcd' 12 18 => 6
mcd' :: Int -> Int -> Int
mcd' a b =
    if b == 0
    then a
    else mcd' b (mod a b)

-- | Devuelve todos los números menores que n que son coprimos con n.
-- Dos números son coprimos si su MCD es 1.
-- Ejemplo: coprimos 10 => [1,3,7,9]
coprimos :: Int -> [Int]
coprimos n = [x | x <- [1..n-1], mcd' n x == 1]

