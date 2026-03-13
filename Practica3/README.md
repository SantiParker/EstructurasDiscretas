Práctica 3: Tipos de datos y listas en Haskell

Materia: Estructuras Discretas
Semestre: 2026-II
Alumno: Melgarejo Sandoval Oscar Santiago

Objetivo de la práctica

El objetivo de esta práctica es comprender y aplicar:

El uso de clases de tipos (Num) y tipos concretos (Int).

La definición de tipos de datos propios.

El uso de listas por comprensión.

La implementación de funciones recursivas.

La modularización de código en Haskell.

La manipulación y filtrado de listas mediante funciones auxiliares.

Se busca reforzar el razonamiento matemático mediante su implementación en programación funcional.

Tiempo requerido

Tiempo estimado de realización: 4 a 6 horas, incluyendo:

Análisis del problema.

Implementación en Haskell.

Pruebas en ghci.

Redacción del README.


Diferencia entre Num e Int en Haskell

En Haskell, Num y Int no son lo mismo.

Num es una clase de tipos (typeclass).
Define los tipos que pueden comportarse como números y soportan operaciones aritméticas como +, -, *, negate, abs, etc.

Int es un tipo de dato concreto.
Representa números enteros con tamaño limitado (dependen de la arquitectura, normalmente 64 bits).

En otras palabras:

Num → una categoría de tipos numéricos.

Int → un tipo específico que pertenece a esa categoría.

Por ejemplo, Int, Integer, Float y Double son instancias de Num.


Lista infinita de todos los pares de números naturales

Se quiere generar una lista infinita que contenga todos los pares posibles 
(x,y) de números naturales.

La definición propuesta es:

allPairs = [(x, y) | x <- [0..], y <- [0..]]

¿Funciona esta definición?

No funciona correctamente para enumerar todos los pares.

Aunque la lista es infinita, el problema es el orden de generación.
Haskell evalúa la comprensión de listas recorriendo primero el generador de la izquierda.

Esto significa que:

Primero fija x = 0

Luego intenta recorrer toda la lista infinita de y

Por lo tanto genera:

(0,0), (0,1), (0,2), (0,3), ...

y nunca llega a x = 1, x = 2, etc.
Esto ocurre porque [0..] es una lista infinita.


Una forma común de generar todos los pares es recorrerlos por diagonales:

allPairs :: [(Int,Int)]
allPairs = [(x,y) | n <- [0..], x <- [0..n], let y = n - x]

Primero generamos un número n:

n = x + y

Luego generamos todos los pares cuya suma sea n.

Ejemplo de salida:

(0,0)
(0,1)
(1,0)
(0,2)
(1,1)
(2,0)
(0,3)
(1,2)
(2,1)
(3,0)
...

De esta forma todos los pares de números naturales aparecen eventualmente.