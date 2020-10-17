# Toy Datasets
A collection of toy genomics datasets for workshops, examples, and debugging.

# Install

```R
library(devtools)
devtools::install_github("bu-bioinfo/toy-data")
```

```R
library(toydata)
```

# Load Datasets

### TCGA Breast Cancer RNA-Seq

A toy expression set object for TCGA-BRCA RNA-Seq data Processed with STAR2/HTSeq and downloaded via the GDC DESeq2-log2-normalized. Contains molecular subtypings Top 1000 variable genes by median absolute deviation Top 50 representative samples from each subtype

```R
data(brca)
```