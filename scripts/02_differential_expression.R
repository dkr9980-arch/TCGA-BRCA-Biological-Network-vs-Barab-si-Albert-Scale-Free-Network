# 02 - Tumor vs Normal Expression Comparison

library(dplyr)

tumor <- read.csv(
  "data/processed/tumor_processed.csv",
  row.names = 1,
  check.names = FALSE
)

normal <- read.csv(
  "data/processed/normal_processed.csv",
  row.names = 1,
  check.names = FALSE
)

tumor_mean <- rowMeans(tumor, na.rm = TRUE)
normal_mean <- rowMeans(normal, na.rm = TRUE)

log2FC <- log2((tumor_mean + 1) / (normal_mean + 1))

deg <- data.frame(
  Gene = rownames(tumor),
  Tumor_Mean = tumor_mean,
  Normal_Mean = normal_mean,
  log2FC = log2FC
)

deg_filtered <- deg %>%
  filter(abs(log2FC) >= 1) %>%
  arrange(desc(abs(log2FC)))

write.csv(deg, "results/DEG/all_gene_fold_change.csv", row.names = FALSE)
write.csv(deg_filtered, "results/DEG/filtered_DEGs.csv", row.names = FALSE)

cat("Expression comparison completed.\n")
