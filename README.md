# Data Dictionary

## 1. covid_monthly_domesticviolence.xlsx
**Description**: _[Write a general description of this dataset]_ 

**Columns:**
- `Region`: _[your description here]_ 
- `Sub region`: _[your description here]_ 
- `Country`: _[your description here]_ 
- `Indicator`: _[your description here]_ 
- `Oct_2019`: _[your description here]_ 
- `Nov_2019`: _[your description here]_ 
- `Dec_2019`: _[your description here]_ 
- `Jan_2020`: _[your description here]_ 
- `Feb_2020`: _[your description here]_ 
- `Mar_2020`: _[your description here]_ 
- `Apr_2020`: _[your description here]_ 
- `May_2020`: _[your description here]_ 
- `Jun_2020`: _[your description here]_ 
- `Jul_2020`: _[your description here]_ 
- `Aug_2020`: _[your description here]_ 

**Structure (`glimpse`)**:
Rows: 129
Columns: 15
$ Region       <chr> "Europe", "Americas", "Europe", "Europe", "Europe", "Europe", "Americas", "Amer…
$ `Sub region` <chr> "Southern Europe", "Latin America and the Caribbean", "Southern Europe", "South…
$ Country      <chr> "ALBANIA", "ANTIGUA AND BARBUDA", "BOSNIA AND HERZEGOVINA", "BOSNIA AND HERZEGO…
$ Indicator    <chr> "Sexual violence or physical assault by IPFM*  (domestic violence): Total numbe…
$ Oct_2019     <dbl> 112, 5, 109, 30, 3, 27, 9903, 1224, 3888, 0, 1, 0, 1, NA, NA, NA, NA, NA, 176, …
$ Nov_2019     <dbl> 81, 5, 104, 32, 2, 30, 9886, 1193, 3983, 0, 1, 0, 0, NA, NA, NA, NA, NA, 155, 2…
$ Dec_2019     <dbl> 113, 1, 131, 34, 3, 31, 10883, 1304, 4224, 0, 1, 0, 0, NA, NA, NA, NA, NA, 184,…
$ Jan_2020     <dbl> 111, 6, 73, 38, 5, 33, 11178, 1222, 4294, 0, 2, 0, 0, NA, NA, NA, NA, NA, 190, …
$ Feb_2020     <dbl> 90, 6, 95, 57, 2, 55, 9899, 1124, 3680, 0, 0, 0, 2, NA, NA, NA, NA, NA, 222, 5,…
$ Mar_2020     <dbl> 90, 7, 88, 49, 5, 44, 9578, 1035, 3626, 0, 1, 0, 2, NA, NA, NA, NA, NA, 209, 1,…
$ Apr_2020     <dbl> 96, NA, 86, 40, 5, 35, 7776, 878, 2889, 0, 1, 0, 0, 7617, 0, 9, 1716, 538, 190,…
$ May_2020     <dbl> 127, NA, NA, NA, NA, NA, NA, NA, NA, 0, 0, 0, 0, 9674, 0, 3, 2216, 575, 222, 0,…
$ Jun_2020     <dbl> 159, NA, NA, NA, NA, NA, NA, NA, NA, 0, 3, 0, 1, 7690, 0, 5, 1703, 443, 292, 0,…
$ Jul_2020     <dbl> 158, NA, NA, NA, NA, NA, NA, NA, NA, 0, 2, 0, 0, 8167, 1, 1, 1985, 512, 250, 0,…
$ Aug_2020     <dbl> 174, NA, NA, NA, NA, NA, NA, NA, NA, 0, 5, 1, 2, 7289, 0, 2, 1684, 296, 295, 0,…

