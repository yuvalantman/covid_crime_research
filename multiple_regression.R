library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)
library(broom)
library(splines)
library(mgcv)



df <- read_csv("Final working datasets/yuval_after_engineering_try/Dataset_with_death_baseline_full_not_scaled.csv")

df %>%
  filter(Month >= "2020-04") %>%
  summarise(
    income_support_min = min(Monthly_income_support, na.rm = TRUE),
    income_support_max = max(Monthly_income_support, na.rm = TRUE),
    income_support_unique = n_distinct(Monthly_income_support),
    income_support_median = median(Monthly_income_support, na.rm = TRUE),
    
    workplace_closure_min = min(Monthly_workplace_closures_severity, na.rm = TRUE),
    workplace_closure_max = max(Monthly_workplace_closures_severity, na.rm = TRUE),
    workplace_closure_unique = n_distinct(Monthly_workplace_closures_severity),
    workplace_closure_median = median(Monthly_workplace_closures_severity, na.rm = TRUE),
    
    stay_home_min = min(stay_at_home_power, na.rm = TRUE),
    stay_home_max = max(stay_at_home_power, na.rm = TRUE),
    stay_home_unique = n_distinct(stay_at_home_power),
    stay_home_median = median(stay_at_home_power, na.rm = TRUE),
    
    lockdown_power_min = min(lockdown_power, na.rm = TRUE),
    lockdown_power_max = max(lockdown_power, na.rm = TRUE),
    lockdown_power_unique = n_distinct(lockdown_power),
    lockdown_power_median = median(lockdown_power, na.rm = TRUE),
    
    lockdown_severity_min = min(Lockdown_severity, na.rm = TRUE),
    lockdown_severity_max = max(Lockdown_severity, na.rm = TRUE),
    lockdown_severity_unique = n_distinct(Lockdown_severity),
    lockdown_severity_median = median(Lockdown_severity, na.rm = TRUE),
    
    baseline_dv_min = min(pre_march_avg_dv, na.rm = TRUE),
    baseline_dv_max = max(pre_march_avg_dv, na.rm = TRUE),
    baseline_dv_unique = n_distinct(pre_march_avg_dv),
    baseline_dv_median = median(pre_march_avg_dv, na.rm = TRUE),
    
    population_min = min(Population, na.rm = TRUE),
    population_max = max(Population, na.rm = TRUE),
    population_unique = n_distinct(Population),
    population_median = median(Population, na.rm = TRUE)
  ) %>% print(width=Inf)

multiple_model_df <- df %>%
  filter(Month >= "2020-04", long_lockdown > 0) %>%
  mutate(
    income_support_cat = ifelse(Monthly_income_support <= 31, 1, 2),
    workplace_closure_cat = ifelse(Monthly_workplace_closures_severity <= 60, 1, 2)
    #lockdown_severity_cat = ifelse(Lockdown_severity <=60, "Low", "High"),
    #population_cat = ifelse(Population <= 5e6, "Small", "Large")
  ) %>%
  group_by(Entity) %>%
  filter(!is.na(dv_percent_change_baseline)) %>%
  mutate(
    dv_scaled = ifelse(n() == 1, 0, as.numeric(scale(dv_percent_change_baseline))),
    death_scaled = ifelse(n() == 1, 0, as.numeric(scale(death_pct_change_baseline))),
    composite_harm = 0.5 * dv_scaled + 0.5 * death_scaled
  ) %>%
  ungroup() %>%
  filter(!is.na(dv_scaled), !is.na(death_scaled))

# Step 2: Fit GAM models for DV and Death
model_gam_dv <- gam(dv_scaled ~ s(long_lockdown, k = 5) + income_support_cat + 
                      workplace_closure_cat + lockdown_severity_cat + population_cat,
                    data = multiple_model_df)

model_gam_death <- gam(death_scaled ~ s(long_lockdown, k = 5) + income_support_cat + 
                         workplace_closure_cat + lockdown_severity_cat + population_cat,
                       data = multiple_model_df)

model_gam_harm <- gam(composite_harm ~ s(long_lockdown, k = 5) + income_support_cat + 
                        workplace_closure_cat + lockdown_severity_cat + population_cat,
                      data = multiple_model_df)

# Step 3: Create prediction grid for selected scenario
pred_grid <- expand.grid(
  long_lockdown = seq(min(multiple_model_df$long_lockdown), min(100, max(multiple_model_df$long_lockdown)), by = 1),
  income_support_cat = "Low",
  workplace_closure_cat = "High",
  lockdown_severity_cat = "High",
  population_cat = "Large"
)

pred_grid$dv_pred <- predict(model_gam_dv, newdata = pred_grid)
pred_grid$death_pred <- predict(model_gam_death, newdata = pred_grid)
pred_grid$harm_pred <- predict(model_gam_harm, newdata = pred_grid)

