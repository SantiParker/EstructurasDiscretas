
# 1. ¿Cuál es la diferencia entre la compresión con pérdida y compresión sin pérdida?

La compresión de datos consiste en reducir el tamaño de un archivo utilizando distintos algoritmos. Existen dos tipos principales de compresión: con pérdida y sin pérdida.

## Compresión sin pérdida

La compresión sin pérdida permite recuperar exactamente el archivo original después de descomprimirlo. Ninguna información se elimina durante el proceso de compresión.

Este tipo de compresión es utilizado principalmente en:

* archivos de texto,
* documentos,
* programas,
* archivos ejecutables.

Ejemplos:

* ZIP
* PNG
* Huffman Coding

La codificación Huffman pertenece a esta categoría porque el mensaje original puede reconstruirse completamente.

---

## Compresión con pérdida

La compresión con pérdida elimina parte de la información considerada menos importante para reducir aún más el tamaño del archivo.

Se utiliza principalmente en:

* imágenes,
* audio,
* video.

Ejemplos:

* JPEG
* MP3
* MP4

La ventaja de este tipo de compresión es que logra tamaños mucho menores, aunque parte de la calidad original se pierde durante el proceso.



# 2. ¿Cómo se lleva a cabo la compresión de texto, imágenes, video y audio?

## Compresión de texto

La compresión de texto aprovecha la repetición de caracteres o palabras dentro del archivo. Algoritmos como Huffman asignan códigos binarios más cortos a los caracteres más frecuentes y códigos más largos a los menos frecuentes.

Por ejemplo, si una letra aparece muchas veces en un texto, se representa con menos bits para reducir el tamaño total del archivo.



## Compresión de imágenes

La compresión de imágenes elimina información redundante de colores o patrones repetidos.

Existen dos tipos principales:

* PNG → compresión sin pérdida.
* JPEG → compresión con pérdida.

JPEG reduce detalles poco perceptibles para el ojo humano con el objetivo de disminuir el tamaño de la imagen.

---

## Compresión de audio

La compresión de audio elimina sonidos o frecuencias que el oído humano percibe con menor precisión.

Formatos como:

* MP3
* AAC

utilizan modelos acústicos para conservar la mayor calidad posible usando menos espacio.

---

## Compresión de video

La compresión de video combina distintas técnicas:

* compresión de imágenes individuales,
* eliminación de cuadros repetidos,
* almacenamiento únicamente de cambios entre cuadros consecutivos.

Ejemplos:

* MP4
* H.264

Gracias a estas técnicas es posible almacenar películas y videos ocupando mucho menos espacio.

---

# 3. ¿A qué se refiere el enfoque de códigos de longitud variable?

Los códigos de longitud variable son una técnica de compresión donde no todos los símbolos utilizan la misma cantidad de bits.

En una codificación tradicional como ASCII:

* cada carácter ocupa siempre 8 bits.

En Huffman:

* los símbolos más frecuentes reciben códigos más cortos,
* los símbolos menos frecuentes reciben códigos más largos.

Ejemplo:

| Símbolo | Código |
| ------- | ------ |
| A       | 1      |
| R       | 011    |
| H       | 0011   |

Esto permite disminuir el promedio de bits utilizados para representar la información.

La principal ventaja de este enfoque es que reduce el tamaño total de los datos sin perder información, aprovechando la frecuencia de aparición de cada símbolo.


# 4. Comparación de archivos con y sin espacios

La frase utilizada fue una parte de la canción Beat It de Michael Jackson:

Show them how funky and strong is your fight

a) Archivo sin espacios

Showthemhowfunkyandstrongisyourfight

Comando utilizado:

xxd fraseSinEspacios.txt

Salida: 

00000000: 5368 6f77 7468 656d 686f 7766 756e 6b79  Showthemhowfunky
00000010: 616e 6473 7472 6f6e 6769 7379 6f75 7266  andstrongisyourf
00000020: 6967 6874         ight

Peso aproximado:

36 bytes


b) Archivo con espacios:

Show them how funky and strong is your fight

Comando utilizado:

xxd fraseConEspacios.txt

Salida:

00000000: 5368 6f77 2074 6865 6d20 686f 7720 6675  Show them how fu
00000010: 6e6b 7920 616e 6420 7374 726f 6e67 2069  nky and strong i
00000020: 7320 796f 7572 2066 6967 6874            s your fight

Peso aproximado:

44 bytes

Diferencias observadas

La diferencia principal es que los espacios también son caracteres ASCII y ocupan memoria dentro del archivo.

En hexadecimal, cada espacio se representa como:

20

# 5. Compresión de frases usando Huffman

Para probar el algoritmo de Huffman se utilizaron dos frases de la canción Beat It de Michael Jackson.

Primera frase comprimida con Huffman
Frase utilizada
Showthemhowfunkyandstrongisyourfight
Representación binaria original (ASCII)

Cada carácter ocupa 8 bits.

Fragmento inicial:

01010011 01101000 01101111 01110111