**Summary Statistics (`summary`)**:
    Region           Sub region          Country           Indicator            Oct_2019     
 Length:129         Length:129         Length:129         Length:129         Min.   :   0.0  
 Class :character   Class :character   Class :character   Class :character   1st Qu.:   3.0  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :  31.0  
                                                                             Mean   : 554.7  
                                                                             3rd Qu.: 251.0  
                                                                             Max.   :9903.0  
                                                                             NA's   :24      
    Nov_2019          Dec_2019          Jan_2020           Feb_2020          Mar_2020     
 Min.   :    0.0   Min.   :    0.0   Min.   :    0.00   Min.   :    0.0   Min.   :   0.0  
 1st Qu.:    3.0   1st Qu.:    3.0   1st Qu.:    2.75   1st Qu.:    2.0   1st Qu.:   3.0  
 Median :   32.0   Median :   49.5   Median :   34.00   Median :   35.0   Median :  33.0  
 Mean   :  515.5   Mean   :  585.0   Mean   :  568.65   Mean   :  540.0   Mean   : 467.5  
 3rd Qu.:  269.0   3rd Qu.:  372.2   3rd Qu.:  307.75   3rd Qu.:  288.2   3rd Qu.: 218.0  
 Max.   :10508.0   Max.   :11642.0   Max.   :13018.00   Max.   :12409.0   Max.   :9750.0  
 NA's   :16        NA's   :15        NA's   :17         NA's   :17        NA's   :12      
    Apr_2020         May_2020          Jun_2020         Jul_2020         Aug_2020      
 Min.   :   0.0   Min.   :   0.00   Min.   :   0.0   Min.   :   0.0   Min.   :   0.00  
 1st Qu.:   2.0   1st Qu.:   3.25   1st Qu.:   5.0   1st Qu.:   2.0   1st Qu.:   2.75  
 Median :  35.0   Median :  51.00   Median :  54.0   Median :  49.0   Median :  29.00  
 Mean   : 444.7   Mean   : 572.08   Mean   : 610.2   Mean   : 611.7   Mean   : 604.20  
 3rd Qu.: 216.5   3rd Qu.: 360.75   3rd Qu.: 331.0   3rd Qu.: 342.2   3rd Qu.: 295.25  
 Max.   :7776.0   Max.   :9674.00   Max.   :9122.0   Max.   :9377.0   Max.   :9056.00  
 NA's   :11       NA's   :43        NA's   :40       NA's   :43       NA's   :53       


---

## 2. death_rates.csv
**Description**: _[Write a general description of this dataset]_ 

**Columns:**
- `Entity`: _[your description here]_ 
- `Day`: _[your description here]_ 
- `Daily new confirmed deaths due to COVID-19 per million people (rolling 7-day average, right-aligned)`: _[your description here]_ 

**Structure (`glimpse`)**:
Rows: 480,085
Columns: 3
$ Entity                                                                                                 <chr> …
$ Day                                                                                                    <chr> …
$ `Daily new confirmed deaths due to COVID-19 per million people (rolling 7-day average, right-aligned)` <dbl> …

**Summary Statistics (`summary`)**:
    Entity              Day           
 Length:480085      Length:480085     
 Class :character   Class :character  
 Mode  :character   Mode  :character  
                                      
                                      
                                      
 Daily new confirmed deaths due to COVID-19 per million people (rolling 7-day average, right-aligned)
 Min.   :  0.0000                                                                                    
 1st Qu.:  0.0000                                                                                    
 Median :  0.0000                                                                                    
 Mean   :  0.6629                                                                                    
 3rd Qu.:  0.2464                                                                                    
 Max.   :129.2137                                                                                    


---

## 3. Mental_Health_Disorders_By_Country.csv
**Description**: _[Write a general description of this dataset]_ 

**Columns:**
- `measure_id`: _[your description here]_ 
- `measure_name`: _[your description here]_ 
- `location_id`: _[your description here]_ 
- `location_name`: _[your description here]_ 
- `sex_id`: _[your description here]_ 
- `sex_name`: _[your description here]_ 
- `age_id`: _[your description here]_ 
- `age_name`: _[your description here]_ 
- `cause_id`: _[your description here]_ 
- `cause_name`: _[your description here]_ 
- `metric_id`: _[your description here]_ 
- `metric_name`: _[your description here]_ 
- `year`: _[your description here]_ 
- `val`: _[your description here]_ 
- `upper`: _[your description here]_ 
- `lower`: _[your description here]_ 

