
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

