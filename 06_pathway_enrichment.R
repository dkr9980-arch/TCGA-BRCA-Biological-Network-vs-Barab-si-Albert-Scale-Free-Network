# 06 - GO and KEGG Pathway Enrichment

library(clusterProfiler)
library(org.Hs.eg.db)

hub_data <- read.csv(
  "results/networks/top_20_hub_genes.csv"
)

genes <- hub_data$Gene

gene_conversion <- bitr(
  genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

GO_result <- enrichGO(
  gene = gene_conversion$ENTREZID,
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05
)

write.csv(
  as.data.frame(GO_result),
  "results/pathways/GO_Biological_Process.csv",
  row.names = FALSE
)

KEGG_result <- enrichKEGG(
  gene = gene_conversion$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05
)

write.csv(
  as.data.frame(KEGG_result),
  "results/pathways/KEGG_pathways.csv",
  row.names = FALSE
)

cat("Pathway enrichment completed.\n")
