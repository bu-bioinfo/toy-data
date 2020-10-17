#' brca
#' A toy expression set object for TCGA-BRCA RNA-Seq data
#' Processed with STAR2/HTSeq and downloaded via the GDC
#' DESeq2-log2-normalized
#' Contains molecular subtypings
#' Top 1000 variable genes by median absolute deviation
#' Top 50 representative samples from each subtype
#' 
#' @format An eset with 250 samples:
#' \describe{
#'   \item{Biobase::exprs(rnaseq)}{A 1000 x 250 matrix of DESeq2-log-normalized RNA-seq counts}
#'   \item{Biobase::pData(rnaseq)}{A 250 x 81 dataframe of phenotypic information}
#'   \item{Biobase::fData(rnaseq)}{A 1000 x 3 dataframe of feature information}
#' }
"brca"