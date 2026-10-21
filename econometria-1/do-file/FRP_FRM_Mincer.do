/*===========================================================================
  
  Econometría I — Función de Regresión Poblacional (FRP) y Función de Regresión
				  Muestral (FRM)
  Sadan De la Cruz ALmanza
  Departamento de Economía
  Universidad de Pamplona
  ---------------------------------------------------------------------------
  
  Basado en: Ecuación de Mincer 
  Datos: Gran Encuesta Integrada de Hogar (GEIH) 2018 - DANE
  Archivo: Mincer.dta
	
==========================================================================*/

**# Configuración general

clear all
set more off

use "Mincer.dta", clear

label data "Ecuación de Mincer - GEIH Colombia"

**# 1. Exploración inicial de los datos

/* 
Antes de estimar cualquier modelo, siempre debemos conocer nuestra muestra. Esto nos ayuda a detectar errores, valores atípicos y entender la variabilidad de las variables que usaremos.
*/

describe // descripción de la base de datos


count // conteo de observaciones (tamaño de la muestra)

summarize ingreso esc exp, detail // estadísticas descriptivas

tab n_esc
label define nivel_lbl 1 "Primaria" 2 "Secundaria" 3 "Técnico/Tecnólogo" ///
                        4 "Universitario" 5 "Posgrado"
label values n_esc nivel_lbl
tab n_esc

**# 2. Análisis gráfica 

/* 
La visualización nos permite anticipar la forma de la relación entre ingreso y escolaridad. ¿Es lineal? ¿Hay mucha dispersión?
*/ 

graph box ingreso,  ///
    title("Distribución del ingreso laboral") ///
    ytitle("Ingreso mensual (COP)") ///
    note("Fuente: GEIH - DANE")
	
graph box exp,  ///
    title("Distribución experiencia laboral") ///
    ytitle("(meses)") ///
    note("Fuente: GEIH - DANE")

twoway scatter ingreso exp, ///
    mcolor(navy%40) msize(tiny) ///
    title("Ingreso laboral vs. Experiencia") ///
    xtitle("Experiencia (meses)") ytitle("Ingreso mensual (COP)") ///
    note("Cada punto representa un individuo en la muestra")

**# 3. Análisis de correlación

/* 
La correlación nos indica la fuerza y dirección de la relación lineal entre variables. Es un insumo clave para anticipar los signos esperados.
 
*/ 

correlate ingreso esc exp // matriz de correlación 

correlate ingreso esc exp, covariance // matriz de covarianza

**# 4. FRM y FRP

/* 

  La FRM es la estimación de la FRP usando datos de la muestra. En este caso,
  vamos a suponer que la FRP corresponde al proceso de expansión de los datos,
  y que la FRM a los datos no expandidos.
 
  FRP (teórica, no observable):
    E[ingreso | esc] = β₀ + β₁·exp
 
  FRM (estimación):
    ingreso = β̂₀ + β̂₁·exp + û

  Los parámetros β̂ son estimaciones de los parámetros poblacionales β.
  El residuo û captura todo lo que el modelo no explica.

*/ 

**## Función de Regresión Poblacional (FRP)

regress ingreso exp [pw = fex] 

* Nota: utilizamos la variable "fex" para expandir la muestra, en este caso, 
*       a modo de ejemplo, vamos a suponer que dicha expansión corresponde a la 
*       idea de "población" para ejemplificar la FRP y la FRM. 

estimates store modelo1 // guardar modelo FRP

predict yhat_m1, xb
label variable yhat_m1 "Valores ajustados - FRP"

predict uhat_m1, residuals
label variable uhat_m1 "Residuos - FRP"

summarize uhat_m1
display "Media de residuos: " %10.6f r(mean) " (debe ser ≈ 0)"


**## Función de Regresión Muestral (FRM)

regress ingreso exp 

estimates store modelo2 // guardar modelo FRM

predict yhat_m2, xb
label variable yhat_m2 "Valores ajustados - FRM"

predict uhat_m2, residuals
label variable uhat_m2 "Residuos - FRM"

summarize uhat_m2
display "Media de residuos: " %10.6f r(mean) " (debe ser ≈ 0)"

/* 
	Una vez estimada la FRM, podemos calcular:
	ŷ (valores ajustados):  lo que predice el modelo para cada obs.
	û (residuos):           la diferencia entre el valor real y el ajustado
							û = y - ŷ
	
*/ 

**# 4. Visualización de FRM y FRP

* Gráfico: valores ajustados vs observados
twoway (scatter ingreso yhat_m1, mcolor(navy%30) msize(tiny)) ///
       (line yhat_m1 yhat_m1, lcolor(red)), ///
    title("Valores observados vs. Valores ajustados") ///
    xtitle("Valores ajustados (ŷ)") ytitle("Ingreso observado") ///
    legend(label(1 "Obs. reales") label(2 "Línea 45°")) ///
    note("Un ajuste perfecto ubicaría todos los puntos sobre la línea roja")

* Gráfico de residuos: ¿hay algún patrón?
twoway scatter uhat_m1 exp, ///
    mcolor(maroon%40) msize(tiny) yline(0, lcolor(black) lpattern(dash)) ///
    title("Residuos vs. Experiencia") ///
    xtitle("Experiencia") ytitle("Residuo (û)") ///
    note("Idealmente los residuos deben distribuirse aleatoriamente alrededor de 0")

* Distribución de residuos
histogram uhat_m2, normal kdensity ///
    title("Distribución de los residuos") ///
    xtitle("Residuo (û)") ytitle("Densidad") ///
    note("La curva azul es la densidad empírica; la roja, la normal teórica")


estimates table modelo1 modelo2, ///
    b(%9.4f) se(%9.4f) stats(N r2 r2_a) ///
    title("Comparación de modelos: FRM simple vs. Mincer completa")

/*-------------------------------------------------------------------------
 En el do-file utilizamos el ejemplo de Hansen para complementar la clase magistral 
 sobre los modelos lineales de probabilidad, para comentarios y sugerencias 
 comunicarse al correo sadan.de@unipamplona.edu.co
-------------------------------------------------------------------------*/