# Step 4: Plot the prediction curves
library(ggplot2)
ggplot(pred_grid, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1.2) +
  geom_line(aes(y = death_pred, color = "Death (scaled)"), size = 1.2) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.2, linetype = "dashed") +
  labs(
    title = "GAM-Predicted DV, Death, and Harm by Lockdown Length",
    subtitle = "Scenario: Low income support, High workplace closure, Active lockdown, Large population",
    x = "Lockdown Duration (days)",
    y = "Predicted Scaled Outcome",
    color = "Outcome"
  ) +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Death (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()

summary(model_gam_death)
summary(model_gam_dv)
summary(model_gam_harm)



#splines models
# Step 2: Fit spline models with interactions
model_spline_dv <- lm(dv_scaled ~ ns(long_lockdown, df = 4) * income_support_cat + 
                        ns(long_lockdown, df = 4) * workplace_closure_cat,
                      data = multiple_model_df)

model_spline_death <- lm(death_scaled ~ ns(long_lockdown, df = 4) * income_support_cat + 
                           ns(long_lockdown, df = 4) * workplace_closure_cat,
                         data = multiple_model_df)

model_spline_harm <- lm(composite_harm ~ ns(long_lockdown, df = 4) * income_support_cat + 
                          ns(long_lockdown, df = 4) * workplace_closure_cat,
                        data = multiple_model_df)

# Step 3: Create prediction grid for selected scenario
pred_grid <- expand.grid(
  long_lockdown = seq(min(multiple_model_df$long_lockdown), min(100, max(multiple_model_df$long_lockdown)), by = 1),
  income_support_cat = 1,
  workplace_closure_cat = 1
)

pred_grid$dv_pred <- predict(model_spline_dv, newdata = pred_grid)
pred_grid$death_pred <- predict(model_spline_death, newdata = pred_grid)
pred_grid$harm_pred <- predict(model_spline_harm, newdata = pred_grid)

# Step 4: Plot the prediction curves
ggplot(pred_grid, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1.2) +
  geom_line(aes(y = death_pred, color = "Death (scaled)"), size = 1.2) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.2, linetype = "dashed") +
  labs(
    title = "Spline-Predicted DV, Death, and Harm by Lockdown Length",
    subtitle = "Scenario: Low income support, High workplace closure, Death category 3",
    x = "Lockdown Duration (days)",
    y = "Predicted Scaled Outcome",
    color = "Outcome"
  ) +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Death (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()




#another method

# Step 2: Fit spline models with continuous + categorical features
model_spline_dv <- lm(dv_scaled ~ ns(long_lockdown, df = 4) + 
                        ns(Monthly_income_support, df = 4) + 
                        ns(Monthly_workplace_closures_severity, df = 4),
                      data = multiple_model_df)

model_spline_death <- lm(death_scaled ~ ns(long_lockdown, df = 4) + 
                           ns(Monthly_income_support, df = 4) + 
                           ns(Monthly_workplace_closures_severity, df = 4),
                         data = multiple_model_df)

model_spline_harm <- lm(composite_harm ~ ns(long_lockdown, df = 4) + 
                          ns(Monthly_income_support, df = 4) + 
                          ns(Monthly_workplace_closures_severity, df = 4),
                        data = multiple_model_df)

# Step 3: Define median values for high/low categories to simulate scenarios
median_income_low <- median(multiple_model_df$Monthly_income_support[multiple_model_df$income_support_cat == 1], na.rm = TRUE)
median_income_high <- median(multiple_model_df$Monthly_income_support[multiple_model_df$income_support_cat == 2], na.rm = TRUE)

median_workplace_low <- median(multiple_model_df$Monthly_workplace_closures_severity[multiple_model_df$workplace_closure_cat == 1], na.rm = TRUE)
median_workplace_high <- median(multiple_model_df$Monthly_workplace_closures_severity[multiple_model_df$workplace_closure_cat == 2], na.rm = TRUE)

mean_income_low <- mean(multiple_model_df$Monthly_income_support[multiple_model_df$income_support_cat == 1], na.rm = TRUE)
mean_income_high <- mean(multiple_model_df$Monthly_income_support[multiple_model_df$income_support_cat == 2], na.rm = TRUE)

mean_workplace_low <- mean(multiple_model_df$Monthly_workplace_closures_severity[multiple_model_df$workplace_closure_cat == 1], na.rm = TRUE)
mean_workplace_high <- mean(multiple_model_df$Monthly_workplace_closures_severity[multiple_model_df$workplace_closure_cat == 2], na.rm = TRUE)

# Step 4: Create prediction grid for selected scenario (High-High-3)
pred_grid <- expand.grid(
  long_lockdown = seq(min(multiple_model_df$long_lockdown), min(100, max(multiple_model_df$long_lockdown)), by = 1),
  Monthly_income_support = median_income_low,
  Monthly_workplace_closures_severity = median_workplace_low
)

pred_grid$dv_pred <- predict(model_spline_dv, newdata = pred_grid)
pred_grid$death_pred <- predict(model_spline_death, newdata = pred_grid)
pred_grid$harm_pred <- predict(model_spline_harm, newdata = pred_grid)

# Step 5: Plot the prediction curves
ggplot(pred_grid, aes(x = long_lockdown)) +
  geom_line(aes(y = dv_pred, color = "DV (scaled)"), size = 1.2) +
  geom_line(aes(y = death_pred, color = "Death (scaled)"), size = 1.2) +
  geom_line(aes(y = harm_pred, color = "Composite Harm"), size = 1.2, linetype = "dashed") +
  labs(
    title = "Spline-Predicted DV, Death, and Harm by Lockdown Length",
    subtitle = "Scenario: High income support (median), High workplace closure (median), Death category 3",
    x = "Lockdown Duration (days)",
    y = "Predicted Scaled Outcome",
    color = "Outcome"
  ) +
  scale_color_manual(values = c("DV (scaled)" = "tomato", "Death (scaled)" = "steelblue", "Composite Harm" = "black")) +
  theme_minimal()
