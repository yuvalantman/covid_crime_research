# ========================================================================
# DOMESTIC VIOLENCE COVID ANALYSIS - DATA PREPARATION & FEATURE ENGINEERING
# Course: SISE2601 Introduction to Data Science  
# Strategy: Power Relations & Policy Interaction Analysis
# ========================================================================

# Load required libraries
library(tidyverse)
library(lubridate)
library(corrplot)
library(cluster)
library(broom)

# ========================================================================
# PHASE 1: DATA LOADING & INITIAL EXAMINATION
# ========================================================================

# Load the primary complete dataset
dv_data <- read_csv("data/Monthly_features_one_indicator.csv")

# Load the extended dataשset for comparison and validation
dv_all_data <- read_csv("data/Monthly_features_with_all_data.csv")

# Initial data examination
glimpse(dv_data)
cat("Primary dataset dimensions:", dim(dv_data), "\n")
cat("Extended dataset dimensions:", dim(dv_all_data), "\n")

# Check for duplicates in the extended dataset
duplicates_check <- dv_all_data %>%
  group_by(Entity, Month, Indicator) %>%
  summarise(n_rows = n(), .groups = "drop") %>%
  filter(n_rows > 1)

cat("Duplicate entries in extended dataset:", nrow(duplicates_check), "\n")

# ========================================================================
# PHASE 2: DATA CLEANING & STANDARDIZATION
# ========================================================================

# Clean and standardize the primary dataset
dv_clean <- dv_data %>%
  # Convert month to proper date format
  mutate(
    Month_date = as.Date(paste0(Month, "-01")),
    Year = year(Month_date),
    Month_num = month(Month_date),
    # Clean entity names (lowercase for consistency)
    Entity = str_to_lower(str_trim(Entity)),
    # Handle missing values in key variables
    Total_lockdown_length = replace_na(Total_lockdown_length, 0),
    Monthly_income_support = replace_na(Monthly_income_support, 0),
    Monthly_death_rates_per_million_people = replace_na(Monthly_death_rates_per_million_people, 0)
  ) %>%
  # Create pandemic period indicators
  mutate(
    # Pre-pandemic: Oct 2019 - Feb 2020
    pandemic_period = case_when(
      Month_date <= as.Date("2020-02-01") ~ "pre_pandemic",
      Month_date >= as.Date("2020-03-01") & Month_date <= as.Date("2020-04-01") ~ "early_pandemic", 
      Month_date >= as.Date("2020-05-01") & Month_date <= as.Date("2020-06-01") ~ "mid_pandemic",
      Month_date >= as.Date("2020-07-01") ~ "late_pandemic"
    ),
    pandemic_period = factor(pandemic_period, 
                             levels = c("pre_pandemic", "early_pandemic", "mid_pandemic", "late_pandemic")),
    
    # Binary pandemic indicator
    is_pandemic = ifelse(Month_date >= as.Date("2020-03-01"), 1, 0),
    
    # Month since pandemic start (for temporal analysis)
    months_since_pandemic = ifelse(is_pandemic == 1, 
                                   as.numeric(Month_date - as.Date("2020-03-01"))/30.44, 
                                   NA)
  ) %>%
  # Remove problematic or incomplete observations
  filter(!is.na(Violence_Value), !is.na(Entity)) %>%
  arrange(Entity, Month_date)

# ========================================================================
# PHASE 3: FEATURE ENGINEERING - INTERACTION VARIABLES
# ========================================================================