**Structure (`glimpse`)**:
Rows: 125
Columns: 16
$ measure_id    <dbl> 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, …
$ measure_name  <chr> "Incidence", "Incidence", "Incidence", "Incidence", "Incidence", "Incidence", …
$ location_id   <dbl> 35, 35, 35, 35, 35, 14, 14, 14, 14, 14, 38, 38, 38, 38, 38, 15, 15, 15, 15, 15…
$ location_name <chr> "Georgia", "Georgia", "Georgia", "Georgia", "Georgia", "Maldives", "Maldives",…
$ sex_id        <dbl> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, …
$ sex_name      <chr> "Both", "Both", "Both", "Both", "Both", "Both", "Both", "Both", "Both", "Both"…
$ age_id        <dbl> 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22…
$ age_name      <chr> "All ages", "All ages", "All ages", "All ages", "All ages", "All ages", "All a…
$ cause_id      <dbl> 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558, 558…
$ cause_name    <chr> "Mental disorders", "Mental disorders", "Mental disorders", "Mental disorders"…
$ metric_id     <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
$ metric_name   <chr> "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number"…
$ year          <dbl> 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, …
$ val           <dbl> 200653.10, 200066.44, 199413.27, 218020.67, 235825.97, 16910.46, 17492.35, 180…
$ upper         <dbl> 228890.43, 229043.88, 229183.98, 271637.04, 294373.63, 19688.54, 20470.91, 212…
$ lower         <dbl> 175142.76, 174272.36, 172965.00, 172358.47, 184654.10, 14798.41, 15323.00, 157…

**Summary Statistics (`summary`)**:
   measure_id measure_name        location_id     location_name          sex_id    sex_name        
 Min.   :6    Length:125         Min.   : 14.00   Length:125         Min.   :3   Length:125        
 1st Qu.:6    Class :character   1st Qu.: 46.00   Class :character   1st Qu.:3   Class :character  
 Median :6    Mode  :character   Median : 72.00   Mode  :character   Median :3   Mode  :character  
 Mean   :6                       Mean   : 81.04                      Mean   :3                     
 3rd Qu.:6                       3rd Qu.: 99.00                      3rd Qu.:3                     
 Max.   :6                       Max.   :197.00                      Max.   :3                     
     age_id     age_name            cause_id    cause_name          metric_id metric_name       
 Min.   :22   Length:125         Min.   :558   Length:125         Min.   :1   Length:125        
 1st Qu.:22   Class :character   1st Qu.:558   Class :character   1st Qu.:1   Class :character  
 Median :22   Mode  :character   Median :558   Mode  :character   Median :1   Mode  :character  
 Mean   :22                      Mean   :558                      Mean   :1                     
 3rd Qu.:22                      3rd Qu.:558                      3rd Qu.:1                     
 Max.   :22                      Max.   :558                      Max.   :1                     
      year           val              upper             lower        
 Min.   :2017   Min.   :  15476   Min.   :  17842   Min.   :  13824  
 1st Qu.:2018   1st Qu.: 128502   1st Qu.: 148158   1st Qu.: 113504  
 Median :2019   Median : 240524   Median : 299750   Median : 190278  
 Mean   :2019   Mean   : 605231   Mean   : 709771   Mean   : 517097  
 3rd Qu.:2020   3rd Qu.: 867633   3rd Qu.: 984578   3rd Qu.: 758267  
 Max.   :2021   Max.   :4081038   Max.   :5058376   Max.   :3340443  


---

## 4. coronanet_release_Croatia.csv
**Description**: _[Write a general description of this dataset]_ 

