# Define the SPM model
SPM <- function(r, K, Binit, catch) {
  years <- length(catch)
  biomass <- numeric(length = years)
  biomass[1] <- Binit
  for (t in 2:years) {
    biomass[t] <- max(0, biomass[t-1] + r * (1 - biomass[t-1] / K) * biomass[t-1] - catch[t-1])
  }
  return(biomass)
}

r_values <- c("TUNAS" = 0.82, "SEERFISH"  = 0.28, "BILLFISH" = 0.25)  # if you have multiple species


