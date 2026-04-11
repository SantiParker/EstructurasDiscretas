Práctica 05 - Recursión sobre listas

Objetivo

Implementar funciones recursivas en Haskell para el manejo de listas y números, reforzando el uso de recursión y evitando el uso de funciones auxiliares predefinidas del lenguaje.

Funciones implementadas

* **hollerBack**: Convierte una cadena de texto a mayúsculas.
* **decimal_binario**: Convierte un número entero en su representación binaria.
* **replica**: Genera una lista con múltiples copias de un elemento.
* **recuperaElemento**: Obtiene el elemento de una lista dado un índice.
* **rota**: Rota una lista un número n de veces (considerando valores positivos y negativos).
* **extranio**: Genera la secuencia de Collatz para un número dado.

Tiempo requerido

Aproximadamente 4 horas.

---

Preguntas teóricas

¿Qué es la recursión de cola (tail recursion)?

La recursión de cola es un tipo de recursión en la cual la llamada recursiva es la última operación que se ejecuta dentro de la función. Esto significa que no hay operaciones pendientes después de la llamada recursiva.

Este tipo de recursión es importante porque puede ser optimizada por el compilador para reutilizar el espacio en memoria, evitando el crecimiento de la pila de llamadas y haciendo la ejecución más eficiente.

---

¿Cuál es la relación entre `foldr` y `foldl` con la recursión de cola?

Las funciones de orden superior `foldr` y `foldl` procesan listas de manera recursiva, pero difieren en cómo lo hacen:

* **foldl (fold left)**:
  Procesa la lista de izquierda a derecha utilizando un acumulador. Su llamada recursiva es de tipo cola, ya que la operación se aplica inmediatamente y la llamada recursiva es la última acción. Por esta razón, `foldl` está relacionado con la recursión de cola.

* **foldr (fold right)**:
  Procesa la lista de derecha a izquierda. En este caso, la llamada recursiva no es la última operación, ya que primero se evalúa la recursión y luego se aplica la función. Por ello, `foldr` no es una recursión de cola.

En resumen, `foldl` es un ejemplo de recursión de cola, mientras que `foldr` no lo es.

---

Comentarios

Se implementaron todas las funciones utilizando recursión pura y patrones sobre listas. Además, se separaron las funciones auxiliares en un módulo independiente para cumplir con los lineamientos de la práctica.


