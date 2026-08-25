# 🎨 Plantilla de presentación (Beamer)

Plantilla base en LaTeX/Beamer para las presentaciones de los cuatro cursos de Económetra Lab. Enfoque académico y formal, con una identidad visual propia (colores, portada, diapositivas de sección, pie de página) — sin depender de temas externos: solo necesitas una distribución LaTeX estándar (TeX Live, MiKTeX, TinyTeX) con `beamer` y `tikz`.

## 📄 Archivos

- `econometralab.sty` — el tema visual (colores, portada, pie de página, diapositivas de sección). No se edita para cada presentación.
- `presentacion-base.tex` — el archivo que sí se edita: contiene la estructura de ejemplo (agenda, definición, ejemplo, tabla, cierre, referencias) lista para reemplazar por el contenido real de cada unidad.
- `presentacion-base.pdf` — vista previa ya compilada, para ver el resultado sin necesidad de compilar.

## 🚀 Cómo usarla para una nueva unidad

1. Copia `econometralab.sty` y `presentacion-base.tex` a la carpeta de la unidad correspondiente en `respaldo/<curso>/`, por ejemplo:
   ```
   respaldo/estadistica-descriptiva/unidad2.tex
   respaldo/estadistica-descriptiva/econometralab.sty
   ```
2. Renombra el `.tex` copiado (p. ej. `unidad2.tex`) y edita el bloque **DATOS DE LA PRESENTACIÓN** al inicio del archivo:
   ```latex
   \setElCourse{Estadística Descriptiva}
   \setElUnit{Unidad 2 \textperiodcentered\ Aplicación de la estadística descriptiva}
   \setElProfessor{Sadan De la Cruz}
   \setElTerm{Universidad de Pamplona \textperiodcentered\ 2026-II}
   \setElCourseShort{Estadística Descriptiva}
   ```
3. Reemplaza el contenido de ejemplo (`\section`, `\begin{frame}...\end{frame}`) por el material real de la unidad. Cada `\section{...}` genera automáticamente una diapositiva separadora.
4. Compila:
   ```bash
   pdflatex unidad2.tex
   pdflatex unidad2.tex   # segunda pasada para el índice y las referencias
   ```
5. Guarda el PDF resultante junto al `.tex` en `respaldo/<curso>/`.

## 🧱 Elementos disponibles

- `\maketitle` — portada con curso, unidad, docente y periodo.
- `\section{...}` — inserta automáticamente una diapositiva de sección con fondo de color.
- `\begin{block}{Título}...\end{block}` — caja azul, ideal para definiciones.
- `\begin{alertblock}{Título}...\end{alertblock}` — caja cian, ideal para ejemplos.
- Tablas con `booktabs` (`\toprule`, `\midrule`, `\bottomrule`) para un estilo académico limpio.

## 🎨 Personalizar colores o universidad

Los colores y el nombre de la universidad/departamento están definidos al inicio de `econometralab.sty` (`elBlueDeep`, `elCyan`, etc. y `\elUniversity`, `\elDepartment`). Cámbialos ahí una sola vez si quieres ajustar la identidad visual para todos los cursos a la vez.
