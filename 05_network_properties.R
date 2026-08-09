# 05 - Network Properties and Power-Law Analysis

library(igraph)

BA_network <- read_graph(
  "results/networks/BA_network.graphml",
  format = "graphml"
)

degree_values <- degree(BA_network)

degree_df <- data.frame(
  Degree = 0:(length(degree_distribution(BA_network)) - 1),
  Probability = degree_distribution(BA_network)
)

degree_df <- degree_df[degree_df$Probability > 0, ]

write.csv(
  degree_df,
  "results/networks/degree_distribution.csv",
  row.names = FALSE
)

powerlaw_result <- fit_power_law(degree_values)

cat("Power-law fit:\n")
print(powerlaw_result)

network_statistics <- data.frame(
  Nodes = vcount(BA_network),
  Edges = ecount(BA_network),
  Density = edge_density(BA_network),
  Mean_Degree = mean(degree_values),
  Transitivity = transitivity(BA_network),
  Average_Path_Length = ifelse(
    vcount(BA_network) > 1,
    mean_distance(BA_network),
    NA
  )
)

write.csv(
  network_statistics,
  "results/networks/network_statistics.csv",
  row.names = FALSE
)
