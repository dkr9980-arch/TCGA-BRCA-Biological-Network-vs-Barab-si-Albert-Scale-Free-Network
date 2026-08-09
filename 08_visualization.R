# 08 - Network Visualization

library(igraph)

BA_network <- read_graph(
  "results/networks/BA_network.graphml",
  format = "graphml"
)

png(
  "figures/BA_network.png",
  width = 1200,
  height = 1000,
  res = 150
)

plot(
  BA_network,
  vertex.size = 4,
  vertex.label = NA,
  main = "Barabási-Albert Scale-Free Network"
)

dev.off()

degree_values <- degree(BA_network)

png(
  "figures/degree_distribution.png",
  width = 1000,
  height = 800,
  res = 150
)

hist(
  degree_values,
  breaks = 30,
  main = "Degree Distribution",
  xlab = "Degree",
  ylab = "Frequency"
)

dev.off()
