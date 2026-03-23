module Mati where

data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

-- Cuenta la profundidad
profundidad :: Matrioska -> Int
profundidad Mati = 0
profundidad (Cont m) = 1 + profundidad m

-- Compara dos matrioskas
mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual m1 m2 = profundidad m1 >= profundidad m2

-- Aplana la estructura
aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana m@(Cont x) = m : aplana x