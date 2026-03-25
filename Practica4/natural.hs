module Natural where

-- ============================================================
-- Definición inductiva de los números naturales
-- Cero representa el 0
-- S n representa el sucesor de un número natural n
--
-- Ejemplo:
-- Cero                == 0
-- S Cero              == 1
-- S (S Cero)          == 2
-- ============================================================
data Natural = Cero | S Natural deriving (Eq, Show)


-- ============================================================
-- Representación del número 1 en nuestro tipo Natural
--
-- Ejemplo:
-- uno
-- Resultado: S Cero
-- ============================================================
uno :: Natural
uno = S Cero


-- ============================================================
-- Convierte un entero no negativo (Int) a Natural
-- Funciona de forma recursiva restando 1 hasta llegar a 0.
--
-- PRECONDICIÓN: El número debe ser >= 0
--
-- Ejemplos:
-- a_natural 0
-- Resultado: Cero
--
-- a_natural 3
-- Resultado: S (S (S Cero))
-- ============================================================
a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n - 1))


-- ============================================================
-- Convierte un Natural a entero (Int)
-- Cuenta cuántos sucesores tiene.
--
-- Ejemplos:
-- a_entero Cero
-- Resultado: 0
--
-- a_entero (S (S Cero))
-- Resultado: 2
-- ============================================================
a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n


-- ============================================================
-- Suma de números naturales
-- Definida recursivamente:
-- 0 + n = n
-- (S m) + n = S (m + n)
--
-- Ejemplos:
-- sumaNat (a_natural 2) (a_natural 3)
-- Resultado: S (S (S (S (S Cero))))  -- 5
--
-- a_entero (sumaNat (a_natural 2) (a_natural 3))
-- Resultado: 5
-- ============================================================
sumaNat :: Natural -> Natural -> Natural
sumaNat Cero n = n
sumaNat (S m) n = S (sumaNat m n)


-- ============================================================
-- Multiplicación de naturales como suma repetida
-- 0 * n = 0
-- (S m) * n = n + (m * n)
--
-- Ejemplos:
-- multNat (a_natural 2) (a_natural 3)
-- Resultado: S (S (S (S (S (S Cero)))))  -- 6
--
-- a_entero (multNat (a_natural 2) (a_natural 3))
-- Resultado: 6
-- ============================================================
multNat :: Natural -> Natural -> Natural
multNat Cero _ = Cero
multNat (S m) n = sumaNat n (multNat m n)


-- ============================================================
-- Potencia de números naturales
-- n^0 = 1
-- n^(S m) = n * n^m
--
-- Ejemplos:
-- potenciaNat (a_natural 2) (a_natural 3)
-- Resultado: S (S (S (S (S (S (S (S Cero)))))))  -- 8
--
-- a_entero (potenciaNat (a_natural 2) (a_natural 3))
-- Resultado: 8
-- ============================================================
potenciaNat :: Natural -> Natural -> Natural
potenciaNat _ Cero = uno
potenciaNat n (S m) = multNat n (potenciaNat n m)


-- ============================================================
-- Factorial de un número natural
-- 0! = 1
-- (S n)! = (S n) * n!
--
-- Ejemplos:
-- facNat (a_natural 3)
-- Resultado: S (S (S (S (S (S Cero)))))  -- 6
--
-- a_entero (facNat (a_natural 4))
-- Resultado: 24
-- ============================================================
facNat :: Natural -> Natural
facNat Cero = uno
facNat (S n) = multNat (S n) (facNat n)