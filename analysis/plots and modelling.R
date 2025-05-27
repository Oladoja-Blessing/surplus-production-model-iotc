library(patchwork)
# Aggregate mean biomass per year for SpGroup
mod_summary <- mod_df %>%
  group_by(SpGroup,GrGroup) %>%
  group_modify(~ {
    catch <- .x$`Catch/Capture(t)`
    K <- max(catch, na.rm = TRUE)
    r <- r_values[.y$SpGroup]
    Binit <- max(catch, na.rm = TRUE)
    biomass <- SPM(r , K = K, Binit = Binit, catch = catch)
    .x$surB <- biomass
    return(.x)
  }) %>%
  ungroup()

# Plot and modelling per species
p1 <- mod_summary%>%
  
  group_by(SpGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  ggplot(aes(x = `Year/An`, y = mean_biomass)) +
  geom_line(linewidth = 1) +
  labs(
    
    x = "Year",
    y = "Mean Estimated Biomass (surB)"
  ) +
  facet_wrap(~SpGroup, scales = "free", nrow = 1) +
  theme(strip.text.y  = element_blank()) +
  theme_bw()

p2 <- mod_summary%>%
  group_by(SpGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  ggplot(aes(x = `Year/An`, y = mean_catch)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Surplus Population Model Vs Catch Data",
    x = "Year",
    y = "Mean Catch"
  ) +
  facet_wrap(~SpGroup, scales = "free", nrow = 1) +
  theme_bw()

p2/p1


# Plot and modelling per gear
p3 <- mod_summary%>%
  group_by(GrGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  ggplot(aes(x = `Year/An`, y = mean_biomass)) +
  geom_line(linewidth = 1) +
  labs(
    
    x = "Year",
    y = "Mean Estimated Biomass (surB)"
  ) +
  facet_wrap(~GrGroup, scales = "free", nrow = 1) +
  theme(strip.text.y  = element_blank()) +
  theme_bw()

p4 <- mod_summary%>%
  group_by(GrGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  ggplot(aes(x = `Year/An`, y = mean_catch)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Surplus Population Model Vs Catch Data",
    x = "Year",
    y = "Mean Catch"
  ) +
  facet_wrap(~GrGroup, scales = "free", nrow = 1) +
  theme_bw()

p4/p3

# Plot and modelling per gear
p3 <- mod_summary%>%
  group_by(GrGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  ggplot(aes(x = `Year/An`, y = mean_biomass)) +
  geom_line(linewidth = 1) +
  labs(
    
    x = "Year",
    y = "Mean Estimated Biomass (surB)"
  ) +
  facet_wrap(~GrGroup, scales = "free", nrow = 1) +
  theme(strip.text.y  = element_blank()) +
  theme_bw()

p4 <- mod_summary%>%
  group_by(GrGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  pivot_longer(
    cols = c(mean_catch, mean_biomass),
    names_to = "Metric",
    values_to = "Value"
  )%>%
  ggplot(aes(x = `Year/An`, y = mean_catch)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Surplus Population Model Vs Catch Data",
    x = "Year",
    y = "Mean Catch"
  ) +
  facet_wrap(~GrGroup, scales = "free", nrow = 1) +
  theme_bw()

p4/p3

# Pivot longer for combined plot
plot_df <- mod_summary%>%
  group_by(SpGroup, GrGroup, `Year/An`) %>%
  summarise(mean_biomass = mean(surB, na.rm = TRUE),
            mean_catch = mean(`Catch/Capture(t)`, na.rm = T))%>%
  pivot_longer(
    cols = c(mean_catch, mean_biomass),
    names_to = "Metric",
    values_to = "Value"
  )

# Plot with species on rows and gear on columns (Mean catch)
plot_df%>%
  filter(Metric == "mean_catch")%>%
  ggplot(aes(x = `Year/An`, y = Value)) +
  geom_line(linewidth = 1) +
  facet_wrap(GrGroup~SpGroup , scales = "free", nrow = 6) +
  labs(
    title = "Catch by Species and Gear Type",
    x = "Year",
    y = NULL
  ) +
  theme_bw(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    strip.text = element_text(size = 10),
    legend.title = element_blank(),
    axis.text = element_text(face = "bold")
  )
# Plot with species on rows and gear on columns (Biomass)
plot_df%>%
  filter(Metric == "mean_biomass")%>%
  ggplot(aes(x = `Year/An`, y = Value)) +
  geom_line(linewidth = 1) +
  facet_wrap(GrGroup~SpGroup , scales = "free", nrow = 6) +
  labs(
    title = "Estimated Biomass surplus by Species and Gear Type",
    x = "Year",
    y = NULL
  ) +
  theme_bw(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    strip.text = element_text(size = 10),
    legend.title = element_blank(),
    axis.text = element_text(face = "bold")
  )
