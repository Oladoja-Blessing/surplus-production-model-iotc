# Surplus Production Modeling of Tuna and Tuna-like Species in the Indian Ocean (1950–2023)

## Abstract

This report presents a Surplus Production Model (SPM) analysis applied to the Indian Ocean Tuna Commission (IOTC) dataset, covering 1950 to 2023. The goal is to estimate biomass trends and evaluate the sustainability of fish stocks under different fishing pressures.

---

## Introduction

Tuna and associated species are heavily exploited in the Indian Ocean. Understanding how their biomass has changed over time is vital for effective management. The Surplus Production Model (SPM), a logistic growth model, provides a simplified but useful way to estimate biomass using only catch data.

---

## Data and Methods

### Data Source

- **Dataset:** [IOTC public scientific data (Catches_Captures sheet)](https://iotc.org/data/datasets/latest/NC/SCI)
- **Species Groups:** TUNAS, SEERFISH, BILLFISH
- **Gear Groups:** Longline, Gillnet, Purse Seine, etc.

### Model Formula

\[
B_{t} = B_{t-1} + r \cdot B_{t-1} \left(1 - \frac{B_{t-1}}{K}\right) - C_{t-1}
\]

- **r (intrinsic rate):**  
  - TUNAS = 0.82  
  - SEERFISH = 0.28  
  - BILLFISH = 0.25  
- **K:** maximum observed catch  
- **B₀:** initialized as max catch

---

## Results

### 1. Biomass Trends by Species

Each species group shows distinct trends in estimated biomass. TUNAS exhibit a more rapid rise and fall due to higher productivity (r), while BILLFISH and SEERFISH show more stable patterns.

### 2. Catch vs Biomass Comparison

Visual comparisons between estimated biomass and actual catch help identify years of overfishing or recovery.

### 3. Gear-specific Trends

Gear types like longlines and purse seines show varying impacts across species. The plots suggest which gears are associated with biomass declines or stability.

### 4. Combined Faceted View (Species × Gear)

Faceted visualizations allow for a side-by-side look at how catch and biomass evolved across both dimensions.

---

## Discussion

This simple model is useful for exploring biomass trajectories but does not capture ecosystem complexity. Future models can incorporate effort, age structure, or environmental data for better accuracy.

---

## Conclusion

SPM offers a valuable first-step tool for assessing stock health and guiding data-poor fisheries management. The IOTC dataset, though limited in some respects, provides insight into long-term species and gear-specific dynamics in the Indian Ocean.

---

## References

- Schaefer, M.B. (1954). Some aspects of the dynamics of populations important to the management of commercial marine fisheries. *Bulletin of the Inter-American Tropical Tuna Commission*.
- Indian Ocean Tuna Commission (IOTC). Public Datasets.