**Columns:**
- `record_id`: _[your description here]_ 
- `policy_id`: _[your description here]_ 
- `entry_type`: _[your description here]_ 
- `update_type`: _[your description here]_ 
- `update_level`: _[your description here]_ 
- `update_level_var`: _[your description here]_ 
- `description`: _[your description here]_ 
- `date_announced`: _[your description here]_ 
- `date_start`: _[your description here]_ 
- `date_end`: _[your description here]_ 
- `date_end_spec`: _[your description here]_ 
- `country`: _[your description here]_ 
- `ISO_A3`: _[your description here]_ 
- `ISO_A2`: _[your description here]_ 
- `init_country_level`: _[your description here]_ 
- `domestic_policy`: _[your description here]_ 
- `province`: _[your description here]_ 
- `ISO_L2`: _[your description here]_ 
- `city`: _[your description here]_ 
- `type`: _[your description here]_ 
- `type_sub_cat`: _[your description here]_ 
- `type_new_admin_coop`: _[your description here]_ 
- `type_vac_cat`: _[your description here]_ 
- `type_vac_mix`: _[your description here]_ 
- `type_vac_reg`: _[your description here]_ 
- `type_vac_purchase`: _[your description here]_ 
- `type_vac_group`: _[your description here]_ 
- `type_vac_group_rank`: _[your description here]_ 
- `type_vac_who_pays`: _[your description here]_ 
- `type_vac_dist_admin`: _[your description here]_ 
- `type_vac_loc`: _[your description here]_ 
- `type_vac_cost_num`: _[your description here]_ 
- `type_vac_cost_scale`: _[your description here]_ 
- `type_vac_cost_unit`: _[your description here]_ 
- `type_vac_cost_gov_perc`: _[your description here]_ 
- `type_vac_amt_num`: _[your description here]_ 
- `type_vac_amt_scale`: _[your description here]_ 
- `type_vac_amt_unit`: _[your description here]_ 
- `type_vac_amt_gov_perc`: _[your description here]_ 
- `type_text`: _[your description here]_ 
- `institution_cat`: _[your description here]_ 
- `institution_status`: _[your description here]_ 
- `institution_conditions`: _[your description here]_ 
- `target_init_same`: _[your description here]_ 
- `target_country`: _[your description here]_ 
- `target_geog_level`: _[your description here]_ 
- `target_region`: _[your description here]_ 
- `target_province`: _[your description here]_ 
- `target_city`: _[your description here]_ 
- `target_intl_org`: _[your description here]_ 
- `target_other`: _[your description here]_ 
- `target_who_what`: _[your description here]_ 
- `target_who_gen`: _[your description here]_ 
- `target_direction`: _[your description here]_ 
- `travel_mechanism`: _[your description here]_ 
- `compliance`: _[your description here]_ 
- `enforcer`: _[your description here]_ 
- `pdf_link`: _[your description here]_ 
- `link`: _[your description here]_ 
- `collab`: _[your description here]_ 
- `collab_id`: _[your description here]_ 
- `date_updated`: _[your description here]_ 
- `recorded_date`: _[your description here]_ 