Representación completa:

01010011 01101000 01101111 01110111 01110100 01101000 01100101 01101101 01101000 01101111 01110111 01100110 01110101 01101110 01101011 01111001 01100001 01101110 01100100 01110011 01110100 01110010 01101111 01101110 01100111 01101001 01110011 01111001 01101111 01110101 01110010 01100110 01101001 01100111 01101000 01110100

Tamaño original:

288 bits
Tabla de códigos Huffman
Símbolo	Frecuencia	Código Huffman
h	4	001
o	4	011
f	2	0000
g	2	0001
i	2	0100
n	3	1101
r	2	1000
s	2	1001
t	3	1110
u	2	1010
w	2	1011
y	2	1100
k	1	01010
m	1	01011
S	1	111100
a	1	111101
d	1	111110
e	1	111111
Representación comprimida
1111000010111011111001011111110101100101101101110100001010110011011110111111011001110101000010111011010000100111001110011011010111000100000111111100011110001110
Resultados
Tipo de representación	Bits utilizados
ASCII	288 bits
Huffman	146 bits
Eficiencia obtenida

La compresión redujo el tamaño del mensaje aproximadamente un:

50.69 %

Esto demuestra que Huffman logra disminuir considerablemente la cantidad de bits necesarios al asignar códigos más pequeños a los caracteres más frecuentes.




Segunda frase comprimida con Huffman
Frase utilizada
Itdoesntmatterwhoswrongorright

Frase original:

It doesn't matter who's wrong or right
Representación binaria original (ASCII)

Cada carácter ocupa 8 bits.

Fragmento inicial:

01001001 01110100 01100100 01101111

Representación completa:
01001001 01110100 01100100 01101111 01100101 01110011 01101110 01110100 01101101 01100001 01110100 01110100 01100101 01110010 01110111 01101000 01101111 01110011 01110111 01110010 01101111 01101110 01100111 01101111 01110010 01110010 01101001 01100111 01101000 01110100

Tamaño total:

30 caracteres × 8 bits = 240 bits
Tabla de códigos Huffman
Símbolo	Frecuencia	Código Huffman
o	4	101
r	4	110
t	5	111
w	2	000
e	2	0101
g	2	0110
h	2	0111
m	1	0010
n	2	1000
s	2	1001
I	1	00110
a	1	00111
d	1	01000
i	1	01001
Representación comprimida
001101110100010101001100011100100010011111101110000111101100100001100101110110010010110011111
Resultados
Tipo de representación	Bits utilizados
ASCII	240 bits
Huffman	109 bits
Eficiencia obtenida

La compresión redujo el tamaño del mensaje aproximadamente un:

45.42 %

Esto demuestra nuevamente cómo la codificación Huffman aprovecha la frecuencia de aparición de los caracteres para disminuir la cantidad total de bits utilizados.


# 6. Árboles de Huffman para “Azarath Metrion Zinthos”

Frase utilizada:

```text id="jlwmc"
AzarathMetrionZinthos
```

(Se eliminaron espacios para simplificar el análisis).

---

# Frecuencias de los símbolos

| Símbolo | Frecuencia |
| ------- | ---------- |
| A       | 1          |
| Z       | 1          |
| a       | 2          |
| r       | 2          |
| t       | 3          |
| h       | 2          |
| M       | 1          |
| e       | 1          |
| i       | 2          |
| o       | 2          |
| n       | 2          |
| s       | 1          |

Frecuencia total:

```text id="jlwmd"
20 símbolos
```

---

# Primer árbol de Huffman

## Códigos generados

| Símbolo | Código | Longitud |
| ------- | ------ | -------- |
| t       | 00     | 2        |
| a       | 010    | 3        |
| r       | 011    | 3        |
| h       | 100    | 3        |
| i       | 1010   | 4        |
| o       | 1011   | 4        |
| n       | 1100   | 4        |
| A       | 11010  | 5        |
| Z       | 11011  | 5        |
| M       | 11100  | 5        |
| e       | 11101  | 5        |
| s       | 11110  | 5        |

---

# Tamaño promedio del código

Usando:

\bar{L}=\frac{\sum f_i l_i}{\sum f_i}

Sustituyendo:

\bar{L}=\frac{(3\cdot2)+(2\cdot3)+(2\cdot3)+(2\cdot3)+(2\cdot4)+(2\cdot4)+(2\cdot4)+(1\cdot5)+(1\cdot5)+(1\cdot5)+(1\cdot5)+(1\cdot5)}{20}

Resultado:

\bar{L}=3.65\text{ bits/símbolo}

---

# Segundo árbol de Huffman

Debido a que varios símbolos tienen la misma frecuencia, es posible construir otro árbol válido.

## Códigos generados

| Símbolo | Código | Longitud |
| ------- | ------ | -------- |
| t       | 11     | 2        |
| a       | 100    | 3        |
| r       | 101    | 3        |
| h       | 000    | 3        |
| i       | 0010   | 4        |
| o       | 0011   | 4        |
| n       | 0100   | 4        |
| A       | 01010  | 5        |
| Z       | 01011  | 5        |
| M       | 01100  | 5        |
| e       | 01101  | 5        |
| s       | 01110  | 5        |

