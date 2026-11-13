# Introducción  

Existen diversas herramientas para el análisis de datos epigenómicos, que pueden clasificarse en dos grandes categorías:

1. **Herramientas para la línea de comandos (Command-line tools):**  
    Estas herramientas requieren conocimientos de básicos a avanzados de programación y suelen ejecutarse en entornos como Linux o servidores de alto rendimiento. 

2. **Herramientas basadas en web (Webtools):**  
    Estas plataformas no requieren conocimientos de programación y ofrecen interfaces gráficas para realizar análisis.

Ambos tipos de herramientas tienen ventajas y desventajas, dependiendo de la experiencia del usuario y los recursos disponibles. Este documento explora herramientas y estrategias para analizar datos epigenómicos, con un enfoque práctico.

---

**¿Dónde obtener datos epigenómicos?**
- **ENCODE**: Proyecto amplio que genera datos sueltos y procesados de epigenómica (ChIP-seq, DNase-seq, ATAC-seq, histona, methylation). Portal con búsqueda por experimento, tejido y factor regulador. Enlace: https://www.encodeproject.org/
- **GEO (Gene Expression Omnibus)**: Repositorio NCBI para datos de expresión y epigenética; incluye raw (FASTQ) y archivos procesados (BED, bigWig). Útil para búsquedas por estudio o palabra clave. Enlace: https://www.ncbi.nlm.nih.gov/geo/
- **GDC / Firebrowse**: Repositorio de datos genómicos de cáncer (TCGA) accesible vía GDC; Firebrowse (historicamente) facilitaba búsquedas y descargas de datos procesados. Útil para estudios epigenómicos en tumores (methylation arrays, etc.). Enlaces: https://portal.gdc.cancer.gov/  (GDC), https://firebrowse.org/


**¿Cómo sé cómo podría iniciar a analizarlos?**
 - **ENCODE uniform processing**: Pipelines estandarizados de ENCODE que generan archivos procesados (BAM, bigWig, peak BED) y métricas de calidad; ideal usar estos outputs cuando están disponibles para evitar reprocesar desde raw. Documentación y outputs en el portal de ENCODE. Enlace: https://www.encodeproject.org/pipelines/
  - **SequencENG (tutorial educativo)**: Recurso didáctico y tutoriales para análisis de secuenciación (preprocesado, alineamiento, llamadas de picos, QC). Útil para aprender y aplicar pasos básicos de pipelines. Enlace: https://education.knoweng.org/sequenceng/

**¿Dónde explorar datos sin necesidad de línea de comandos?**
- **Exploración — UCSC Genome Browser (pistas regulatorias)**: Navegador para visualizar tracks de regulación (ENCODE tracks, conservation, regulatory build). Permite cargar bigWig/bed como tracks personalizados o usar las pistas públicas para explorar señales epigenómicas en loci de interés. Enlace: https://genome.ucsc.edu/

- **UALCAN**: Plataforma para análisis de datos de expresión génica y epigenética en cáncer (incluye metilación de promotores). Permite explorar diferencias entre grupos (tumor vs. normal) y correlaciones con datos clínicos. Enlace: http://ualcan.path.uab.edu/

**¿Cómo realizar algunos análisis sin necesidad de línea de comandos?**
- **LNCBook**: Plataforma/recursos para análisis y anotación de lncRNAs (incluye datos y herramientas para explorar el rol regulador de lncRNAs, expresión y relaciones con marcas epigenéticas). Útil cuando el objetivo es relacionar señales epigenómicas con lncRNAs. Enlace: https://ngdc.cncb.ac.cn/lncbook/home

- **miRTarBase**: Base de datos de interacciones entre microRNAs y sus genes diana validadas experimentalmente. Útil para explorar cómo los microRNAs pueden estar involucrados en la regulación epigenética. Enlace: https://mirtarbase.cuhk.edu.cn/
- **MethPrimer**: Herramienta para diseñar primers específicos para análisis de metilación por bisulfito. Permite generar primers para regiones específicas y evaluar patrones de metilación. Enlace: https://methprimer.com/

