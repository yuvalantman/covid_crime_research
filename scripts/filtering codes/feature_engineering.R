# R Script: Feature Engineering for DV & COVID Project

# Load required packages
library(dplyr)
library(readr)
library(lubridate)

# Load the dataset (change path if needed)
df <- read_csv("data/Monthly_features_one_indicator.csv")

# Convert Month column to Date and clean country names
df <- df %>%
  mutate(
    Month = as.Date(paste0(Month, "-01")),
    Entity = tolower(Entity)
  )

# Step 1: Compute mean post-March deaths per country
death_category_df <- df %>%
  filter(Month > as.Date("2020-03-01")) %>%
  group_by(Entity) %>%
  summarise(mean_deaths_post_march = mean(Monthly_death_rates_per_million_people, na.rm = TRUE)) %>%
  mutate( death_category = case_when(
    mean_deaths_post_march < 5 ~ 1,           # Low
    mean_deaths_post_march < 30 ~ 2,          # Medium
    TRUE ~ 3                                  # High
    )
  )

# Step 2: Identify first month with >1 death/million as alternative baseline
baseline_df <- df %>%
  filter(Month >= as.Date("2020-03-01"), Monthly_death_rates_per_million_people > 1) %>%
  group_by(Entity) %>%
  slice_min(Month, n = 1) %>%
  select(Entity, Month) %>%
  rename(first_sig_death_month = Month)

# Step 3: Merge country-level summaries
df <- df %>%
  left_join(death_category_df, by = "Entity") %>%
  left_join(baseline_df, by = "Entity")

# Step 4: Create features and lag metrics
df <- df %>%
  arrange(Entity, Month) %>%
  group_by(Entity) %>%
  mutate(
    # Percent change from previous month
    death_pct_change_prev = ifelse(
      lag(Monthly_death_rates_per_million_people) > 0,
      (Monthly_death_rates_per_million_people - lag(Monthly_death_rates_per_million_people)) / lag(Monthly_death_rates_per_million_people),
      NA_real_
    ),
    
    # Lag features (skip those already existing in original dataset)
    lag_dv_pct_prev = lag(dv_percent_change_prev),
    lag_dv_pct_baseline = lag(dv_percent_change_baseline),
    lag_death_pct_prev = lag(death_pct_change_prev),
    
    # Flags for modeling
    had_significant_deaths = ifelse(mean_deaths_post_march >= 5, 1, 0),
    had_long_lockdown = ifelse(long_lockdown >= 1, 1, 0),
    ever_had_long_lockdown = ifelse(any(long_lockdown >= 1, na.rm = TRUE), 1, 0),
    
    # Log transform for stability
    log_deaths = log1p(Monthly_death_rates_per_million_people),
    log_dv = log1p(Violence_per_million_people),
    
    # Lockdown wave detection
    long_lockdown_lag = lag(long_lockdown, default = 0),
    new_wave = ifelse(long_lockdown > 0 & (long_lockdown_lag == 0 | long_lockdown < long_lockdown_lag), 1, 0),
    lockdown_wave = ifelse(long_lockdown > 0, cumsum(new_wave), NA),
    
    # Refined lockdown intensity normalized by days in month (assume 30 days for simplicity or use lubridate::days_in_month(Month))
    normalized_lockdown_intensity = Lockdown_severity / days_in_month(as.Date(paste0(Month, "-01"))),
    
    # Weighted lockdown score
    #lockdown_power = long_lockdown * normalized_lockdown_intensity,
    
    lockdown_power_raw = Total_lockdown_length * normalized_lockdown_intensity,
    had_long_lockdown_prev = lag(had_long_lockdown, default = 0),
    lockdown_power = ifelse(
      had_long_lockdown == 1 & had_long_lockdown_prev == 1,
      lockdown_power_raw + lag(lockdown_power_raw),
      lockdown_power_raw
    ),
    
    # Stay-at-home power feature: rolling forward if two consecutive months have long lockdown
    stay_at_home_power_raw = Total_stay_at_home_requirements * normalized_lockdown_intensity,
    stay_at_home_power = ifelse(
      had_long_lockdown == 1 & had_long_lockdown_prev == 1,
      stay_at_home_power_raw + lag(stay_at_home_power_raw),
      stay_at_home_power_raw
    )
  ) %>%
  ungroup() %>%
  mutate(
    Month = format(Month, "%Y-%m")  # Convert Month back to 'month-year' format
  )

# Step 5: Summarised lockdown effects per country-wave
lockdown_summary_df <- df %>%
  filter(!is.na(lockdown_wave)) %>%
  group_by(Entity, lockdown_wave) %>%
  summarise(
    max_long_lockdown = max(long_lockdown, na.rm = TRUE),
    avg_lockdown_severity_during_wave = mean(Lockdown_severity, na.rm = TRUE),
    start_month = min(Month),
    end_month = max(Month),
    .groups = 'drop'
  ) %>%
  left_join(
    df %>% group_by(Entity) %>% summarise(
      death_category = first(death_category),
      Region = first(Region),
      Population = first(Population),
      Indicator = first(Indicator),
      .groups = 'drop'
    ),
    by = "Entity"
  ) %>%
  rowwise() %>%
  mutate(
    # Include the last month if Total_lockdown_length < 30, otherwise strictly after
    last_month_value = df$Total_lockdown_length[df$Entity == Entity & df$Month == end_month],
    
    violence_avg_post_lockdown = mean(
      df$Violence_per_million_people[df$Entity == Entity & (
        (df$Month > end_month) |
          (df$Month == end_month & last_month_value < 30))
      ],
      na.rm = TRUE
    ),
    
    dv_pct_change_baseline_post_lockdown = mean(
      df$dv_percent_change_baseline[df$Entity == Entity & (
        (df$Month > end_month) |
          (df$Month == end_month & last_month_value < 30))
      ],
      na.rm = TRUE
    ),
    
    avg_income_support_post_lockdown = mean(
      df$Monthly_income_support[df$Entity == Entity & df$Month >= start_month],
      na.rm = TRUE
    ),
    
    avg_workplace_closure_post_lockdown = mean(
      df$Monthly_workplace_closures_severity[df$Entity == Entity & df$Month >= start_month],
      na.rm = TRUE
    ),
    
    violence_avg_during_lockdown = mean(
      df$Violence_per_million_people[df$Entity == Entity & df$Month >= start_month & df$Month <= end_month],
      na.rm = TRUE
    ),
    
    dv_pct_change_baseline_during_lockdown = mean(
      df$dv_percent_change_baseline[df$Entity == Entity & df$Month >= start_month & df$Month <= end_month],
      na.rm = TRUE
    ),
    
    dv_pct_change_post_vs_during = (
      violence_avg_post_lockdown - violence_avg_during_lockdown
    ) / violence_avg_during_lockdown
  ) %>%
  ungroup()

# Preview the final result
glimpse(df)
summary(df$Monthly_death_rates_per_million_people)
table(df$death_category, useNA = "ifany")

# View a sample
df %>%
  select(Entity, Month, Monthly_death_rates_per_million_people, death_pct_change_prev, death_category, had_significant_deaths) %>%
  filter(Month >= as.Date("2020-04-01")) %>%
  head(15)

write_csv(lockdown_summary_df, "data/lockdown_summary_aftereffects.csv")
write_csv(df, "data/total_features_to_work_with.csv")

