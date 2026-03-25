module Entero where

-- ============================================================
-- Definición inductiva del tipo Entero
--
-- Zero representa el 0
-- Succ n representa el sucesor (n + 1)
-- Neg n representa el negativo de n
--
-- Ejemplos:
-- Zero                      == 0
-- Succ Zero                 == 1
-- Succ (Succ Zero)          == 2
-- Neg (Succ Zero)           == -1
-- Neg (Succ (Succ Zero))    == -2
-- ============================================================
data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)


-- ============================================================
-- Convierte un Entero a Int
-- Funciona recorriendo recursivamente la estructura.
--
-- Ejemplos:
-- enteroAInt Zero
-- Resultado: 0
--
-- enteroAInt (Succ (Succ Zero))
-- Resultado: 2
--
-- enteroAInt (Neg (Succ Zero))
-- Resultado: -1
-- ============================================================
enteroAInt :: Entero -> Int
enteroAInt Zero = 0
enteroAInt (Succ n) = 1 + enteroAInt n
enteroAInt (Neg n) = - enteroAInt n


-- ============================================================
-- Convierte un Int a Entero
-- Si el número es positivo, usa Succ.
-- Si es negativo, usa Neg.
-- Si es 0, devuelve Zero.
--
-- Ejemplos:
-- intAEntero 0
-- Resultado: Zero
--
-- intAEntero 3
-- Resultado: Succ (Succ (Succ Zero))
--
-- intAEntero (-2)
-- Resultado: Neg (Succ (Succ Zero))
-- ============================================================
intAEntero :: Int -> Entero
intAEntero 0 = Zero
intAEntero n
    | n > 0 = Succ (intAEntero (n - 1))
    | n < 0 = Neg (intAEntero (-n))


-- ============================================================
-- Multiplicación de enteros
-- Se realiza convirtiendo ambos valores a Int,
-- multiplicándolos y regresando el resultado como Entero.
--
-- Ejemplos:
-- multiEnt (intAEntero 2) (intAEntero 3)
-- Resultado: Succ (Succ (Succ (Succ (Succ (Succ Zero)))))  -- 6
--
-- multiEnt (intAEntero (-2)) (intAEntero 3)
-- Resultado: Neg (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))  -- -6
--
-- enteroAInt (multiEnt (intAEntero (-4)) (intAEntero (-2)))
-- Resultado: 8
-- ============================================================
multiEnt :: Entero -> Entero -> Entero
multiEnt a b = intAEntero (enteroAInt a * enteroAInt b)