**Herramientas útiles en ómicas en general**  
- **GeneCards**: Base de datos integral que proporciona información sobre genes humanos, incluyendo funciones, expresión, interacciones, variantes y asociaciones con enfermedades. Útil para obtener una visión general de un gen de interés. Enlace: https://www.genecards.org/  
- **GeneCaRNA**: Herramienta para explorar información sobre ARN no codificantes, incluyendo su expresión, regulación y posibles funciones. Útil para estudios de ARN no codificantes en contextos específicos. Enlace: https://www.genecards.org/genecarna
- **GENCODE/Ensembl**: Recurso integral para la anotación de genes y transcritos en genomas de referencia. Además de información sobre isoformas, pseudogenes, variantes y anotaciones funcionales, proporciona acceso directo a las secuencias genómicas, de transcritos y de proteínas, permitiendo su descarga y consulta para análisis bioinformáticos. Enlace: https://www.ensembl.org/

---
# 🧬 Taller: Herramientas computacionales para el análisis de un gen

**Estructura · Función · Regulación · Epigenética · Cáncer**

Escoge **un gen humano** y sigue el video. En cada paso tienes el link y lo mínimo que debes buscar. Toma **capturas de pantalla** de cada resultado: las vas a necesitar para tus diapositivas.

> 💡 Usa siempre el **símbolo oficial** del gen (ej. `TP53`, `MLH1`, `CDKN2A`) y la especie **Homo sapiens**. Ensamblaje del genoma: **hg38 / GRCh38**.

---

