# Data
All raw and processed data for calculations are found in this folder. The excel calculation files, which are located in the  [`/code`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/code) folder, also contain all of the data required for the calculations in each file.


## I. Raw data
#### Population data:
  01. 2019-2021 Mid-year Population Projection 5-year age groups IBGE, 2018: 
      - Data: [`/data/01_pop_age-group_2019-2021.xls`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/01_pop_age-group_2019-2021.xls)
      - Source: [IBGE population projections](https://www.ibge.gov.br/estatisticas/sociais/populacao/9109-projecao-da-populacao.html?=&t=downloads)
 
  02. 2000-2020 Abridged Life Tables from IBGE, revised 2013
      - Data:  [`/data/02_life_tables_2000-2020.xlsx`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/02_life_tables_2000-2020.xlsx)
      - Source: [IBGE](https://www.ibge.gov.br/en/statistics/social/population/17118-abridged-life-tables.html?=&t=o-que-e)  
    
#### Death data:
  03. 2019 all-cause deaths reported by the Ministry of Health (aggregated by state, sex, and age group) 
      - Data: [`/data/03_deaths_2019.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/03_deaths_2019.csv)
  04. 2019 monthly all-cause deaths reported by the Ministry of Health (aggregated by month, state, sex, and age group) 
      - Data: [`/data/04_deaths_2019_monthly.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/04_deaths_2019_monthly.csv)
  05. 2020 all-cause and COVID-19 deaths reported by the Ministry of Health (aggregated by state, sex, and age group)
      - Data: [`/data/05_deaths_2020_allcause_and_covid19.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/05_deaths_2020_allcause_and_covid19.csv)
  06. 2020 monthly all-cause deaths reported by the Ministry of Health (aggregated by month, state, sex, and age group)
      - Data: [`/data/06_deaths_2020_monthly.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/06_deaths_2020_monthly.csv)
  07. 2021 COVID-19 deaths reported through 4/30/2021 by state
      - Data: [`/data/07_deaths_2021_covid_brasilio.xlsx`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/07_deaths_2021_covid_brasilio.xlsx)
      - Source: [brasil.io/covid19/](https://brasil.io/covid19/)  
  08. SIVEP-Gripe: Data of all Severe Acute Respiratory Infection (SARI) Hospitalizations: (Organized by date of first symptom, so that records for which the data of first symptom was in 2020 are in the 2020 data (even if the death was in 2021), and the records for which the date of first symptom was in 2021 are included in the 2021 data) Note that this means in order to get the age and sex distribution of COVID-19 in-hospital deaths in 2021, we need to combine both the 2020 and 2021 data and keep only the records for which the COVID-19 deaths occurred in 2021.
      - Data, 2020: [Ministry of Health DATASUS, 2020 ](https://opendatasus.saude.gov.br/dataset/bd-srag-2020) (includes all records for which the date of first symptom was in 2020.
      - Data, 2021: [Ministry of Health DATASUS, 2021 ](https://opendatasus.saude.gov.br/dataset/bd-srag-2021) (includes all records for which the date of first symptom is in 2021).  
      *Both 2020 and 2021 datasets are routinely updated.*
 
  
## II. Processed data:
  09. 2019 Person-years by state, sex, and age group
      - Data: [`/data/09_person-years_2019.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/09_person-years_2019.csv)
  10. 2020 Person-years by state, sex, and age group
      - Data:  [`/data/10_person-years_2020.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/10_person-years_2020.csv)
  11. 2021 March 1 Population: *Projected from 2020 and 2021 mid-year populations
      - Data:  [`/data/11_pop_march2021.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/11_pop_march2021.csv)  
  12. 2021 Age- and sex-distribution of in-hospital confirmed COVID-19 deaths according SIVEP-Gripe:  
      - Data: [`/data/12_deaths_2021_covid_distribution.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/12_deaths_2021_covid_distribution.csv) 
  13. 2021 Age- and sex-distributed COVID-19 deaths through April 30<sup>th</sup>: *Estimated by applying the age- and sex-distribution from hospitalized COVID-19 deaths (in dataset 08) to the Brasil.io-reported COVID-19 deaths by state in 2021 through April 30th (dataset 07)*
      - Data:  [`/data/13_deaths_covid19_2021_distributed.csv`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data/13_deaths_covid19_2021_distributed.csv)



## License
The data collected and presented is licensed under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying code used to format, analyze and display that content is licensed under the [MIT license](http://opensource.org/licenses/mit-license.php). 

