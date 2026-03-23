module Natural where

-- Definición inductiva de los números naturales
data Natural = Cero | S Natural deriving (Eq, Show)

-- Representación del número 1
uno :: Natural
uno = S Cero

-- Convierte un entero no negativo a Natural
a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n - 1))

-- Convierte Natural a Int
a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n

-- Suma de naturales
sumaNat :: Natural -> Natural -> Natural
sumaNat Cero n = n
sumaNat (S m) n = S (sumaNat m n)

-- Multiplicación como suma repetida
multNat :: Natural -> Natural -> Natural
multNat Cero _ = Cero
multNat (S m) n = sumaNat n (multNat m n)

-- Potencia de naturales
potenciaNat :: Natural -> Natural -> Natural
potenciaNat _ Cero = uno
potenciaNat n (S m) = multNat n (potenciaNat n m)

-- Factorial de un natural
facNat :: Natural -> Natural
facNat Cero = uno
facNat (S n) = multNat (S n) (facNat n)