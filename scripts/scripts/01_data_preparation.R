# 01 - Data Preparation
# TCGA-BRCA Network and Pathway Analysis

library(dplyr)

tumor <- read.csv(
  "data/tumor/tumor_expression.csv",
  row.names = 1,
  check.names = FALSE
)

normal <- read.csv(
  "data/normal/normal_expression.csv",
  row.names = 1,
  check.names = FALSE
)

cat("Tumor dimensions:", dim(tumor), "\n")
cat("Normal dimensions:", dim(normal), "\n")

tumor <- tumor[!duplicated(rownames(tumor)), ]
normal <- normal[!duplicated(rownames(normal)), ]

common_genes <- intersect(rownames(tumor), rownames(normal))

tumor <- tumor[common_genes, , drop = FALSE]
normal <- normal[common_genes, , drop = FALSE]

cat("Common genes:", length(common_genes), "\n")

write.csv(tumor, "data/processed/tumor_processed.csv")
write.csv(normal, "data/processed/normal_processed.csv")
