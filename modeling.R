# R Script: Modeling Lockdown Threshold Trade-offs

# Load libraries
library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)
library(broom)
library(splines)
library(mgcv)

# Load updated monthly data
df <- read_csv("Final working datasets/yuval_after_engineering_try/total_features_to_work_with.csv")

# Add DV next month change feature (if not already present)
df <- df %>%
  arrange(Entity, Month) %>%
  group_by(Entity) %>%
  mutate(
    dv_percent_change_baseline_next_month = lead(dv_percent_change_baseline, 1),
    scaled_deaths = scale(Monthly_death_rates_per_million_people)[, 1],
    scaled_deaths_pct_change = (scaled_deaths - lag(scaled_deaths)) / (abs(lag(scaled_deaths)) + 1)
  ) %>%
  ungroup()




# no need to run this, it wasnt the working models

# Filter to post-March 2020 and remove rows with missing DV or death rate
model_data <- df %>%
  filter(Month >= "2020-03") %>%
  filter(!is.na(dv_percent_change_baseline), !is.na(Monthly_death_rates_per_million_people))

# Fill death change percent prev and lag vars if needed
model_data <- model_data %>%
  mutate(
    death_pct_change_prev = ifelse(is.na(death_pct_change_prev) | is.infinite(death_pct_change_prev), 0, death_pct_change_prev),
    lag_death_pct_prev = ifelse(is.na(lag_death_pct_prev) | is.infinite(lag_death_pct_prev), 0, lag_death_pct_prev)
  )
model_data <- model_data %>%
  mutate(
    scaled_deaths_pct_change = ifelse(is.na(scaled_deaths_pct_change) | is.infinite(scaled_deaths_pct_change), 0, scaled_deaths_pct_change)
  )
filtered_model_data <- model_data %>%
  filter(long_lockdown > 0)

# Two models: DV and Death rate change vs lockdown length
model_dv <- lm(dv_percent_change_baseline ~ long_lockdown, data = filtered_model_data)
model_death <- lm(scaled_deaths_pct_change ~ long_lockdown, data = filtered_model_data)
other_model_death <- lm(death_pct_change_prev ~ long_lockdown, data = filtered_model_data)

# Nonlinear models (quadratic)
model_dv_quad <- lm(dv_percent_change_baseline ~ poly(long_lockdown, 2), data = filtered_model_data)
model_death_quad <- lm(scaled_deaths_pct_change ~ poly(long_lockdown, 2), data = filtered_model_data)

# Summaries
summary(model_dv)
summary(model_death)
summary(model_dv_quad)
summary(model_death_quad)

# Predictions
filtered_model_data <- filtered_model_data %>%
  mutate(
    pred_dv = predict(model_dv),
    pred_death = predict(model_death),
    pred_dv_quad = predict(model_dv_quad),
    pred_death_quad = predict(model_death_quad)
  )

ggplot(filtered_model_data, aes(x = long_lockdown)) +
  geom_line(aes(y = pred_dv, color = "DV % Change"), size = 1.2) +
  geom_line(aes(y = pred_death, color = "Death Rate Change"), size = 1.2) +
  labs(
    title = "Trade-off Between Lockdown Length, Death Rates, and Domestic Violence",
    x = "Long Lockdown Duration (days)",
    y = "% Change",
    color = "Outcome"
  ) +
  theme_minimal()

# Plot both fitted curves (quadratic) on same graph
ggplot(filtered_model_data, aes(x = long_lockdown)) +
  geom_line(aes(y = pred_dv_quad, color = "DV % Change (Quadratic)"), size = 1.2) +
  geom_line(aes(y = pred_death_quad, color = "Death Rate Change (Quadratic)"), size = 1.2) +
  labs(
    title = "Trade-off Between Lockdown Length, Death Rates, and Domestic Violence",
    x = "Long Lockdown Duration (days)",
    y = "% Change",
    color = "Outcome"
  ) +
  theme_minimal()

# Save models
saveRDS(model_dv, "model_dv.rds")
saveRDS(model_death, "model_death.rds")

#trying to scale and remodel

# Step 1: Filter and scale DV + Deaths per country
scaled_df <- df %>%
  group_by(Entity) %>%
  mutate(
    dv_scaled = as.numeric(scale(dv_percent_change_baseline)),
    death_scaled = as.numeric(scale(scaled_deaths_pct_change)),
    composite_harm = dv_scaled + death_scaled
  ) %>%
  ungroup()
