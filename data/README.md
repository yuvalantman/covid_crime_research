# Data Dictionary

## 1. covid_monthly_domesticviolence.xlsx
**Description**: this is a monthly count of domestic violence cases across 34 countries during the beginning of COVID-19

**Columns:**
- `Region`: self explenatory
- `Sub region`: not-used 
- `Country`: country indicator 
- `Indicator`: the domestic violence indicator - sexual/physical, female/male victim 
- `Oct_2019`: monthly indicator (has numeric count per country per indicator)
- `Nov_2019`: monthly indicator (has numeric count per country per indicator) 
- `Dec_2019`: monthly indicator (has numeric count per country per indicator) 
- `Jan_2020`: monthly indicator (has numeric count per country per indicator) 
- `Feb_2020`: monthly indicator (has numeric count per country per indicator) 
- `Mar_2020`: monthly indicator (has numeric count per country per indicator) 
- `Apr_2020`: monthly indicator (has numeric count per country per indicator) 
- `May_2020`: monthly indicator (has numeric count per country per indicator) 
- `Jun_2020`: monthly indicator (has numeric count per country per indicator) 
- `Jul_2020`: monthly indicator (has numeric count per country per indicator) 
- `Aug_2020`: monthly indicator (has numeric count per country per indicator) 

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
**Description**: a 3 column dataset that will tell us the daily and by that monthly deaths from COVID-19 for 2020 and on if we need it 

**Columns:**
- `Entity`: the country indicator 
- `Day`: daily date from the start of 2020 
- `Daily new confirmed deaths due to COVID-19 per million people (rolling 7-day average, right-aligned)`: a 7 day rolling avarage of new deaths from COVID-19

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

## 3. coronanet_release_Croatia.csv
**Description**: an example dataset of the policies in this country, we will take the lockdowns and iterpert from that, we have a dataset like this for each of our countries 

**Columns:**
- `record_id`: not used or important 
- `policy_id`: not used or important  
- `entry_type`: not used or important 
- `update_type`: not used or important  
- `update_level`: not used or important 
- `update_level_var`: not used or important 
- `description`: the full description of the policy/lockdown for our use and filtering 
- `date_announced`: when was it announced 
- `date_start`: when did it start 
- `date_end`: when did it end
- `date_end_spec`: not used or important  
- `country`: country indicator 
- `ISO_A3`: not used or important  
- `ISO_A2`: not used or important  
- `init_country_level`: is it national, regional or provencial
- `domestic_policy`: is it domestic or worldwide
- `province`: not used or important  
- `ISO_L2`: not used or important  
- `city`: not used or important 
- `type`: specified if its lockdown or something else 
- `type_sub_cat`: not used or important  
- `type_new_admin_coop`: not used or important  
- `type_vac_cat`: not used or important 
- `type_vac_mix`: not used or important  
- `type_vac_reg`: not used or important  
- `type_vac_purchase`: not used or important 
- `type_vac_group`: not used or important  
- `type_vac_group_rank`: not used or important  
- `type_vac_who_pays`: not used or important  
- `type_vac_dist_admin`: not used or important 
- `type_vac_loc`: not used or important  
- `type_vac_cost_num`: not used or important  
- `type_vac_cost_scale`: not used or important  
- `type_vac_cost_unit`: not used or important  
- `type_vac_cost_gov_perc`: not used or important  
- `type_vac_amt_num`: not used or important  
- `type_vac_amt_scale`: not used or important  
- `type_vac_amt_unit`: not used or important  
- `type_vac_amt_gov_perc`: not used or important  
- `type_text`: not used or important  
- `institution_cat`: not used or important  
- `institution_status`: not used or important  
- `institution_conditions`: not used or important  
- `target_init_same`: not used or important 
- `target_country`: not used or important  
- `target_geog_level`: not used or important  
- `target_region`: not used or important  
- `target_province`: not used or important  
- `target_city`: not used or important  
- `target_intl_org`: not used or important  
- `target_other`: not used or important  
- `target_who_what`: is it for all residents or just visitors or based on age 
- `target_who_gen`: not used or important  
- `target_direction`: not used or important  
- `travel_mechanism`: not used or important  
- `compliance`: mandatory/voluntary 
- `enforcer`: not used or important 
- `pdf_link`: not used or important 
- `link`: not used or important 
- `collab`: not used or important  
- `collab_id`: not used or important  
- `date_updated`: not used or important 
- `recorded_date`: not used or important  

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

## 4. UNE_TUNE_SEX_AGE_NB_M-filtered-2025-05-18.csv
**Description**: an unemployment monthly count by country and age ranges 

**Columns:**
- `ref_area.label`: country indicator 
- `source.label`: the source from which the data came from 
- `indicator.label`: the indicator which is usually unemployment but by what count
- `sex.label`: sex 
- `classif1.label`: age range or other classifiers
- `time`: month and year
- `obs_value`: count value by the count on the indicator 
- `obs_status.label`: wether the count is reliable or not (mostly reliable)
- `note_classif.label`: notes on the classifier
- `note_indicator.label`: notes on the indicator 
- `note_source.label`: notes on the source 

**Structure (`glimpse`)**:
Rows: 7,970
Columns: 11
$ ref_area.label       <chr> "Australia", "Australia", "Australia", "Australia", "Australia", "Austr…
$ source.label         <chr> "LFS - Labour Force Survey", "LFS - Labour Force Survey", "LFS - Labour…
$ indicator.label      <chr> "Unemployment by sex and age (thousands)", "Unemployment by sex and age…
$ sex.label            <chr> "Total", "Total", "Total", "Total", "Total", "Total", "Total", "Total",…
$ classif1.label       <chr> "Age (Youth, adults): 15+", "Age (Youth, adults): 15-64", "Age (Youth, …
$ time                 <chr> "2020M12", "2020M12", "2020M12", "2020M12", "2020M12", "2020M12", "2020…
$ obs_value            <dbl> 859.814, 843.707, 301.252, 558.562, 859.814, 301.252, 432.529, 109.927,…
$ obs_status.label     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
$ note_classif.label   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
$ note_indicator.label <chr> "Frequency: Monthly", "Frequency: Monthly", "Frequency: Monthly", "Freq…
$ note_source.label    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…

**Summary Statistics (`summary`)**:
 ref_area.label     source.label       indicator.label     sex.label         classif1.label    
 Length:7970        Length:7970        Length:7970        Length:7970        Length:7970       
 Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                               
                                                                                               
                                                                                               
                                                                                               
     time             obs_value       obs_status.label   note_classif.label note_indicator.label
 Length:7970        Min.   :    0.0   Length:7970        Length:7970        Length:7970         
 Class :character   1st Qu.:   58.0   Class :character   Class :character   Class :character    
 Mode  :character   Median :  169.8   Mode  :character   Mode  :character   Mode  :character    
                    Mean   :  644.4                                                             
                    3rd Qu.:  592.5                                                             
                    Max.   :22504.1                                                             
                    NA's   :59                                                                  
 note_source.label 
 Length:7970       
 Class :character  
 Mode  :character  
                   
                   
                   
                   


---