# Create policy interaction and derived variables
dv_features <- dv_clean %>%
  group_by(Entity) %>%
  arrange(Month_date) %>%
  mutate(
    # ---- POLICY INTERACTION EFFECTS ----
    # Key interaction: Lockdown intensity × Economic support
    policy_economic_interaction = lockdown_intensity_per_day * Monthly_income_support,
    
    # Health stress interaction: Lockdown × Death rates  
    policy_health_interaction = lockdown_intensity_per_day * Monthly_death_rates_per_million_people,
    
    # Cumulative stress: Total lockdown × Lagged deaths
    cumulative_stress_interaction = Total_lockdown_length * lag_deaths_per_million,
    
    # ---- TEMPORAL DYNAMICS ----
    # Previous month lockdown intensity (for momentum effects)
    prev_lockdown_intensity = lag(lockdown_intensity_per_day, 1),
    
    # Lockdown escalation (change in intensity)
    lockdown_escalation = lockdown_intensity_per_day - prev_lockdown_intensity,
    
    # Economic support stability
    economic_support_change = Monthly_income_support - lag(Monthly_income_support, 1),
    
    # ---- CUMULATIVE MEASURES ----
    # Cumulative lockdown exposure
    cumulative_lockdown_days = cumsum(replace_na(Total_lockdown_length, 0)),
    
    # Cumulative death exposure
    cumulative_deaths = cumsum(replace_na(Monthly_death_rates_per_million_people, 0)),
    
    # ---- BASELINE & RELATIVE MEASURES ----
    # Pre-pandemic DV baseline (average Oct 2019 - Feb 2020)
    baseline_dv = ifelse(pandemic_period == "pre_pandemic", Violence_per_million_people, NA),
    baseline_dv = mean(baseline_dv, na.rm = TRUE),
    
    # Relative change from baseline
    dv_change_from_baseline = (Violence_per_million_people - baseline_dv) / baseline_dv * 100,
    
    # ---- STANDARDIZED MEASURES (for comparison) ----
    # Z-score standardization within country
    dv_z_score = scale(Violence_per_million_people)[,1],
    lockdown_z_score = scale(lockdown_intensity_per_day)[,1],
    economic_z_score = scale(Monthly_income_support)[,1]
  ) %>%
  ungroup()

# ========================================================================
# PHASE 4: COUNTRY TYPOLOGY CREATION
# ========================================================================

# Calculate country-level policy response characteristics
country_profiles <- dv_features %>%
  filter(is_pandemic == 1) %>%  # Only pandemic period
  group_by(Entity, Region) %>%
  summarise(
    # Policy response speed (early vs late)
    early_lockdown_intensity = mean(lockdown_intensity_per_day[pandemic_period == "early_pandemic"], na.rm = TRUE),
    avg_lockdown_intensity = mean(lockdown_intensity_per_day, na.rm = TRUE),
    max_lockdown_length = max(Total_lockdown_length, na.rm = TRUE),
    
    # Economic support characteristics
    avg_economic_support = mean(Monthly_income_support, na.rm = TRUE),
    max_economic_support = max(Monthly_income_support, na.rm = TRUE),
    economic_support_consistency = sd(Monthly_income_support, na.rm = TRUE),
    
    # Health impact
    total_death_burden = sum(Monthly_death_rates_per_million_people, na.rm = TRUE),
    peak_death_rate = max(Monthly_death_rates_per_million_people, na.rm = TRUE),
    
    # DV outcomes
    avg_dv_change = mean(dv_change_from_baseline, na.rm = TRUE),
    max_dv_increase = max(dv_change_from_baseline, na.rm = TRUE),
    dv_volatility = sd(dv_change_from_baseline, na.rm = TRUE),
    
    .groups = "drop"
  ) %>%
  # Replace NaN and infinite values
  mutate(across(where(is.numeric), ~ifelse(is.nan(.) | is.infinite(.), 0, .)))

# Create policy response typology using clustering
set.seed(123)  # For reproducibility

# Prepare clustering variables (standardized)
cluster_vars <- country_profiles %>%
  select(early_lockdown_intensity, avg_economic_support, total_death_burden) %>%
  scale()

# Determine optimal clusters using elbow method
wss <- map_dbl(1:6, ~{
  kmeans(cluster_vars, centers = .x, nstart = 20)$tot.withinss
})

# Use 4 clusters based on conceptual framework
k_clusters <- kmeans(cluster_vars, centers = 4, nstart = 20)

