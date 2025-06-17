# Income support during the COVID-19 pandemic - Data package

This data package contains the data that powers the chart ["Income support during the COVID-19 pandemic"](https://ourworldindata.org/grapher/income-support-covid?tab=table&time=earliest..2020-08-31&v=1&csvType=filtered&useColumnShortNames=false) on the Our World in Data website. It was downloaded on June 11, 2025.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:
tab: table
time: earliest..2020-08-31

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.

## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## Income support
Record if the government is providing direct cash payments to people who lose their jobs or cannot work. Note: only includes payments to firms if explicitly linked to payroll/salaries
Last updated: August 1, 2024  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Blavatnik School of Government, University of Oxford (2023) – with minor processing by Our World in Data

#### Full citation
Blavatnik School of Government, University of Oxford (2023) – with minor processing by Our World in Data. “Income support” [dataset]. Blavatnik School of Government, University of Oxford, “Government Response Tracker (OxCGRT)” [original data].
Source: Blavatnik School of Government, University of Oxford (2023) – with minor processing by Our World In Data

### What you should know about this data
* Possible categories:

- 0: no income support
- 1: government is replacing less than 50% of lost salary (or if a flat sum, it is less than 50% median salary)
- 2: government is replacing 50% or more of lost salary (or if a flat sum, it is greater than 50% median salary)

### Source

#### Blavatnik School of Government, University of Oxford – Government Response Tracker (OxCGRT)
Retrieved on: 2024-08-01  
Retrieved from: https://github.com/OxCGRT/covid-policy-dataset  


    