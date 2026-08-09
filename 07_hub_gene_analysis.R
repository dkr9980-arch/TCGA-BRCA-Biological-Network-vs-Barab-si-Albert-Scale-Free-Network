# 07 - Hub Gene Analysis

library(igraph)
library(dplyr)

network <- read_graph(
  "results/networks/biological_network.graphml",
  format = "graphml"
)

hub_table <- data.frame(
  Gene = V(network)$name,
  Degree = degree(network),
  Betweenness = betweenness(network),
  Closeness = closeness(network)
) %>%
  arrange(desc(Degree))

top_hubs <- head(hub_table, 20)

print(top_hubs)

write.csv(
  hub_table,
  "results/networks/hub_gene_ranking.csv",
  row.names = FALSE
)

write.csv(
  top_hubs,
  "results/networks/top_20_hub_genes.csv",
  row.names = FALSE
)