## Índice
1. [Información general del gen](#1-información-general-del-gen)
2. [Regiones reguladoras, PTM y mutaciones](#2-regiones-reguladoras-ptm-y-mutaciones)
3. [Isoformas y primers de expresión](#3-isoformas-y-primers-de-expresión)
4. [Red de interacciones](#4-red-de-interacciones)
5. [Marcas epigenéticas](#5-marcas-epigenéticas)
6. [Islas CpG y primers MSP](#6-islas-cpg-y-primers-msp)
7. [Metilación y expresión en cáncer](#7-metilación-y-expresión-en-cáncer)
8. [Entregable](#-entregable)

---

## 1. Información general del gen

❓ *¿Por qué este gen es interesante para ustedes? ¿Cuál es su ubicación, longitud y función? ¿Enfermedades asociadas?*

| Herramienta | Link |
|---|---|
| GeneCards | https://www.genecards.org |
| OMIM | https://www.omim.org |

**Qué hacer:**
- En **GeneCards**, busca tu gen → revisa *Aliases*, *Summaries*, *Genomic Locations* (cromosoma, coordenadas, tamaño en pb) y *Disorders*.
- En **OMIM**, busca el gen → anota fenotipos/enfermedades asociadas y su número MIM.

---

## 2. Regiones reguladoras, PTM y mutaciones

❓ *¿Cuántas regiones reguladoras (promotores/enhancers) tiene descritas? ¿Es regulado por PTM? ¿Mutaciones descritas?*

| Herramienta | Link |
|---|---|
| GeneCards (GeneHancer) | https://www.genecards.org |
| UniProt | https://www.uniprot.org |

**Qué hacer:**
- En **GeneCards** → sección *Genomics* → *Regulatory elements* (GeneHancer): cuenta promotores y enhancers.
- En **UniProt**, busca el gen (filtra *Human*, entrada **Reviewed** ⭐) → revisa:
  - *Function*
  - *PTM / Processing* (fosforilación, acetilación, ubiquitinación…)
  - *Disease & Variants* (mutaciones descritas)

---

## 3. Isoformas y primers de expresión

❓ *¿Cuántas isoformas tiene? Genere unos primers para medir su expresión.*

| Herramienta | Link |
|---|---|
| NCBI Gene | https://www.ncbi.nlm.nih.gov/gene |
| GenBank / Nucleotide | https://www.ncbi.nlm.nih.gov/nuccore |
| Primer-BLAST | https://www.ncbi.nlm.nih.gov/tools/primer-blast/ |

**Qué hacer:**
- En **NCBI Gene**, busca tu gen (Homo sapiens) → sección *mRNA and Protein(s)*: cuenta las isoformas (NM_ / NP_).
- Copia el número de acceso **NM_** de la isoforma principal.
- En **Primer-BLAST**: pega el NM_ → organismo *Homo sapiens* → activa *Primer must span an exon-exon junction* → **Get Primers**.
- Anota: secuencia Fw/Rv, Tm, %GC y tamaño del producto.

---

## 4. Red de interacciones

❓ *¿Con qué otros genes se relaciona?*

| Herramienta | Link |
|---|---|
| STRING | https://string-db.org |

**Qué hacer:**
- *Search* → *Protein by name* → tu gen → *Organism: Homo sapiens* → **Search**.
- Captura la red. Revisa la pestaña *Analysis* (enriquecimiento GO / KEGG) y anota los principales interactores.

---

## 5. Marcas epigenéticas

❓ *¿Qué marcas epigenéticas tiene asociadas y en qué regiones?*

| Herramienta | Link |
|---|---|
| UCSC Genome Browser | https://genome.ucsc.edu/cgi-bin/hgGateway |

**Qué hacer:**
- Selecciona **Human – GRCh38/hg38** → escribe tu gen → **Go**.
- Activa los tracks (en *full* o *pack*):
  - *CpG Islands*
  - *ENCODE Regulation* → *Layered H3K27Ac*, *H3K4Me1*, *H3K4Me3*
  - *DNase Clusters* / *TF Clusters*
- Identifica en qué región (promotor, cuerpo del gen, enhancer) se ubica cada marca.

---

## 6. Islas CpG y primers MSP

❓ *¿Este gen podría ser regulado por metilación del ADN? Escanear CpG en promotor y generar primers MSP.*

| Herramienta | Link |
|---|---|
| UCSC Genome Browser | https://genome.ucsc.edu/cgi-bin/hgGateway |
| MethPrimer | http://www.urogene.org/methprimer/ |

**Qué hacer:**
- En **UCSC**, ubica la región promotora (≈ −1500 a +500 pb del TSS) → *View* → *DNA* → **Get DNA** → copia la secuencia.
- En **MethPrimer**: pega la secuencia → selecciona **Pick MSP primers** → **Submit**.
- Captura el gráfico de islas CpG y anota los primers **M** (metilado) y **U** (no metilado).

---

## 7. Metilación y expresión en cáncer

❓ *¿Su metilación o expresión cambia en cáncer?*

| Herramienta | Link |
|---|---|
| UALCAN | https://ualcan.path.uab.edu |
| TCGA – GDC Data Portal | https://portal.gdc.cancer.gov |

**Qué hacer:**
- En **UALCAN** → *TCGA* → escribe tu gen → elige un tipo de cáncer → **Explore**.
- Revisa: *Expression* (tumor vs normal) y *Methylation* (metilación del promotor).
- Opcional: *Survival* (curva Kaplan-Meier).
- En **GDC Portal**, busca el gen y revisa las mutaciones más frecuentes en cáncer.

---

## 📤 Entregable

Presentación en **diapositivas** demostrando el ejercicio con tu gen. Mínimo una diapositiva por paso:

- [ ] Portada: nombre del gen y por qué lo escogiste
- [ ] 1 · Ubicación, longitud, función y enfermedades
- [ ] 2 · Regiones reguladoras, PTM y mutaciones
- [ ] 3 · Isoformas + primers de expresión (Primer-BLAST)
- [ ] 4 · Red de interacciones (STRING)
- [ ] 5 · Marcas epigenéticas (UCSC)
- [ ] 6 · Islas CpG + primers MSP (MethPrimer)
- [ ] 7 · Expresión y metilación en cáncer (UALCAN / TCGA)
- [ ] Conclusión: ¿cómo se regula tu gen?

> Incluye **capturas de pantalla** de cada herramienta y una frase con tu interpretación.

<!-- This text is completely hidden from the rendered page # Taller práctico - Primera parte: Regulación Epigenética de un Gen Implicado en Cáncer  


## Contexto 
Datos preliminares de RNA-seq en modelos PDX (Patient-Derived Xenografts) de cáncer colorrectal metastásico muestran una sobreexpresión aberrante del transcrito *LINC01482* en las metástasis hepáticas vs. el tumor primario. Datos preliminares in vitro sugieren que este lncRNA actúa como un modulador positivo de la vía de señalización TGF-$\beta$/SMAD. Se postula que su sobreexpresión reduce la E-cadherina y aumenta la expresión de Vimentina y Snail, facilitando la diseminación metastásica.

Análisis bioinformáticos preliminares de su grupo indican que este gen no presenta mutaciones driver (SNVs o Indels) en la secuencia codificante. Por lo tanto, se sospecha que su regulación epigenética podría estar alterada en el contexto tumoral.

La hipótesis de trabajo es que *LINC01482* actúa como un oncogén condicional activado por hipometilación del promotor en el contexto tumoral. Su tarea es explorar la información conocida del gen incluyendo su función, estructura y regulación y diseñar los primers para un ensayo de qMSP para evaluar su estado de metilación.

---

## 1. Caracterización funcional y regulatoria del gen  
**Objetivo:** Obtener una visión integral de la función del gen y de sus elementos reguladores conocidos.

1. Acceder a **GeneCards** (https://www.genecards.org/).  
2. Revisar:  
   - Función molecular, vías y fenotipos asociados.  
   - Patrones de expresión tisular.  
   - Implicaciones clínicas o reportes en cáncer.  
3. Explorar **GeneHancer** (integrado en GeneCards) para identificar:  
   - Enhancers asociados.  
   - Interacciones promotor–enhancer.  
   - Evidencias experimentales de regulación.

---

## 2. Exploración de elementos reguladores en el genoma  
**Objetivo:** Visualizar el contexto regulador del gen utilizando pistas genómicas de referencia.

1. Abrir el **UCSC Genome Browser** u otro navegador genómico comparable.  
2. Ubicar el locus del gen y activar las *regulatory tracks*:  
   - DNase/ATAC-seq (accesibilidad).  
   - ChIP-seq de marcadores epigenéticos (H3K27ac, H3K4me1, H3K4me3).  
   - Factores de transcripción (TF ChIP-seq).  
   - Predicciones de enhancers y promotores.  
3. Identificar islas CpG relevantes, TSS, regiones promotoras y potenciales sitios de regulación epigenética.

---

## 3. Estado del gen *LINC01482* en cáncer  
**Objetivo:** Determinar si la expresión del gen se encuentra alterada en tumores humanos.

1. Acceder a **LNCBook** (https://ngdc.cncb.ac.cn/lncbook/home).  
2. Analizar:  
    - Expresión del gen en tejido tumoral vs. normal.  
    - Perfiles de metilación en el promotor o regiones CpG asociadas.  
    - Diferencias según subtipos, estadios o características clínicas.  
3. Registrar posibles patrones consistentes con regulación epigenética aberrante.


---

## 4. Obtención de la secuencia del gen  
**Objetivo:** Descargar la secuencia genómica y transcripcional necesaria para análisis posteriores.

1. Acceder a **Ensembl** (https://www.ensembl.org/).  
2. Localizar el gen y descargar su secuencia genómica completa incluyendo 3kb *upstream*.
3. Descargar la secuencia de las primeras 4kb del gen.

---

## 5. Exploración de islas CpG y diseño de primers  
**Objetivo:** Identificar regiones candidatas para análisis de metilación y generar primers para qMSP.

1. Utilizar **MethPrimer** (https://methprimer.com/).  
2. Cargar o pegar la secuencia obtenida en el paso 4.3 o de la región CpG relevante.  
3. Realizar:  
   - Escaneo de islas CpG.  
   - Predicción de regiones susceptibles a metilación.  
   - Diseño de primers específicos para ADN bisulfitado, adecuados para qMSP.  
4. Verificar parámetros fundamentales (TM, GC%, tamaño de amplicón, especificidad).

---

## 6. Discusión  
**Objetivo:** Integrar los hallazgos para formular hipótesis epigenéticas sólidas.

- Identificar patrones regulatorios relevantes (enhancers, TSS, islas CpG, accesibilidad).  
- Interpretar si la metilación del gen podría estar asociada a su desregulación en cáncer.  
- Proponer experimentos de validación para guiar futuros estudios en modelos murinos.

---

## Cierre de la primera parte del taller  
Este ejercicio sintetiza la aplicación de herramientas bioinformáticas avanzadas para estudiar la regulación epigenética de un gen implicado en cáncer, desde la exploración funcional hasta el diseño de ensayos experimentales.
-->
