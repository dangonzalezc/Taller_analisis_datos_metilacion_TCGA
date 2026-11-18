# =============================================================================
# preprocesar_datos_colab.R
# -----------------------------------------------------------------------------
# Script para el INSTRUCTOR. Se ejecuta UNA sola vez en tu computador (donde ya
# tienes TCGAbiolinks/sesame funcionando) y genera un archivo liviano que los
# estudiantes descargan en Colab sin instalar Bioconductor.
#
# Entrada : data/LUAD_pareados_raw.rds  (SummarizedExperiment del paso 2.1)
# Salida  : data/LUAD_promotores_colab.rds
#           lista con:
#             $beta  -> matriz β (CpGs en promotor de TODOS los genes x muestras)
#             $mapa  -> data.frame probe | gene (una fila por par sonda-gen)
#             $info  -> metadatos del preprocesamiento
#
# Luego sube LUAD_promotores_colab.rds como asset de un nuevo Release en GitHub
# (ej. v1.2) y pega la URL en la celda de descarga del notebook.
# =============================================================================

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("SummarizedExperiment", "GenomicRanges"), ask = FALSE, update = FALSE)
BiocManager::install("GenomeInfoDb", ask = FALSE, update = FALSE)
BiocManager::install("remotes", ask = FALSE, update = FALSE)
BiocManager::install("BioinformaticsFMRP/TCGAbiolinksGUI.data", ask = FALSE, update = FALSE)
#BiocManager::install("BioinformaticsFMRP/TCGAbiolinks", ask = FALSE, update = FALSE)
BiocManager::install(c("sesame", "sesameData", "BiocParallel"), ask = FALSE, update = FALSE)

suppressPackageStartupMessages({
  library(SummarizedExperiment)
  library(GenomicRanges)
  library(sesame)
  library(sesameData)
})

# --- 1. Datos TCGA-LUAD pareados -------------------------------------------
setwd("./Taller_analisis_datos_metilacion_TCGA")
luad_data <- readRDS("data/LUAD_pareados_raw.rds")

beta_total <- assay(luad_data)
cat("Matriz completa:", nrow(beta_total), "CpGs x", ncol(beta_total), "muestras\n")

# --- 2. Promotores de todos los genes (misma definición que el tutorial) ----
# sesameData_getProbesByGene(..., promoter = TRUE) usa una ventana de
# 1500 pb río arriba y 500 pb río abajo del TSS. Aquí la replicamos para
# TODOS los genes y guardamos además el nombre del gen de cada sonda.
sesameDataCache(c("genomeInfo.hg38", "HM450.address"))

UPSTREAM   <- 1500
DOWNSTREAM <- 500

txns   <- sesameData_getTxnGRanges("hg38")
prom   <- promoters(txns, upstream = UPSTREAM, downstream = DOWNSTREAM)
probes <- sesameData_getManifestGRanges("HM450", genome = "hg38")

hits <- findOverlaps(probes, prom, ignore.strand = TRUE)
mapa <- data.frame(
  probe = names(probes)[queryHits(hits)],
  gene  = mcols(prom)$gene_name[subjectHits(hits)],
  stringsAsFactors = FALSE
)
mapa <- unique(mapa[!is.na(mapa$gene) & mapa$gene != "", ])

# Solo sondas presentes en la matriz de TCGA
mapa <- mapa[mapa$probe %in% rownames(beta_total), ]
cat("Pares sonda-gen en promotor:", nrow(mapa), "\n")
cat("Genes con al menos una sonda:", length(unique(mapa$gene)), "\n")

# --- 3. Verificación contra el resultado original del tutorial -------------
# Las sondas de los 10 genes del tutorial deberían coincidir con
# sondas_promotor.rds (si hay diferencias pequeñas, revisa UPSTREAM/DOWNSTREAM)
if (file.exists("data/sondas_promotor.rds")) {
  sondas_orig <- readRDS("data/sondas_promotor.rds")
  for (g in names(sondas_orig)) {
    orig  <- names(sondas_orig[[g]])
    nuevo <- mapa$probe[mapa$gene == g]
    cat(sprintf("%-8s original: %3d | nuevo: %3d | idénticas: %s\n",
                g, length(orig), length(nuevo), setequal(orig, nuevo)))
  }
}

# --- 4. Matriz reducida y guardado ------------------------------------------
beta_prom <- beta_total[unique(mapa$probe), ]
beta_prom <- round(beta_prom, 4)   # reduce el tamaño del archivo sin perder información útil

datos_colab <- list(
  beta = beta_prom,
  mapa = mapa,
  info = list(
    proyecto   = "TCGA-LUAD",
    plataforma = "Illumina HumanMethylation450",
    genoma     = "hg38",
    ventana    = paste0("-", UPSTREAM, "/+", DOWNSTREAM, " pb del TSS"),
    fecha      = Sys.Date()
  )
)

saveRDS(datos_colab, "data/LUAD_promotores_colab.rds", compress = "xz")
cat("Archivo guardado: data/LUAD_promotores_colab.rds (",
    round(file.size("data/LUAD_promotores_colab.rds") / 1e6, 1), "MB )\n")
