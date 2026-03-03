
import Data.Bits


-- Función sayHello
-- Recibe una cadena y devuelve "Hello, " concatenado con la cadena y un signo de exclamación

sayHello :: String -> String
sayHello nombre = "Hello, " ++ nombre ++ "!"


-- calcularPropina recibe una cuenta y calcula el 10% de propina.
calcularPropina :: Float -> Float
calcularPropina cuenta =
    cuenta * 0.10


-- menor recibe una tupla de tres enteros y devuelve el menor.
menor :: (Int, Int, Int) -> Int
menor (x,y,z) =
    if x <= y && x <= z then x
    else if y <= x && y <= z then y
    else z

-- decide recibe un booleano y dos cadenas.
-- Si el booleano es True devuelve la primera,
-- en otro caso devuelve la segunda.
decide :: Bool -> String -> String -> String
decide condicion cadena1 cadena2 =
    if condicion then cadena1 else cadena2


-- esDescendiente verifica si cuatro números están en orden descendente.
esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w =
    x > y && y > z && z > w

-- esDivisible verifica si x es divisible entre y.
esDivisible :: Int -> Int -> String
esDivisible x y =
    if y == 0 then
        "No se puede dividir entre cero"
    else if x `mod` y == 0 then
        show x ++ " es divisible por " ++ show y
    else
        show x ++ " no es divisible por " ++ show y


-- esPar verifica si un número es par usando operación bitwise.
esPar :: Int -> Bool
esPar n =
    (n .&. 1) == 0


-- hipotenusa calcula la hipotenusa de un triángulo rectángulo.
hipotenusa :: Float -> Float -> Float
hipotenusa b h =
    sqrt (b*b + h*h)

-- pendiente calcula la pendiente entre dos puntos.
pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1,y1) (x2,y2) =
    (y2 - y1) / (x2 - x1)

-- distanciaPuntos calcula la distancia entre dos puntos en el plano.
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) =
    sqrt ((x2 - x1)^2 + (y2 - y1)^2)


-- cuadrados recibe una lista de enteros y devuelve una lista
-- con el cuadrado de cada elemento.
cuadrados :: [Int] -> [Int]
cuadrados xs =
    [x*x | x <- xs]

