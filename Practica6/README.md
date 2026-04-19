# Práctica 06: Árboles Binarios

## 📌 Objetivo

Implementar y manipular árboles binarios en Haskell, comprendiendo su estructura recursiva, recorridos, balanceo y construcción como árboles binarios de búsqueda (BST).

---

## ⏱️ Tiempo estimado

6–8 horas.

---

## 🌳 Tipo de dato utilizado

```haskell
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)
```

---

## 🌐 Representaciones gráficas con Mermaid

### Árbol 1

```mermaid
graph TB
    A[8] --> B[4]
    A --> C[12]
    B --> D[2]
    B --> E[6]
    C --> F[10]
    C --> G[14]
```

---

### Árbol 2

```mermaid
graph TB
    A[5] --> B[3]
    A --> C[7]
    B --> D[1]
    B --> E[4]
    C --> F[6]
    C --> G[9]
```

---

## 🌳 Representación de árboles dados

### a)

```mermaid
graph TB
    A[4] --> B[Vacio]
    A --> C[3]
    C --> D[Vacio]
    C --> E[5]
    E --> F[Vacio]
    E --> G[Vacio]
```

---

### b)

```mermaid
graph TB
    A[3] --> B[7]
    A --> C[6]
    B --> D[12]
    B --> E[Vacio]
    C --> F[11]
    C --> G[10]
```

---

### c)

```mermaid
graph TB
    A[8] --> B[6]
    A --> C[15]
    B --> D[1]
    B --> E[7]
    D --> F[Vacio]
    D --> G[4]
    G --> H[2]
```

---


❓ Preguntas teóricas
• ¿De acuerdo al ejemplo de foldl o foldr, el árbol resultante es un BST balanceado?

No necesariamente.

El uso de foldl o foldr para construir un árbol binario de búsqueda depende del orden de los elementos en la lista. Si los elementos se insertan en un orden desfavorable (por ejemplo, una lista ya ordenada), el árbol resultante se vuelve degenerado (similar a una lista), por lo que no estará balanceado.

En general, ni foldl ni foldr garantizan por sí mismos que el árbol sea balanceado.

• ¿Cuál sería la idea para que foldl o foldr nos ayuden a insertar BST balanceados?

Conceptualmente, la clave no está en foldl o foldr, sino en el orden en el que se insertan los elementos.

Para obtener un árbol balanceado, se puede:

Insertar primero el elemento medio de la lista
Luego insertar recursivamente las medianas de las sublistas izquierda y derecha

Es decir, construir el árbol siguiendo una estrategia tipo “divide y vencerás”, similar a cómo se construye un árbol balanceado a partir de una lista ordenada.

• ¿Cuáles son las ventajas de foldl sobre foldr?
Es más eficiente en muchos casos cuando se trabaja con evaluación estricta
Puede usar menos memoria si se evalúa de forma estricta (foldl')
Es más natural cuando se quiere acumular resultados de izquierda a derecha
• ¿Cuáles son las ventajas de foldr sobre foldl?
Funciona mejor con listas infinitas gracias a la evaluación perezosa
Permite producir resultados parciales sin recorrer toda la lista
Es más adecuado para construir estructuras recursivas como árboles o listas
🧠 Conclusión

El balanceo de un árbol no depende de usar foldl o foldr, sino del orden en que se insertan los elementos. Ambas funciones son herramientas útiles, pero el control de la estructura del árbol requiere una estrategia adicional.

## ⚙️ Implementación

Las funciones fueron implementadas de manera recursiva respetando las restricciones de la práctica (sin uso de `foldr`, `foldl`, `maximum` o `minimum`).

Se desarrollaron funciones para:

* Recorridos del árbol (InOrden, PreOrden, PosOrden)
* Verificación de balanceo
* Construcción de árboles binarios de búsqueda (BST)

---

## 📊 Observaciones

* El comportamiento del árbol depende del orden de los elementos en la lista.
* Si la lista **no está ordenada**, el árbol puede quedar desbalanceado.
* Si la lista **está ordenada**, el árbol se degenera en una estructura lineal.
* La recursión es clave para trabajar con estructuras de tipo árbol.

---

## 📁 Estructura del proyecto

```
Practica6/
│── Practica6.hs
│── Auxiliar.hs
│── README.md
│── LICENSE
```

---

## 📜 Licencia

Se utilizó la licencia MIT, la cual permite el uso, copia y modificación del software de manera libre.

---

## 🧾 Notas adicionales

* Todas las funciones fueron documentadas.
* Se realizaron pruebas unitarias con HUnit.
* Se respetaron todos los lineamientos de la práctica.
