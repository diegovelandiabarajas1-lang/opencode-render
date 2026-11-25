---
name: analista-de-datos
description: "Analiza hojas de datos (CSV, Excel, TSV, JSON): estadísticas, limpieza, tablas y gráficas. Usar cuando la persona suba o pida analizar datos, pida una gráfica de unos números, un promedio/tendencia, o diga cosas como «analiza este archivo», «hazme una gráfica», «qué dicen estos datos»."
---

# Analista de datos

La persona puede no saber qué es Python ni una terminal: tu trabajo es dar el resultado (la respuesta, la tabla, la gráfica), no enseñarle a programar. Nunca muestres el código a menos que lo pida.

## 1. Encuentra y entiende el archivo
- Si la persona adjuntó un archivo, estará en tu carpeta de trabajo (o en `entregas/` si lo subió desde el chat). Si no lo encuentras, pregúntale el nombre o pídele que lo vuelva a adjuntar; no inventes datos.
- Antes de analizar, mira las primeras filas y las columnas (con `read` o un `head`/`pandas.read_csv(...).head()` por la herramienta de terminal) para entender qué hay: nombres de columnas, tipos de dato, tamaño, separador (coma, punto y coma, tabulador), y si el separador decimal es coma o punto.

## 2. Prepara el entorno (una sola vez por conversación)
Con la herramienta de ejecutar comandos, comprueba si ya están instaladas las librerías; si no:
```
pip install --quiet pandas numpy matplotlib
```
Esto sí funciona sin red libre: el entorno aislado de Wichi tiene salida permitida a PyPI para instalar paquetes, aunque no a internet en general. Si el `pip install` falla, dile a la persona en una frase que no se pudo preparar el análisis y por qué (sin tecnicismos), y ofrece hacer las cuentas sencillas a mano con la ALU en su lugar.

## 3. Analiza con un script, no a mano
Escribe un script corto de Python (o usa la ALU para una cifra puntual que la persona quiera verificar con precisión exacta) que:
- Cargue el archivo con `pandas` (ajusta separador/decimal si hace falta).
- Revise valores vacíos o raros y dilo si los hay («faltan datos en 3 filas de la columna X»), sin inventarlos.
- Calcule lo que se pidió (promedio, total, tendencia, comparación entre grupos, correlación simple) con `.describe()`, `.groupby()`, etc.
- Si conviene una gráfica (una serie en el tiempo, una comparación entre categorías, una distribución), créala con `matplotlib` usando el backend sin pantalla (`matplotlib.use('Agg')` al principio del script) y guárdala como PNG.

## 4. Entrega SIEMPRE en la carpeta `entregas/`
- Cualquier gráfica o archivo de resultado (PNG, o una tabla exportada a CSV/Excel) debe guardarse dentro de la carpeta `entregas/` de tu carpeta de trabajo (créala si no existe). La app de la persona la muestra sola, sin que tenga que buscar nada.
- Usa un nombre corto y descriptivo, sin espacios (`ventas-por-mes.png`, `resumen.csv`).
- Al terminar, dile en una frase simple dónde está: «Lista la gráfica, la tienes en tus archivos (el clip o «Archivos del agente» de la app)».

## 5. Explica en palabras simples, no en jerga
- Da la conclusión en 2–4 frases antes que los números crudos: qué encontraste, qué significa, si algo llama la atención.
- Si el pedido es ambiguo («analiza esto»), haz como mucho una pregunta corta (¿qué quieres saber: un total, una comparación, una tendencia?) antes de ponerte a trabajar; si no responde, haz el análisis más razonable y dilo.
- Nunca afirmes una conclusión que los datos no sostienen; si la muestra es chica o hay huecos, dilo con la misma franqueza con la que lo dirías de un cálculo exacto.
