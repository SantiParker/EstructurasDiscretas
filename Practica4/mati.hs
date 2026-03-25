module Mati where

-- ============================================================
-- Definición del tipo Matrioska
--
-- Mati representa la muñeca más pequeña (sin contenido).
-- Cont m representa una matrioska que contiene otra matrioska m.
--
-- Ejemplos:
-- Mati                          -- profundidad 0
-- Cont Mati                     -- profundidad 1
-- Cont (Cont Mati)              -- profundidad 2
-- Cont (Cont (Cont Mati))       -- profundidad 3
-- ============================================================
data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)


-- ============================================================
-- Calcula la profundidad de una matrioska.
-- Cuenta cuántas veces está envuelta con el constructor Cont.
--
-- Ejemplos:
-- profundidad Mati
-- Resultado: 0
--
-- profundidad (Cont Mati)
-- Resultado: 1
--
-- profundidad (Cont (Cont Mati))
-- Resultado: 2
-- ============================================================
profundidad :: Matrioska -> Int
profundidad Mati = 0
profundidad (Cont m) = 1 + profundidad m


-- ============================================================
-- Compara dos matrioskas.
-- Devuelve True si la primera tiene mayor o igual profundidad
-- que la segunda.
--
-- Ejemplos:
-- mayorIgual (Cont Mati) Mati
-- Resultado: True
--
-- mayorIgual Mati (Cont Mati)
-- Resultado: False
--
-- mayorIgual (Cont (Cont Mati)) (Cont Mati)
-- Resultado: True
-- ============================================================
mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual m1 m2 = profundidad m1 >= profundidad m2


-- ============================================================
-- Aplana la estructura de una matrioska en una lista.
-- Devuelve una lista que contiene la matrioska completa
-- y todas las que están dentro de ella.
--
-- Ejemplos:
-- aplana Mati
-- Resultado: [Mati]
--
-- aplana (Cont Mati)
-- Resultado: [Cont Mati, Mati]
--
-- aplana (Cont (Cont Mati))
-- Resultado: [Cont (Cont Mati), Cont Mati, Mati]
-- ============================================================
aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana m@(Cont x) = m : aplana x