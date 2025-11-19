# 🧬 Taller: Análisis de Metilación de ADN (TCGA-LUAD)

Este repositorio contiene el material práctico, código y flujos de trabajo para el taller de análisis de datos epigenéticos utilizando R y Bioconductor. Nos centraremos en datos de Adenocarcinoma de Pulmón (LUAD) provenientes del programa *The Cancer Genome Atlas* (TCGA).

## 🎯 Objetivos del Aprendizaje

Al finalizar este taller, los participantes serán capaces de realizar un flujo de trabajo completo de análisis bioinformático, incluyendo:

  * 📥 **Adquisición de Datos:** Descarga y manipulación de datos de microarreglos de metilación (Illumina 450K) específicos del proyecto TCGA-LUAD, enfocándonos exclusivamente en muestras pareadas (mismo paciente).
  * 🧬 **Anotación y Filtrado:** Identificación y selección de sondas CpG situadas estratégicamente en regiones promotoras de genes candidatos de interés.
  * ⚖️ **Análisis Comparativo:** Evaluación de diferencias de metilación entre tejido tumoral y tejido normal adyacente.
  * 📊 **Estadística y Visualización:** Ejecución de pruebas de hipótesis pertinentes y generación de visualizaciones de alto impacto (Boxplots, Heatmaps, etc.) para interpretar los resultados.

## 📂 Estructura del Repositorio

  * `Taller_análisis_datos_metilación_TCGA.qmd`: **Código fuente.** Documento Quarto con todo el análisis paso a paso.
  * `docs/`: Archivos generados para la visualización web del taller.
  * `data/`: (Ignorado en el control de versiones) Carpeta local donde se almacenan los datos crudos y procesados.

## 🚀 Instrucciones de Instalación y Uso

Debido al tamaño de los datos genómicos, este repositorio utiliza el sistema de **Releases** de GitHub para distribuir los archivos necesarios.

2.  **Descargar los Datos (Importante):**
      * Ve a la sección de releases (a la derecha de la página principal del repo).
      * Descarga el archivo comprimido de la última versión (ej. `Taller_análisis_datos_metilación_TCGA.7z`).
      * Descomprime el archivo y asegúrate de que la carpeta `data/` quede dentro de la carpeta raíz del proyecto.
3.  **Ejecutar:**
      * Abre el archivo `.Rproj` en RStudio.
      * Abre el archivo `.qmd` y ejecuta los bloques de código (Render).

## 🛠️ Requisitos Previos

  * **R** (versión 4.2 o superior)
  * **RStudio**
  * Paquetes necesarios: `TCGAbiolinks`, `SummarizedExperiment`, `tidyverse`, `knitr` (se instalan en el primer bloque del script).

## 📄 Licencia y Citación

Este material está bajo la licencia MIT. Eres libre de usarlo, compartirlo y modificarlo, siempre y cuando des el crédito correspondiente.

**Cómo citar este taller:**
> González, D. (2025). Taller: Análisis de Metilación de ADN (TCGA-LUAD). GitHub. https://github.com/dangonzalezc/Taller_analisis_datos_metilacion_TCGA