
## 🔍 Objective

To estimate fish biomass trends for major species groups (TUNAS, BILLFISH, SEERFISH) using a surplus production model and compare trends across fishing gear types.

## 🧪 Methods

The SPM model follows the logistic growth equation:

\[
B_{t} = B_{t-1} + r \cdot B_{t-1} \left(1 - \frac{B_{t-1}}{K}\right) - C_{t-1}
\]

Where:
- \( B_t \): biomass at time t
- \( r \): intrinsic growth rate (species-specific)
- \( K \): carrying capacity (set as max catch)
- \( C_t \): catch at time t

## 📊 Visualizations

- Biomass and catch trends over time by species
- Biomass and catch trends over time by gear type
- Cross-tab plots by both species and gear type

## 🛠 Requirements

- R (version ≥ 4.0)
- R packages: `tidyverse`, `readxl`, `patchwork`

## ✍ Author

**Blessing Oladoja**  
Fisheries Scientist | Data Analyst

## 📄 License

MIT License
