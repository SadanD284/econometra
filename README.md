# Económetra Lab

## ¿Qué es Económetra Lab?

Económetra Lab es un espacio para reunir el contenido de varios cursos de medición económica bajo un mismo principio: **el territorio no es un detalle del análisis, es la unidad de análisis.** La idea no es enseñar las técnicas en abstracto, sino anclarlas a datos y preguntas del contexto regional y nacional, de modo que el estudiante pueda contextualizarse y aprender a partir de su propia realidad económica y social.

Cada curso conserva su identidad y su programa, pero comparte una misma estructura de carpetas, una misma filosofía de trabajo con datos oficiales, y —cuando aplica— cuadernos de NotebookLM para que los estudiantes puedan consultar dudas conceptuales o de código mientras trabajan.

## Enfoque territorial

Los ejemplos, ejercicios y datos de cada curso priorizan preguntas con anclaje territorial: heterogeneidad del ingreso entre municipios, mercado laboral regional, tejido empresarial, pobreza, crédito agrario, entre otros. El objetivo es que el estudiante no aprenda una técnica desconectada de un contexto, sino que la vea aplicada a la región en la que vive y estudia, y que esa aplicación le sirva como punto de entrada para entender su propio entorno.

## Fuentes de datos

El material se construye a partir de datos abiertos de **instituciones nacionales** (DANE, Banco de la República, DNP, entre otras fuentes oficiales), trabajados de forma reproducible para que el estudiante pueda revisar, correr y modificar el análisis por sí mismo.

## Cuadernos de IA (NotebookLM)

Los cursos incluyen cuadernos de NotebookLM como apoyo para consultas — un espacio donde el estudiante puede resolver dudas conceptuales o de código de forma guiada, a partir de las fuentes propias del curso, mientras avanza en los temas.

## Cursos

| Curso | Descripción |
|---|---|
| **Estadística Descriptiva** | Tendencia central, dispersión y forma de distribuciones. |
| **Inferencia Estadística** | Estimación, intervalos de confianza y contraste de hipótesis. |
| **Econometría I** | Regresión lineal simple y múltiple, supuestos del modelo clásico y su lectura económica. |
| **Econometría II** | Extensiones del modelo lineal, variables limitadas, series de tiempo y datos panel. |

Los cuatro cursos están pensados para estudiantes de **pregrado** y toman como base el contenido establecido por el Departamento de Economía de la Universidad de Pamplona.

## Estructura del repositorio

Cada curso sigue la misma organización interna:

```
nombre-del-curso/
├── README.md          # contenido y programa del curso
├── datos/              # bases de datos e insumos (fuentes nacionales)
├── presentaciones/      # material de clase
├── software/            # scripts y cuadernos de trabajo
└── recursos/            # lecturas, guías y material complementario
```

## Créditos

Material desarrollado en el marco de los cursos de econometría y estadística del Departamento de Economía, Universidad de Pamplona.

---

> 🚧 **Iniciativa en construcción.** Este repositorio reúne, en una estructura común, los materiales de los cursos listados arriba. Todavía no es una plataforma ni una aplicación — es el punto de partida para organizar y hacer reproducible ese material a medida que se va construyendo. La prioridad inmediata es consolidar la estructura de carpetas y los README de cada curso; más adelante se evaluará si el contenido evoluciona hacia una plataforma interactiva.