**Structure (`glimpse`)**:
Rows: 1,076
Columns: 63
$ record_id              <chr> "R_xl3bYOQlEZS2PTzBd", "R_1LUMHChPSjPtwZ5Bd", "R_AsPlgeMhH4QR4VXBd", …
$ policy_id              <chr> "7552320", "141874", "8281554", "8306399Ep", "8306399Eq", "8306399Gb"…
$ entry_type             <chr> "new_entry", "new_entry", "new_entry", "new_entry", "new_entry", "new…
$ update_type            <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Change of Po…
$ update_level           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Strengthenin…
$ update_level_var       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "timing of po…
$ description            <chr> "September 14, 2020: With Bulletin N. 262, the Italian Ministry of He…
$ date_announced         <date> 2020-09-14, 2020-04-07, 2020-02-25, 2020-03-11, 2020-03-11, 2020-03-…
$ date_start             <date> 2020-09-14, 2020-04-07, 2020-02-25, 2020-03-13, 2020-03-13, 2020-03-…
$ date_end               <date> 2020-09-15, NA, 2020-02-25, 2020-03-30, 2020-03-30, 2020-03-30, 2020…
$ date_end_spec          <chr> "The policy has a clear end date", "The policy’s end date is unknown …
$ country                <chr> "Albania,Andorra,Armenia,Austria,Azerbaijan,Belarus,Belgium,Bosnia an…
$ ISO_A3                 <chr> NA, NA, NA, "HRV", "HRV", "HRV", "HRV", "HRV", "HRV", "HRV", "HRV", "…
$ ISO_A2                 <chr> NA, NA, NA, "HR", "HR", "HR", "HR", "HR", "HR", "HR", "HR", "HR", "HR…
$ init_country_level     <chr> "National", "National", "National", "National", "National", "National…
$ domestic_policy        <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
$ province               <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ ISO_L2                 <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ city                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type                   <chr> "New Task Force, Bureau or Administrative Configuration", "New Task F…
$ type_sub_cat           <chr> "Cooperation among different jurisdictional entities (e.g. treaties o…
$ type_new_admin_coop    <chr> "Sharing information", NA, "Sharing information", NA, NA, NA, NA, NA,…
$ type_vac_cat           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_mix           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_reg           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_purchase      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_group         <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_group_rank    <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_who_pays      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_dist_admin    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_loc           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_cost_num      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_cost_scale    <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_cost_unit     <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_cost_gov_perc <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_amt_num       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_amt_scale     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_amt_unit      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_vac_amt_gov_perc  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ type_text              <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ institution_cat        <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ institution_status     <chr> NA, NA, NA, "Preschool or childcare facilities closed/locked down", "…
$ institution_conditions <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ target_init_same       <chr> "Yes", "No", "Yes", "No", "No", "No", "No", NA, NA, NA, NA, "Yes", "Y…
$ target_country         <chr> "Italy", "Argentina,Australia,Austria,Belgium,Brazil,Bulgaria,Canada,…
$ target_geog_level      <chr> "One or more countries, but not all countries", "One or more countrie…
$ target_region          <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ target_province        <chr> NA, NA, NA, "Istria", "Istria", "Istria", "Istria", NA, NA, NA, NA, N…
$ target_city            <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ target_intl_org        <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ target_other           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ target_who_what        <chr> "All Residents (Citizen Residents + Foreign Residents)", "All Residen…
$ target_who_gen         <chr> "No special population targeted", NA, "No special population targeted…
$ target_direction       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ travel_mechanism       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
$ compliance             <chr> "Mandatory (Unspecified/Implied)", "Mandatory (Unspecified/Implied)",…
$ enforcer               <chr> "Ministry/Department of Health", "National Government", "Ministry/Dep…
$ pdf_link               <chr> "https://tummgmt.eu.qualtrics.com/Q/File.php?F=F_SNuQoepgbNRNX0t", "h…
$ link                   <chr> "http://www.salute.gov.it/portale/nuovocoronavirus/dettaglioComunicat…
$ collab                 <chr> "CoronaNet (original)", "CoronaNet (original)", "CoronaNet (original)…
$ collab_id              <chr> NA, NA, NA, "JHU_2209_nursery_school,2209_primary_school,2209_sec_sch…
$ date_updated           <date> 2021-04-11, 2022-07-11, 2021-04-22, 2023-06-27, 2023-06-27, 2023-06-…
$ recorded_date          <dttm> 2021-04-11 12:32:02, 2022-07-11 23:59:59, 2021-04-22 16:51:46, 2023-…

