module Entero where

data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)

-- Convierte Entero a Int
enteroAInt :: Entero -> Int
enteroAInt Zero = 0
enteroAInt (Succ n) = 1 + enteroAInt n
enteroAInt (Neg n) = - enteroAInt n

-- Convierte Int a Entero
intAEntero :: Int -> Entero
intAEntero 0 = Zero
intAEntero n
    | n > 0 = Succ (intAEntero (n - 1))
    | n < 0 = Neg (intAEntero (-n))

-- Multiplicación de enteros
multiEnt :: Entero -> Entero -> Entero
multiEnt a b = intAEntero (enteroAInt a * enteroAInt b)