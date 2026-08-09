# TCGA-BRCA Biological Network vs Barabási–Albert Scale-Free Network

## 📌 Project Overview

This project presents a comparative analysis of a biological gene interaction network derived from TCGA-BRCA breast cancer data and a theoretical Barabási–Albert (BA) scale-free network.

The objective is to compare the network topology of a biological system with a mathematically generated scale-free network and investigate the biological significance of highly connected genes through functional and pathway enrichment analysis.

---

## 🎯 Objectives

- Construct a biological gene network using TCGA-BRCA data.
- Generate a Barabási–Albert scale-free network using `igraph`.
- Compare the structural properties of the two networks.
- Analyze degree distribution and network topology.
- Identify highly connected hub genes in the biological network.
- Perform Gene Ontology (GO) enrichment analysis.
- Perform Reactome pathway enrichment analysis.
- Interpret the biological significance of network hubs and enriched pathways.

---

## 🧬 Dataset

The biological network analysis was performed using TCGA-BRCA (The Cancer Genome Atlas Breast Invasive Carcinoma) data.

The dataset was processed to obtain gene-level information suitable for biological network analysis.

The original large TCGA dataset is not included in this repository. The analysis scripts and processed results are provided where appropriate.

---

## 🔬 Methodology

The project workflow consists of the following major steps:

1. TCGA-BRCA data preparation
2. Biological network construction
3. Network topology analysis
4. Barabási–Albert scale-free network generation
5. Comparison of biological and theoretical networks
6. Hub gene identification
7. Gene Ontology enrichment analysis
8. Reactome pathway analysis
9. Biological interpretation

---

## 🌐 Biological Network

The biological network represents relationships between genes obtained from the TCGA-BRCA analysis.

### Network components

- **Nodes:** Genes
- **Edges:** Gene relationships/interactions
- **Hub genes:** Highly connected genes identified using network centrality measures

Network properties analyzed include:

- Number of nodes
- Number of edges
- Degree distribution
- Average degree
- Network density
- Clustering
- Centrality
- Hub nodes

---

## 📊 Barabási–Albert Scale-Free Network

A Barabási–Albert (BA) network was generated using the `igraph` package in R.

The BA model is based on the principle of **preferential attachment**, where highly connected nodes have a greater probability of acquiring additional connections.

The BA network was used as a theoretical reference model for comparison with the biological network.

---

## ⚖️ Biological Network vs BA Network

The two networks were compared based on their structural properties.

| Property | Biological Network | BA Network |
|---|---|---|
| Origin | Biological data | Mathematical model |
| Nodes | Genes | Model nodes |
| Edges | Biological relationships | Preferential attachment |
| Hub nodes | Biologically meaningful genes | Model-generated hubs |
| Functional interpretation | Possible | Not directly applicable |
| Pathway analysis | Possible | Not biologically meaningful |

The comparison helps distinguish **network topology** from **biological significance**.

---

## 🧩 Hub Gene Analysis

Highly connected nodes were identified from the biological network.

These hub genes were investigated because genes occupying central positions in a biological network may participate in multiple biological processes or pathways.

The identified hub genes were used for downstream functional enrichment analysis.

---

## 🧪 Gene Ontology Enrichment

Gene Ontology enrichment analysis was performed to investigate the biological functions associated with the selected genes.

The analysis considered:

- Biological Process (BP)
- Molecular Function (MF)
- Cellular Component (CC)

The enrichment results were used to connect network-level observations with biological functions.

---

## 🧬 Reactome Pathway Analysis

Reactome pathway enrichment analysis was performed to identify biological pathways associated with the selected genes/hub genes.

This analysis provides a biological interpretation of the network by connecting:

**Network → Hub Genes → Biological Functions → Biological Pathways**

---

## 🔎 Key Interpretation

The major concept investigated in this project is the difference between a **theoretical scale-free network** and a **biological network**.

A Barabási–Albert network can generate highly connected hub nodes through preferential attachment.

However, these hubs do not have biological identities or biological functions.

In contrast, hubs in a biological gene network correspond to actual genes. Their biological relevance can therefore be investigated using GO and Reactome enrichment analysis.

Thus:

> **Network topology describes how a network is organized, while functional enrichment helps explain what the biological network represents.**

---

## 🛠️ Tools and Technologies

### Programming
- R
- RStudio

### Network Analysis
- igraph

### Biological Data
- TCGA-BRCA
- Gene expression data
- Gene interaction/network analysis

### Functional Analysis
- Gene Ontology enrichment
- Reactome pathway analysis

---
