# 03 - Biological Gene Correlation Network

library(igraph)

expression_data <- read.csv(
  "data/processed/tumor_processed.csv",
  row.names = 1,
  check.names = FALSE
)

gene_variance <- apply(expression_data, 1, var, na.rm = TRUE)

n_top <- min(1000, length(gene_variance))
top_genes <- names(sort(gene_variance, decreasing = TRUE))[1:n_top]

expression_top <- expression_data[top_genes, , drop = FALSE]

cor_matrix <- cor(
  t(expression_top),
  method = "pearson",
  use = "pairwise.complete.obs"
)

threshold <- 0.7
adjacency_matrix <- abs(cor_matrix) >= threshold
diag(adjacency_matrix) <- FALSE

biological_network <- graph_from_adjacency_matrix(
  adjacency_matrix,
  mode = "undirected"
)

biological_network <- delete_vertices(
  biological_network,
  degree(biological_network) == 0
)

cat("Nodes:", vcount(biological_network), "\n")
cat("Edges:", ecount(biological_network), "\n")
cat("Density:", edge_density(biological_network), "\n")
cat("Mean degree:", mean(degree(biological_network)), "\n")
cat("Transitivity:", transitivity(biological_network), "\n")

if (vcount(biological_network) > 1) {
  cat("Average path length:",
      mean_distance(biological_network), "\n")
}

write_graph(
  biological_network,
  "results/networks/biological_network.graphml",
  format = "graphml"
)