# Add cluster assignments and create meaningful labels
country_profiles <- country_profiles %>%
  mutate(
    cluster_id = k_clusters$cluster,
    policy_response_type = case_when(
      cluster_id == 1 ~ "Quick_Strong",     # High early lockdown + high support
      cluster_id == 2 ~ "Gradual_Moderate", # Moderate lockdown + moderate support  
      cluster_id == 3 ~ "Minimal_Response", # Low lockdown + low support
      cluster_id == 4 ~ "Economic_Focus"    # Moderate lockdown + high support
    ),
    policy_response_type = factor(policy_response_type)
  )

# ========================================================================
# PHASE 5: MERGE TYPOLOGY BACK TO MAIN DATASET
# ========================================================================

# Join country typology back to main analysis dataset
dv_final <- dv_features %>%
  left_join(
    country_profiles %>% select(Entity, policy_response_type, avg_economic_support, avg_lockdown_intensity),
    by = "Entity"
  ) %>%
  # Create additional categorical variables for modeling
  mutate(
    # High/low economic support (median split within pandemic data)
    high_economic_support = ifelse(Monthly_income_support > median(Monthly_income_support[is_pandemic==1], na.rm=TRUE), 1, 0),
    
    # High/low lockdown intensity
    high_lockdown_intensity = ifelse(lockdown_intensity_per_day > median(lockdown_intensity_per_day[is_pandemic==1], na.rm=TRUE), 1, 0),
    
    # Policy combination categories
    policy_combination = case_when(
      high_lockdown_intensity == 1 & high_economic_support == 1 ~ "High_Lock_High_Econ",
      high_lockdown_intensity == 1 & high_economic_support == 0 ~ "High_Lock_Low_Econ", 
      high_lockdown_intensity == 0 & high_economic_support == 1 ~ "Low_Lock_High_Econ",
      high_lockdown_intensity == 0 & high_economic_support == 0 ~ "Low_Lock_Low_Econ"
    ),
    policy_combination = factor(policy_combination)
  )

# ========================================================================
# PHASE 6: DATA QUALITY CHECKS & SUMMARY
# ========================================================================

# Check data completeness
data_completeness <- dv_final %>%
  summarise(
    total_observations = n(),
    complete_cases = sum(complete.cases(.)),
    countries = n_distinct(Entity),
    months = n_distinct(Month),
    pandemic_observations = sum(is_pandemic),
    pre_pandemic_observations = sum(1 - is_pandemic)
  )

print("=== DATA PREPARATION SUMMARY ===")
print(data_completeness)

# Key variables summary for pandemic period
pandemic_summary <- dv_final %>%
  filter(is_pandemic == 1) %>%
  select(dv_change_from_baseline, lockdown_intensity_per_day, Monthly_income_support, 
         policy_economic_interaction, policy_response_type) %>%
  summary()

print("=== PANDEMIC PERIOD VARIABLES SUMMARY ===")
print(pandemic_summary)

# Country typology distribution
typology_summary <- country_profiles %>%
  count(policy_response_type) %>%
  mutate(percentage = round(n/sum(n)*100, 1))

print("=== COUNTRY TYPOLOGY DISTRIBUTION ===")
print(typology_summary)

# Correlation matrix of key variables (pandemic period only)
correlation_vars <- dv_final %>%
  filter(is_pandemic == 1) %>%
  select(dv_change_from_baseline, lockdown_intensity_per_day, Monthly_income_support, 
         Monthly_death_rates_per_million_people, policy_economic_interaction) %>%
  cor(use = "complete.obs")

print("=== KEY VARIABLES CORRELATION MATRIX ===")
print(round(correlation_vars, 3))

# Save the prepared dataset
write_csv(dv_final, "dv_analysis_prepared.csv")
write_csv(country_profiles, "country_typology.csv")

print("=== DATA PREPARATION COMPLETE ===")
print("Files saved: dv_analysis_prepared.csv, country_typology.csv")