---

# Tamaño promedio del segundo árbol

\bar{L}=\frac{73}{20}

Resultado:

\bar{L}=3.65\text{ bits/símbolo}

---

# Conclusión

Aunque los árboles tienen estructuras diferentes y códigos distintos, ambos producen el mismo tamaño promedio del código debido a que las frecuencias de los símbolos son iguales.

Esto ocurre porque Huffman garantiza una codificación óptima respecto al promedio de bits utilizados.

# 7. ¿Cómo se garantiza que este algoritmo no genere un árbol desbalanceado?

El algoritmo de Huffman construye el árbol de manera gradual combinando siempre los dos nodos con menor frecuencia. Esto provoca que los símbolos menos frecuentes queden en niveles más profundos del árbol y que los símbolos más frecuentes permanezcan cerca de la raíz.

Gracias a esta estrategia:

los caracteres más utilizados reciben códigos más cortos,
los caracteres menos frecuentes reciben códigos más largos.

Aunque el árbol puede no ser perfectamente simétrico, Huffman garantiza que el promedio total de bits utilizados sea mínimo. Por ello, el algoritmo evita generar árboles excesivamente desbalanceados que aumenten innecesariamente el tamaño promedio del código.

Además, como en cada paso se combinan únicamente los nodos de menor peso, el crecimiento del árbol ocurre de forma controlada y eficiente.

# 8. ¿Puede cambiar la altura de un árbol de acuerdo a su codificación?

Sí. La altura de un árbol de Huffman puede cambiar dependiendo de la distribución de frecuencias de los símbolos y del orden en que se combinen los nodos durante la construcción del árbol.

Cuando algunos caracteres aparecen con mucha mayor frecuencia que otros:

los símbolos frecuentes quedan cerca de la raíz,
los símbolos poco frecuentes quedan más profundos.

Esto puede provocar árboles más altos o más bajos dependiendo de la entrada.

Además, si varios símbolos tienen la misma frecuencia, existen diferentes formas válidas de combinar los nodos. Como consecuencia, pueden generarse distintos árboles de Huffman para una misma cadena de texto, cada uno con alturas diferentes.

Sin embargo, aunque la altura cambie, el algoritmo sigue garantizando una codificación eficiente y un tamaño promedio mínimo para los datos comprimidos.

# 9. ¿Por qué es necesario tener un respectivo árbol de Huffman para decodificar una cadena de texto? ¿Qué pasa si no lo tengo?

El árbol de Huffman es necesario porque la codificación utiliza códigos de longitud variable. Esto significa que cada símbolo puede ocupar una cantidad distinta de bits.

Por ejemplo:

una letra frecuente puede representarse con 2 bits,
mientras que otra menos frecuente puede necesitar 5 bits.

Durante la decodificación, el árbol permite recorrer correctamente la secuencia binaria:

si el bit es 0, se avanza a la izquierda,
si el bit es 1, se avanza a la derecha.

Cuando se llega a una hoja, se obtiene el símbolo correspondiente.

Sin el árbol de Huffman no sería posible saber:

dónde termina un código,
dónde comienza el siguiente símbolo,
qué secuencia de bits corresponde a cada carácter.

Como consecuencia, la cadena comprimida no podría interpretarse correctamente y el mensaje original no podría recuperarse. Por ello, el receptor debe tener exactamente el mismo árbol utilizado durante la compresión.


# 6. Ejemplos de codificación y decodificación

## Ejemplo 1: Obtener frecuencias

Entrada:

```haskell
frecuencias "abracadabra"
```

Salida:

```haskell
[('a',5),('r',2),('b',2),('d',1),('c',1)]
```

Este resultado muestra la frecuencia de aparición de cada símbolo ordenada de forma descendente.

---

## Ejemplo 2: Construcción del árbol de Huffman

Entrada:

```haskell
arbolHuffman "abracadabra"
```

Salida:

```haskell
Nodo 11 (Hoja 'a' 5) (Nodo 6 (Hoja 'b' 2) (Nodo 4 (Nodo 2 (Hoja 'd' 1) (Hoja 'c' 1)) (Hoja 'r' 2)))
```

---

## Ejemplo 3: Compresión

Entrada:

```haskell
comprimir "abracadabra"
```

Salida:

```haskell
"0111010110..."
```

---

## Ejemplo 4: Porcentaje de compresión

Entrada:

```haskell
porcentaje "abracadabra"
```

Salida:

```haskell
73.86364
```

---

## Ejemplo 5: Decodificación

Entrada:

```haskell
let a = arbolHuffman "abracadabra"
let c = codificar "abracadabra" a
decodificar c a
```

Salida:

```haskell
"abracadabra"
```

Esto demuestra que la cadena comprimida puede reconstruirse correctamente utilizando el árbol correspondiente.