filtered_scaled_df <- scaled_df %>%
  filter(Month >= "2020-03") %>%
  filter(!is.na(dv_percent_change_baseline), !is.na(Monthly_death_rates_per_million_people))

# Fill death change percent prev and lag vars if needed
filtered_scaled_df <- filtered_scaled_df %>%
  mutate(
    death_pct_change_prev = ifelse(is.na(death_pct_change_prev) | is.infinite(death_pct_change_prev), 0, death_pct_change_prev),
    lag_death_pct_prev = ifelse(is.na(lag_death_pct_prev) | is.infinite(lag_death_pct_prev), 0, lag_death_pct_prev)
  )
filtered_scaled_df <- filtered_scaled_df %>%
  mutate(
    scaled_deaths_pct_change = ifelse(is.na(scaled_deaths_pct_change) | is.infinite(scaled_deaths_pct_change), 0, scaled_deaths_pct_change)
  )
filtered_scaled_df <- filtered_scaled_df %>%
  filter(long_lockdown > 0)

# Step 2: Fit quadratic models
dv_model <- lm(dv_scaled ~ poly(long_lockdown, 2), data = scaled_df)
death_model <- lm(death_scaled ~ poly(long_lockdown, 2), data = scaled_df)
harm_model <- lm(composite_harm ~ poly(long_lockdown, 2), data = scaled_df)

# Step 3: Create prediction grid
range_long <- range(scaled_df$long_lockdown, na.rm = TRUE)
prediction_data <- tibble(long_lockdown = seq(range_long[1], range_long[2], by = 1))
prediction_data <- prediction_data %>%
  mutate(
    dv_pred = predict(dv_model, newdata = prediction_data),
    death_pred = predict(death_model, newdata = prediction_data),
    harm_pred = predict(harm_model, newdata = prediction_data)
  )

# Step 4: Find optimal point (min composite harm)
optimal_day <- prediction_data$long_lockdown[which.min(prediction_data$harm_pred)]

# Step 5: Plot it
library(ggplot2)

