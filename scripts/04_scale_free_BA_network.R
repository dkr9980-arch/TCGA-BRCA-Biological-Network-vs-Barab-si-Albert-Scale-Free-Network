# 04 - Barabási-Albert Scale-Free Network

library(igraph)

number_of_nodes <- 500
m <- 2

BA_network <- sample_pa(
  n = number_of_nodes,
  power = 1,
  m = m,
  directed = FALSE
)

cat("Nodes:", vcount(BA_network), "\n")
cat("Edges:", ecount(BA_network), "\n")
cat("Mean degree:", mean(degree(BA_network)), "\n")
cat("Density:", edge_density(BA_network), "\n")
cat("Transitivity:", transitivity(BA_network), "\n")

if (vcount(BA_network) > 1) {
  cat("Average shortest path:",
      mean_distance(BA_network), "\n")
}

degree_values <- degree(BA_network)
degree_distribution <- table(degree_values)

degree_df <- data.frame(
  Degree = as.numeric(names(degree_distribution)),
  Frequency = as.numeric(degree_distribution)
)

write.csv(
  degree_df,
  "results/networks/BA_degree_distribution.csv",
  row.names = FALSE
)

write_graph(
  BA_network,
  "results/networks/BA_network.graphml",
  format = "graphml"
)
