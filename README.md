Domestic Violence & COVID-19 Lockdown Project
================

- [📊 Domestic Violence & COVID-19 Lockdown Impact – Cross-National
  Analysis](#bar_chart-domestic-violence--covid-19-lockdown-impact--cross-national-analysis)
  - [📁 Folder Structure](#file_folder-folder-structure)
    - [`data/`](#data)
    - [`proposal/`](#proposal)
    - [`report/`](#report)
    - [`scripts/`](#scripts)
    - [`useful_files/`](#useful_files)
    - [`Visualizations/`](#visualizations)
  - [🛠️ How to Run the
    Project](#hammer_and_wrench-how-to-run-the-project)
    - [1️⃣ **Prepare the Data**](#one-prepare-the-data)
    - [2️⃣ **Run the Scripts**](#two-run-the-scripts)
  - [🔬 Methodology Summary](#microscope-methodology-summary)
  - [📌 Notes](#pushpin-notes)
  - [👤 Authors](#bust_in_silhouette-authors)

# 📊 Domestic Violence & COVID-19 Lockdown Impact – Cross-National Analysis

This repository contains the full workflow and documentation for a
research project analyzing the **effects of COVID-19 lockdown policies
on domestic violence trends** across multiple countries. The project
investigates policy trade-offs, after-effects, and optimal lockdown
thresholds using data engineering and statistical modeling in R.

------------------------------------------------------------------------

## 📁 Folder Structure

### `data/`

- **Empty by default.**
- To run any scripts, **download and extract the full dataset** from the
  shared \[Google Drive link in the report document\] and place **all
  files here**.
- Data includes DV indicators, OxCGRT policy data, death rates, and
  socioeconomic variables.

------------------------------------------------------------------------

### `proposal/`

- Contains:
  - `Project_Proposal.Rmd` – Markdown of the original proposal.
  - `proposal_readme.md` – Brief summary and motivation.
  - `proposal.pdf` – Final submitted project proposal.

------------------------------------------------------------------------

### `report/`

- Contains the final written report:
  - `final_report.docx`
  - `final_report.pdf`

------------------------------------------------------------------------

### `scripts/`

Organized into three functional subfolders:

#### 🔹 `filtering_codes/` – Data Preparation

1.  `data_filtering.R`  
    ⤷ **Run first**. Loads and filters raw OxCGRT and DV data.

2.  `lockdown_deathR_incomesupport_filter.R`  
    ⤷ **Run second**. Combines multiple sources and normalizes key
    policy and outcome features.

3.  `policy_filter.R`  
    ⤷ Filters data for **Stage 1** of the results in the report
    (policy-focused models).

4.  `feature_engineering.R`  
    ⤷ Builds features used in **Stages 2 & 3**, including after-effect
    measures and harm indicators.

------------------------------------------------------------------------

#### 🔹 `models/` – Modeling Code

1.  `policy_models.R`  
    ⤷ Runs models and analysis for **Stage 1** of the report (policy–DV
    correlations).

2.  `modeling.R`  
    ⤷ Core script for **Stage 3** (spline regression + model
    comparisons).  
    ⤷ Contains the final model with tradeoff visualizations and results
    used in the report.

------------------------------------------------------------------------

#### 🔹 `visuals/` – Visualization Scripts

1.  `Policy_Visuals.R`  
    ⤷ Generates plots for **Stage 1** policy analysis.

2.  `after_effect_vis.R`  
    ⤷ Visualizes lagged after-effects of lockdowns using features built
    earlier (Stage 2).

------------------------------------------------------------------------

### `useful_files/`

- `papers/` folder contains academic sources used throughout the
  project.
- `column_readme.md` gives a **column-by-column data description** for
  merged datasets.
- Additional notes and references included.

------------------------------------------------------------------------

### `Visualizations/`

- Contains **all project plots and visualizations**, categorized by
  modeling stage.
- Includes additional visuals created during exploratory work.

------------------------------------------------------------------------

## 🛠️ How to Run the Project

### 1️⃣ **Prepare the Data**

1.  Download the full dataset from the **Google Drive link provided in
    the report**.
2.  Extract all files into the `data/` folder in this repository.

------------------------------------------------------------------------

### 2️⃣ **Run the Scripts**

- All scripts are written in **R** and include necessary `library()`
  calls.
- To run any script, **extract the script** (copy it) into the **main
  folder**, then run it in RStudio or your terminal.
  - This ensures proper access to relative file paths for
    reading/writing.

> *You do **not** need to pre-load libraries or set up environments —
> each script is self-contained.*

------------------------------------------------------------------------

## 🔬 Methodology Summary

- Combines lockdown policy data, domestic violence indicators, and
  COVID-19 mortality across countries.
- Explores:
  - Stage 1: Direct associations between policy strictness and DV
  - Stage 2: Lagged after-effects of lockdown on DV and mortality
  - Stage 3: Tradeoff modeling using composite harm indicators

------------------------------------------------------------------------

## 📌 Notes

- Most data files are confidential or complex — full data access
  requires manual download.
- Some visualizations depend on intermediate files created by earlier
  scripts (e.g., `feature_engineering.R` must be run before
  `after_effect_vis.R`).

------------------------------------------------------------------------

## 👤 Authors

**Yuval Antman, Klil Harburger, Idan Schreiber, Rotem Azriel**  
Second-Year Data Engineering Students  
Ben-Gurion University of the Negev

> Questions? Reach out via GitHub or the report contact email.