ggplot(prediction_data, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1) +
  geom_line(aes(y = death_pred, color = "Deaths (scaled)"), size = 1) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.2, linetype = "solid") +
  geom_vline(xintercept = optimal_day, linetype = "dashed", color = "black") +
  labs(
    title = "Composite Harm vs. Lockdown Length",
    x = "Lockdown Length (days)",
    y = "Scaled Outcome",
    color = "Curve"
  ) +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Deaths (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()

write.csv(filtered_model_data, "filtered_model_data.csv")



# the splines part with the working models!!




baseline_deaths <- df %>%
  group_by(Entity) %>%
  filter(Month >= "2020-03") %>%
  #slice_head(n = 2) %>%  # take first 2 months post-March
  summarise(death_baseline = mean(Monthly_death_rates_per_million_people, na.rm = TRUE), .groups = "drop")

# STEP 2: Join baseline and create percent change from baseline
df <- df %>%
  left_join(baseline_deaths, by = "Entity") %>%
  mutate(
    death_pct_change_baseline = (Monthly_death_rates_per_million_people - death_baseline) / (death_baseline + 1)
  )

write.csv(df, "Final working datasets/yuval_after_engineering_try/Dataset_with_death_baseline_full_not_scaled.csv")
model_df <- df %>%
  filter(Month >= "2020-04", long_lockdown > 0) %>%
  filter(!is.na(dv_percent_change_baseline), !is.na(death_pct_change_baseline))

scaled_df <- model_df %>%
  group_by(Entity) %>%
  mutate(
    dv_scaled = if (n() == 1) 0 else as.numeric(scale(dv_percent_change_baseline)),
    death_scaled = if (n() == 1) 0 else as.numeric(scale(death_pct_change_baseline)),
    composite_harm = dv_scaled + death_scaled
  ) %>%
  ungroup()

write.csv(scaled_df, "Final working datasets/yuval_after_engineering_try/scaled_df_only_lockdown_after_april.csv")
# Run PCA and use first principal component as composite harm
#pca_input <- scaled_df %>%
  #filter(is.finite(dv_scaled), is.finite(death_scaled))

# Run PCA
#pca_result <- prcomp(pca_input[, c("dv_scaled", "death_scaled")], center = FALSE, scale. = FALSE)

# Re-merge PCA back to full data (optional: only keep usable rows)
#scaled_df <- pca_input %>%
 # mutate(composite_pca = pca_result$x[, 1])

# STEP 5: Fit spline models
model_dv_spline <- lm(dv_scaled ~ ns(long_lockdown, df = 4), data = scaled_df)
model_death_spline <- lm(death_scaled ~ ns(long_lockdown, df = 4), data = scaled_df)
model_harm_spline <- lm(composite_harm ~ ns(long_lockdown, df = 4), data = scaled_df)
#model_harm_spline <- lm(composite_pca ~ ns(long_lockdown, df = 4), data = scaled_df)

# STEP 6: Predict over a range
lockdown_range <- range(scaled_df$long_lockdown, na.rm = TRUE)
pred_data <- tibble(long_lockdown = seq(lockdown_range[1], lockdown_range[2], by = 1)) %>%
  mutate(
    dv_pred = predict(model_dv_spline, newdata = .),
    death_pred = predict(model_death_spline, newdata = .),
    harm_pred = predict(model_harm_spline, newdata = .)
  )

# STEP 7: Find optimal lockdown point
optimal_day <- pred_data$long_lockdown[which.min(pred_data$harm_pred)]

# STEP 8: Plot
ggplot(pred_data, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1.1) +
  geom_line(aes(y = death_pred, color = "Deaths (scaled)"), size = 1.1) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.3, linetype = "solid") +
  geom_vline(xintercept = optimal_day, linetype = "dashed", color = "black") +
  labs(
    title = "Composite Harm vs. Lockdown Length (Spline Model)",
    subtitle = paste("Optimal Duration:", optimal_day, "days"),
    x = "Lockdown Duration (days)",
    y = "Scaled Outcome",
    color = "Metric"
  ) +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Deaths (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()

summary(model_dv_spline)
summary(model_death_spline)
summary(model_harm_spline)

saveRDS(model_dv_spline, "models/model_dv_spline.rds")
saveRDS(model_death_spline, "models/model_death_spline.rds")
saveRDS(model_harm_spline, "models/model_harm_spline.rds")  # if defined


# Final Report Plot for DV, Death, and Composite Harm (Spline Models)
library(cowplot)

# Build spline predictions for visual clarity
spline_df <- scaled_df %>%
  select(long_lockdown, dv_scaled, death_scaled, composite_harm) #%>%
  #drop_na()

spline_models <- list(
  dv = lm(dv_scaled ~ ns(long_lockdown, df = 4), data = spline_df),
  death = lm(death_scaled ~ ns(long_lockdown, df = 4), data = spline_df),
  harm = lm(composite_harm ~ ns(long_lockdown, df = 4), data = spline_df)
)

lockdown_range <- range(spline_df$long_lockdown, na.rm = TRUE)
pred_grid <- tibble(long_lockdown = seq(lockdown_range[1], lockdown_range[2], by = 1)) %>%
  mutate(
    dv_pred = predict(spline_models$dv, newdata = .),
    death_pred = predict(spline_models$death, newdata = .),
    harm_pred = predict(spline_models$harm, newdata = .)
  )

optimal_day <- pred_grid$long_lockdown[which.min(pred_grid$harm_pred)]

# Create a minimalist, clean, publication-ready spline plot
ggplot(pred_grid, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "Domestic Violence"), size = 1.3) +
  geom_line(aes(y = death_pred, color = "COVID Death Rate"), size = 1.3) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.4, linetype = "solid") +
  geom_vline(xintercept = optimal_day, linetype = "dashed", color = "black") +
  annotate("text", x = optimal_day + 2, y = max(pred_grid$harm_pred, na.rm = TRUE),
           label = paste("Optimal:", optimal_day, "days"), hjust = 0, size = 4) +
  scale_color_manual(values = c("Domestic Violence" = "firebrick", "COVID Death Rate" = "steelblue", "Composite Harm" = "black")) +
  labs(
    title = "Nonlinear Relationship Between Lockdown Length and Harm Outcomes",
    subtitle = "Spline models fitted to scaled outcomes; optimal composite duration marked",
    x = "Lockdown Length (days)", y = "Scaled Value", color = NULL
  ) +
  coord_cartesian(xlim = c(min(spline_df$long_lockdown), min(100, max(spline_df$long_lockdown) + 5))) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5),
    legend.position = "top",
    legend.text = element_text(size = 11)
  )

summary(spline_models$dv)
summary(spline_models$death)
summary(spline_models$harm)



# tried GAM models as well

# GAM models for DV, Death, and Composite Harm
gam_dv <- gam(dv_scaled ~ s(long_lockdown), data = scaled_df)
gam_death <- gam(death_scaled ~ s(long_lockdown), data = scaled_df)
#gam_harm <- gam(composite_harm ~ s(long_lockdown), data = scaled_df)
gam_harm <- gam(composite_pca ~ s(long_lockdown), data = scaled_df)

