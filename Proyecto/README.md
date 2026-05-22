# Proyecto Final - Codificación Huffman

## Descripción

Este proyecto implementa el algoritmo de compresión y descompresión Huffman utilizando Haskell.

El programa permite:

- Calcular frecuencias de caracteres
- Construir el árbol de Huffman
- Codificar cadenas de texto
- Comprimir cadenas
- Calcular porcentaje de compresión
- Decodificar cadenas comprimidas

---

## Estructura del proyecto

```text
Proyecto/
│── Proyecto.hs
│── Auxiliar.hs
│── README.md
```

- **Proyecto.hs**  
Contiene la lógica principal del algoritmo Huffman.

- **Auxiliar.hs**  
Contiene funciones auxiliares como conteo, eliminación de repetidos y cálculo de frecuencias.

---

## Requisitos

Tener instalado:

- GHC
- GHCi

Verificar instalación:

```bash
ghci --version
```

---

## Cómo ejecutar

Abrir terminal dentro de la carpeta del proyecto y ejecutar:

```bash
ghci
```

Cargar el proyecto:

```haskell
:l Proyecto.hs
```

Si todo funciona aparecerá:

```text
Ok, two modules loaded.
```

---

## Ejemplos de uso

### Frecuencias

```haskell
frecuencias "haskell"
```

Salida:

```haskell
[('l',2),('h',1),('a',1),('s',1),('k',1),('e',1)]
```

---

### Árbol Huffman

```haskell
arbolHuffman "banana"
```

---

### Compresión

```haskell
comprimir "banana"
```

Salida esperada:

```haskell
"..."
```

---

### Porcentaje de compresión

```haskell
porcentaje "abracadabra"
```

Salida:

```haskell
73.86364
```

---

### Decodificación

```haskell
let a = arbolHuffman "banana"
let c = codificar "banana" a
decodificar c a
```

Salida:

```haskell
"banana"
```

---

## Comentarios

El algoritmo implementado utiliza:

- Árboles binarios
- Recursión
- Codificación de longitud variable
- Compresión sin pérdida

La organización modular permite separar lógica principal y funciones auxiliares para mejorar claridad y mantenimiento.


# Observaciones

- La eficiencia depende de la distribución de frecuencias.
- Mientras más repetición exista, mejor compresión se obtiene.
- Para decodificar correctamente es indispensable conservar el árbol generado durante la compresión.
- Y se cometieron varios errores en el readme y el orden de los archivos subidos, culpa de mi PC jeje
- Posdata, si fui a ver la de Michael Jackson jajaja espero que tu tambien  y si no te la recomiendo peliculon 20/10 y god
---