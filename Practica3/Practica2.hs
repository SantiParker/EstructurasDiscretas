module Practica2 (esPar) where

-- Si decides mantener bitwise
import Data.Bits

-- esPar verifica si un número es par
esPar :: Int -> Bool
esPar n = (n .&. 1) == 0