# Prediction and plotting for GAM
lockdown_range <- range(scaled_df$long_lockdown, na.rm = TRUE)
pred_data_gam <- tibble(long_lockdown = seq(lockdown_range[1], lockdown_range[2], by = 1)) %>%
  mutate(
    dv_pred = predict(gam_dv, newdata = .),
    death_pred = predict(gam_death, newdata = .),
    harm_pred = predict(gam_harm, newdata = .)
  )

optimal_day_gam <- pred_data_gam$long_lockdown[which.min(pred_data_gam$harm_pred)]

# GAM Plot
ggplot(pred_data_gam, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1.1) +
  geom_line(aes(y = death_pred, color = "Deaths (scaled)"), size = 1.1) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.3) +
  geom_vline(xintercept = optimal_day_gam, linetype = "dashed", color = "black") +
  labs(title = "Composite Harm vs. Lockdown Length (GAM Model)",
       subtitle = paste("Optimal Duration:", optimal_day_gam, "days"),
       x = "Lockdown Duration (days)", y = "Scaled Outcome", color = "Metric") +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Deaths (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()

summary(gam_death)
summary(gam_dv)
summary(gam_harm)




scaled_prev_df <- scaled_df %>%
  filter(Month >= "2020-04", long_lockdown > 0) %>%
  filter(!is.na(dv_percent_change_baseline), !is.na(death_pct_change_prev))

scaled_prev_df <- scaled_prev_df %>%
  group_by(Entity) %>%
  mutate(
    dv_prev_scaled = if (n() == 1) 0 else as.numeric(scale(dv_percent_change_baseline)),
    death_prev_scaled = if (n() == 1) 0 else as.numeric(scale(death_pct_change_prev)),
    composite_prev_harm = dv_prev_scaled + death_prev_scaled
  ) %>%
  ungroup()

spline_prev_df <- scaled_prev_df %>%
  select(long_lockdown, dv_prev_scaled, death_prev_scaled, composite_prev_harm) #%>%
#drop_na()

spline_prev_models <- list(
  dv = lm(dv_prev_scaled ~ ns(long_lockdown, df = 4), data = spline_prev_df),
  death = lm(death_prev_scaled ~ ns(long_lockdown, df = 4), data = spline_prev_df),
  harm = lm(composite_prev_harm ~ ns(long_lockdown, df = 4), data = spline_prev_df)
)

lockdown_prev_range <- range(spline_prev_df$long_lockdown, na.rm = TRUE)
pred_prev_grid <- tibble(long_lockdown = seq(lockdown_prev_range[1], lockdown_prev_range[2], by = 1)) %>%
  mutate(
    dv_pred = predict(spline_prev_models$dv, newdata = .),
    death_pred = predict(spline_prev_models$death, newdata = .),
    harm_pred = predict(spline_prev_models$harm, newdata = .)
  )

optimal_prev_day <- pred_prev_grid$long_lockdown[which.min(pred_prev_grid$harm_pred)]

# Create a minimalist, clean, publication-ready spline plot
ggplot(pred_prev_grid, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "Domestic Violence"), size = 1.3) +
  geom_line(aes(y = death_pred, color = "COVID Death Rate"), size = 1.3) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.4, linetype = "solid") +
  geom_vline(xintercept = optimal_prev_day, linetype = "dashed", color = "black") +
  annotate("text", x = optimal_prev_day + 2, y = max(pred_prev_grid$harm_pred, na.rm = TRUE),
           label = paste("Optimal:", optimal_prev_day, "days"), hjust = 0, size = 4) +
  scale_color_manual(values = c("Domestic Violence" = "firebrick", "COVID Death Rate" = "steelblue", "Composite Harm" = "black")) +
  labs(
    title = "Nonlinear Relationship Between Lockdown Length and Harm Outcomes",
    subtitle = "Spline models fitted to scaled outcomes; optimal composite duration marked",
    x = "Lockdown Length (days)", y = "Scaled Value", color = NULL
  ) +
  coord_cartesian(xlim = c(min(spline_prev_df$long_lockdown), min(100, max(spline_prev_df$long_lockdown) + 5))) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5),
    legend.position = "top",
    legend.text = element_text(size = 11)
  )

summary(spline_prev_models$dv)
summary(spline_prev_models$death)
summary(spline_prev_models$harm)
