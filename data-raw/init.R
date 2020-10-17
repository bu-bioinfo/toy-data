library(usethis)

# TCGA-BRCA RNA-Seq data
rnaseq <- readRDS(Sys.getenv("TCGA-BRCA"))
rnaseq <- rnaseq[,!is.na(rnaseq$subtype_m_rna)]

# Top varying genes by median absolute deviation
rnaseq <- rnaseq[names(sort(apply(Biobase::exprs(rnaseq), 1, mad), decreasing=TRUE)[1:1000]),]

# Representative samples of the data
pick.samples <- function(eset, subtype, top=50) {
    eset <- eset[,eset$subtype_m_rna == subtype]
    pca <- prcomp(Biobase::exprs(eset), scale=TRUE)
    pca.summary <- summary(pca)
    pc1 <- pca$x[,"PC1"]
    pc1.cor <- apply(Biobase::exprs(eset), 2, function(x) abs(cor(x, pc1)))
    names(sort(pc1.cor, decreasing=TRUE))[1:top]
}

samples <- c(pick.samples(rnaseq, subtype="LumA"),
             pick.samples(rnaseq, subtype="LumB"),
             pick.samples(rnaseq, subtype="Her2"),
             pick.samples(rnaseq, subtype="Basal"),
             pick.samples(rnaseq, subtype="Normal"))

brca <- rnaseq[,samples]
usethis::use_data(brca)
