# 🧬 Taller: Herramientas computacionales para el análisis de la regulación epigenética de un gen

Material práctico del taller sobre **estructura, función y regulación epigenética de genes asociados a cáncer**. Tiene dos partes:

| Parte | Qué se hace | Herramientas | ¿Requiere programar? |
|---|---|---|---|
| **1. Exploración** | Caracterizar un gen de tu elección: función, regulación, isoformas, interacciones, marcas epigenéticas, islas CpG y cambios en cáncer | GeneCards, OMIM, UniProt, NCBI, Primer-BLAST, STRING, UCSC, MethPrimer, UALCAN, GDC | No (herramientas web) |
| **2. Análisis de datos** | Analizar la metilación de promotores de tus genes en datos reales de adenocarcinoma de pulmón (**TCGA-LUAD**), comparando tumor vs. tejido normal del mismo paciente | R en **Google Colab** (o RStudio local) | Sí, el código ya está escrito |

## 🎯 Objetivos de aprendizaje

Al finalizar el taller podrás:

* 🔎 **Explorar un gen** con bases de datos y herramientas web: ubicación, función, enfermedades, elementos reguladores, PTM, isoformas, redes de interacción y marcas epigenéticas.
* 🧪 **Diseñar primers** para medir expresión (Primer-BLAST) y metilación (MSP con MethPrimer).
* 📥 **Trabajar con datos públicos** de metilación (Illumina 450K) del TCGA-LUAD, solo con muestras pareadas.
* 🧬 **Filtrar sondas CpG** en regiones promotoras de los genes que tú elijas.
* ⚖️ **Comparar** la metilación entre tejido tumoral y normal con pruebas estadísticas (Wilcoxon independiente y pareado, corrección FDR).
* 📊 **Visualizar e interpretar** resultados: densidades, boxplots, PCA, heatmaps y violines.

---

## 🔎 Parte 1: Exploración de un gen (herramientas web)

Abre la guía 👉 [**Primera parte - Exploración.md**](Primera%20parte%20-%20Exploraci%C3%B3n.md)

Escoge un gen humano y sigue los 7 pasos. Cada paso tiene sus links y lo mínimo que debes buscar.

**Entregable:** diapositivas que muestren el ejercicio con tu gen (una por paso, con capturas de pantalla e interpretación).

---

## 💻 Parte 2: Análisis de metilación del TCGA-LUAD

### Opción A: Google Colab (recomendada para el taller)

No necesitas instalar nada en tu computador, solo una cuenta de Google.

<a href="https://colab.research.google.com/github/dangonzalezc/Taller_analisis_datos_metilacion_TCGA/blob/main/Taller_metilacion_TCGA_Colab.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Abrir en Colab"/></a>

1. Haz clic en **Open in Colab**.
2. Guarda tu propia copia: `Archivo → Guardar una copia en Drive`.
3. Verifica que el entorno sea **R**: `Entorno de ejecución → Cambiar tipo de entorno de ejecución`.
4. Ejecuta las celdas en orden con `Shift + Enter`. El notebook:
   - instala los pocos paquetes que faltan (binarios precompilados, < 1 min);
   - **clona este repositorio** dentro de Colab y carga los datos preprocesados (`data/LUAD_promotores_colab.rds`);
   - te pide escribir **tu propia lista de genes**.
5. Antes de cerrar, descarga tus resultados desde el panel **Archivos** 📁 (`results/`). Colab borra todo al desconectarse.

> 📦 En Colab se trabaja con datos **ya preprocesados**: β de todas las CpGs en promotores (−1500 a +500 pb del TSS, hg38). Así no hace falta instalar Bioconductor ni descargar ~2 GB del GDC. El código para reproducir todo desde cero está en el **Anexo** del notebook.

### Opción B: R local con RStudio

Para quien quiera reproducir el flujo completo (descarga desde el GDC con `TCGAbiolinks` y anotación con `sesame`):

1. Descarga el material completo desde [**Releases**](https://github.com/dangonzalezc/Taller_analisis_datos_metilacion_TCGA/releases) (`Taller_analisis_datos_metilacion_TCGA.zip`, incluye los datos crudos en `data/`) y descomprímelo.
2. Abre el archivo `.Rproj` en RStudio.
3. Abre `Taller_análisis_datos_metilación_TCGA.qmd` y ejecuta los bloques en orden. El primer bloque instala los paquetes.

**Requisitos:** R ≥ 4.2, RStudio, y los paquetes `TCGAbiolinks`, `SummarizedExperiment`, `sesame`, `sesameData` y `tidyverse`, que se instalan en el primer bloque.

> ⚠️ La instalación de Bioconductor puede fallar en algunos equipos. Si te pasa, usa la Opción A.

---

## 📂 Estructura del repositorio

| Archivo / carpeta | Contenido |
|---|---|
| `Primera parte - Exploración.md` | Guía de la parte 1: recursos web y pasos para explorar un gen |
| `Taller_metilacion_TCGA_Colab.ipynb` | **Notebook de Colab** de la parte 2 (versión del taller) |
| `Taller_análisis_datos_metilación_TCGA.qmd` | Documento Quarto con el análisis completo para R local |
| `preprocesar_datos_colab.R` | Script del instructor que genera los datos preprocesados para Colab |
| `data/LUAD_promotores_colab.rds` | Datos preprocesados que usa el notebook (matriz β de promotores + mapa sonda → gen) |
| `docs/` | Versión web (HTML) del tutorial |

Los datos crudos (`LUAD_pareados_raw.rds`, ~2 GB descomprimidos) **no están en el repositorio**. Se distribuyen en el `.zip` de Releases y en [Zenodo](https://doi.org/10.5281/zenodo.17676205).

---

## 📄 Licencia y uso académico

Este recurso didáctico está amparado por la licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional (CC BY-SA 4.0). La licencia permite a la comunidad educativa y académica usar, compartir y adaptar el material sin restricciones, siempre que se reconozca la autoría original de manera clara. Si el material se modifica y se redistribuye, también debe ser de libre acceso para la comunidad. La información de citación se presenta a continuación.

**Cómo citar:**

> González Cubides, D. M. (2025). Taller: Análisis de datos de metilación del TCGA-LUAD (v1.1). Zenodo. https://doi.org/10.5281/zenodo.17676205