**Summary Statistics (`summary`)**:
  record_id          policy_id          entry_type        update_type        update_level      
 Length:1076        Length:1076        Length:1076        Length:1076        Length:1076       
 Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                               
                                                                                               
                                                                                               
                                                                                               
 update_level_var   description        date_announced         date_start            date_end         
 Length:1076        Length:1076        Min.   :2020-01-23   Min.   :2020-01-23   Min.   :2020-01-25  
 Class :character   Class :character   1st Qu.:2020-05-03   1st Qu.:2020-05-10   1st Qu.:2020-05-18  
 Mode  :character   Mode  :character   Median :2020-12-18   Median :2020-12-13   Median :2021-02-15  
                                       Mean   :2020-12-17   Mean   :2020-12-16   Mean   :2021-04-17  
                                       3rd Qu.:2021-05-26   3rd Qu.:2021-05-18   3rd Qu.:2021-06-30  
                                       Max.   :2023-02-24   Max.   :2023-02-15   Max.   :2023-12-02  
                                                                                 NA's   :182         
 date_end_spec        country             ISO_A3             ISO_A2          init_country_level
 Length:1076        Length:1076        Length:1076        Length:1076        Length:1076       
 Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                               
                                                                                               
                                                                                               
                                                                                               
 domestic_policy   province            ISO_L2              city               type          
 Min.   :0.000   Length:1076        Length:1076        Length:1076        Length:1076       
 1st Qu.:0.000   Class :character   Class :character   Class :character   Class :character  
 Median :1.000   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
 Mean   :0.658                                                                              
 3rd Qu.:1.000                                                                              
 Max.   :1.000                                                                              
                                                                                            
 type_sub_cat       type_new_admin_coop type_vac_cat       type_vac_mix       type_vac_reg      
 Length:1076        Length:1076         Length:1076        Length:1076        Length:1076       
 Class :character   Class :character    Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character    Mode  :character   Mode  :character   Mode  :character  
                                                                                                
                                                                                                
                                                                                                
                                                                                                
 type_vac_purchase  type_vac_group     type_vac_group_rank type_vac_who_pays  type_vac_dist_admin
 Length:1076        Length:1076        Mode:logical        Length:1076        Length:1076        
 Class :character   Class :character   NA's:1076           Class :character   Class :character   
 Mode  :character   Mode  :character                       Mode  :character   Mode  :character   
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
 type_vac_loc       type_vac_cost_num  type_vac_cost_scale type_vac_cost_unit type_vac_cost_gov_perc
 Length:1076        Length:1076        Mode:logical        Mode:logical       Mode:logical          
 Class :character   Class :character   NA's:1076           NA's:1076          NA's:1076             
 Mode  :character   Mode  :character                                                                
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 type_vac_amt_num   type_vac_amt_scale type_vac_amt_unit  type_vac_amt_gov_perc  type_text        
 Length:1076        Length:1076        Length:1076        Min.   :100           Length:1076       
 Class :character   Class :character   Class :character   1st Qu.:100           Class :character  
 Mode  :character   Mode  :character   Mode  :character   Median :100           Mode  :character  
                                                          Mean   :100                             
                                                          3rd Qu.:100                             
                                                          Max.   :100                             
                                                          NA's   :1075                            
 institution_cat    institution_status institution_conditions target_init_same   target_country    
 Length:1076        Length:1076        Length:1076            Length:1076        Length:1076       
 Class :character   Class :character   Class :character       Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character       Mode  :character   Mode  :character  
                                                                                                   
                                                                                                   
                                                                                                   
                                                                                                   
 target_geog_level  target_region      target_province    target_city        target_intl_org
 Length:1076        Length:1076        Length:1076        Length:1076        Mode:logical   
 Class :character   Class :character   Class :character   Class :character   NA's:1076      
 Mode  :character   Mode  :character   Mode  :character   Mode  :character                  
                                                                                            
                                                                                            
                                                                                            
                                                                                            
 target_other       target_who_what    target_who_gen     target_direction   travel_mechanism  
 Length:1076        Length:1076        Length:1076        Length:1076        Length:1076       
 Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                               
                                                                                               
                                                                                               
                                                                                               
  compliance          enforcer           pdf_link             link              collab         
 Length:1076        Length:1076        Length:1076        Length:1076        Length:1076       
 Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                               
                                                                                               
                                                                                               
                                                                                               
  collab_id          date_updated        recorded_date                   
 Length:1076        Min.   :2020-04-03   Min.   :2020-04-03 15:01:23.00  
 Class :character   1st Qu.:2022-07-10   1st Qu.:2022-07-10 19:29:23.00  
 Mode  :character   Median :2022-10-12   Median :2022-10-12 23:59:59.00  
                    Mean   :2022-11-15   Mean   :2022-11-15 19:32:33.08  
                    3rd Qu.:2023-06-13   3rd Qu.:2023-06-13 15:59:03.00  
                    Max.   :2023-11-15   Max.   :2023-11-15 04:10:57.00  
                                                                         


---

