Práctica 04: Números Naturales y Recursión

Materia: Estructuras Discretas Semestre: 2026-II 

Alumno: Melgarejo Sandoval Oscar Santiago

Objetivo

El objetivo de esta práctica es implementar estructuras de datos recursivas en Haskell para representar números naturales, números enteros y estructuras tipo matrioska.
A partir de estas definiciones, se desarrollan funciones recursivas que permiten realizar conversiones, operaciones aritméticas y manipulaciones estructurales, aplicando los conceptos de recursión y definición inductiva vistos en clase.

 Tiempo requerido

El tiempo aproximado para completar la práctica fue de 4 a 6 horas, incluyendo:

Implementación de las funciones.
Pruebas en ghci.
Corrección de errores.
Redacción del README.
Organización de commits.
 Actividades realizadas

Durante la práctica se realizaron las siguientes actividades:

Conversión entre enteros y números naturales.
Implementación de potencia y factorial para naturales.
Implementación de multiplicación de enteros.
Comparación estructural de matrioskas.
Aplanado de estructuras anidadas.
Análisis comparativo entre dos implementaciones de enteros.



1. ¿Cuál es la diferencia de las operaciones implementadas en ambos archivos? ¿Como se manejan todos los casos en cada implementación?

La diferencia principal entre ambos archivos es el nivel de detalle con el que se manejan los casos de suma y resta de enteros.

En el archivo enteros.hs, las operaciones están implementadas considerando explícitamente todos los posibles casos entre números positivos, negativos y cero. Además, se utiliza la función mayorEnt para comparar magnitudes cuando los números tienen distinto signo. Esto permite decidir correctamente si el resultado debe ser positivo, negativo o cero.

Por ejemplo, cuando se suman un número positivo y uno negativo, el código verifica si sus magnitudes son iguales o cuál es mayor, para determinar si el resultado es cero o si debe llamarse a restaEnt.

En cambio, en el otro archivo (el más simple), las operaciones están definidas con menos comparaciones explícitas. Se manejan los casos básicos y luego se delega el trabajo a funciones recursivas sin una verificación detallada de magnitudes mediante una función de comparación.


2. ¿Por qué se tiene implementada la operación mayorEnt en el archivo
enteros.hs ?

La función mayorEnt es necesaria porque al trabajar con una representación estructural de los enteros (Cero, Suc, Neg), no se puede usar directamente el operador > de Haskell.

Cuando se realizan operaciones como suma o resta entre números con distinto signo, es necesario saber cuál tiene mayor magnitud para determinar el signo del resultado o si el resultado es cero.

Por ejemplo:

Si se suma un positivo y un negativo del mismo tamaño → el resultado es Cero.
Si uno tiene mayor magnitud → el resultado conserva el signo del mayor.

Para poder hacer esta decisión correctamente, se necesita comparar estructuralmente los números, y eso lo hace mayorEnt.

3. Si pudieras quedarte con una sola implementación. ¿Cuál sería? Justifica tu
respuesta.


Me quedaría con la implementación del archivo enteros.hs proporcionado en la práctica.

Aunque es más extensa, considero que es más completa porque contempla explícitamente todos los casos posibles entre números positivos, negativos y cero. Además, utiliza la función mayorEnt para comparar magnitudes, lo cual hace más claro el manejo de operaciones entre números con distinto signo.

En comparación, la implementación del archivo entero.hs del repositorio es más sencilla y directa, pero no maneja de forma tan detallada todos los casos estructurales.