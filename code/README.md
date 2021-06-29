# Code

## Contents:  
- **Section I:** Estimating person-years lived and period rates  
- **Section II:** Estimating total deaths  
- **Section III:** Change in Life Expectancy Methods  

__________________________________________________________________________

## Section I: Estimating person-years lived and period rates

Description of the calculation of person-years is below. Person-years data are located in the  [`/data`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data) folder.

We calculated person-years for 2020 and 2019, accordingly:

1. Calculate the monthly exponential growth rate by state, sex, and age group between 2018 and 2019 midyear populations (for 2019 calculations) and between 2019 and 2020 (for 2020 calculations).  

2. Using the state-, sex-, and age group- specific exponential growth rate, interpolate monthly populations in the months intervening the mid-year population estimates.  

3. Calculate the monthly contribution of person years from those that die and those that survive each month, using the Ministry of Health's (MOH) Mortality Information System (SIM) deaths, aggregated by month, state, sex, and age group. Assuming those that dying in a given month from any cause contributed, on average 0.5/12 person-years that month, where survivors contributed 1/12 person-years. 

4. Calculate the yearly total person-years as the sum of the monthly contributions. 

For 2021, we approximated the population at risk by interpolating the IBGE population projection to the mid-analysis period (March 1, 2021)


## Section II: Estimating total deaths

Description of the source or construction of the all-cauase and COVID-19 data is below. Data are located in the [`/data`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/data) folder.

1. All-cause deaths:
    - 2019 and 2020: Death records reported by the Ministry of Health's (MOH) Mortality Information System (SIM) by state, age, and sex. (We excluded records that are missing age or sex, about 0.20% of all deaths in 2019 and 2020. (State was complete after we cleaned one error that the MOH told us to clean, this may be corrected in later versions of the SIM data: state == "5e" should be changed to "52", which is the state code for Goiás.)
    - 2021: To estimate total 2021 deaths including confirmed COVID-19 deaths (*<sub>n</sub>D<sup>COV</sup><sub>xM/sub>*) reported by [Brasil.io](https://brasil.io/covid19/), we assumed that individuals who did not die of COVID-19 in the first four months of 2021 would be subject to the 2019 age group- and sex-specific mortality rates. Thus we estimate total deaths in 2021, inclusive of COVID-19 deaths, as:
  
![formula_deaths](https://user-images.githubusercontent.com/43140693/123371876-8a572900-d550-11eb-95bb-5832f23db988.png)

where *<sub>n</sub>D<sub>x</sub>* is the number of deaths estimated to occur in 2021 in the age range *x* to *x + n*, *<sub>n</sub>K<sub>x</sub>*  is the population at risk in the age range *x* to *x + n*, _<sub>n</sub><sup>*</sup>D<sub>x</sub>_ are age-specific mortality rates in the absence of COVID-19 (assumed to be 2019 mortality rates), and *<sub>n</sub>D<sup>COV</sup><sub>x</sub>* is the number of confirmed COVID-19 deaths. 

2. COVID-19 Deaths: 
    - 2020: Deaths from the SIM death registry with the basic cause of death recorded as ICD code B342, U071, or U072.  
    * MOH treated data from most municipalities so that COVID-19 deaths were recorded with B342 as the basic cause of death (as per communication with the MOH contacts). 
    - 2021: Due to concerns for incomplete 2021 data in the SIM registry at the time of analysis, we used data from Brasil.io.


## Section III: Change in Life Expectancy Methods:
Our calculations for change in life expectancy rely on constructing life tables. Standard life table variables are listed below __[1]__.    

  - *<sub>n</sub>d<sub>x</sub>*: The expected number dying between ages *x* and *x + n*  
  - *<sub>n</sub>M<sub>x</sub>*: The death rate between ages *x* and *x + n*.  
  - *<sub>n</sub>q<sub>x</sub>*: The probability of dying between ages *x* and *x + n*  
  - *<sub>n</sub>d<sub>x</sub>*: The number of people dying between ages *x* and *x + n*  
  - *<sub>n</sub>p<sub>x*: The probability of surviving between ages *x* and *x + n*  
  - *l<sub>x</sub>*: Number of people left alive at age *x*
  - *<sub>n</sub>L<sub>x</sub>*: Number of person-years Lived by the cohort between ages *x* and *x + n* 
  - *T<sub>x</sub>*: The person-years lived above age *x*   
  - *e<sub>x</sub>*: Life expectancy at age *x*.  
  - *<sub>n</sub>a<sub>x</sub>*: Average person-years lived between ages *x* and *x + n* for those dying in the interval  

There are 3 approaches used to calculate change in life expectancy due to COVID-19:

__1. *e<sub>x</sub>* <sup>2019</sup> - *e<sub>x</sub>* <sup>2020</sup>:__ This is the main specification: we constructed single decrement period life tables for 2019 and 2020 that considered deaths rates from all causes (including COVID-19) by state, sex, and age group. For each state and sex, we calculated the difference between the two life tables to estimate reductions in *e<sub>0</sub>* and *e<sub>65</sub>* due to COVID-19 __(Supplementary Tables 1 and 2)__  
__2. DT19:__ Third, we calculated life tables based on the addition of COVID-19 mortality to the mortality pattern of 2019 (DT19). For the base-case scenario (absence of COVID-19), we used mortality rates reported in 2019, which we treated as cause-deleted life tables (i.e., there were no deaths from COVID-19 in 2019), and applied these to the population at risk to obtain expected deaths in the absence of COVID-19. Expected deaths in the presence of COVID-19 are calculated by assuming that individuals who do not die of COVID-19 in 2020 are subject to the mortality rates of 2019. __(Supplementary Tables 5 and 6)__  
__3. DT20:__ We calculated cause-deleted life tables for 2020 (DT20), which examine the consequences of eliminating COVID-19 mortality from 2020 deaths. __(Supplementary Tables 3 and 4)__  

__4. 2021:__ For 2021, we used a method similar to DT19, considering COVID-19 deaths in the first 4 months of 2021.

Below we present descriptions of how each method is preformed in Excel.

### 1. ex <sup>2019</sup> - ex <sup>2020</sup>:
The calculations for this method is simply subtracting the *e<sub>x</sub>* estimated for 2020 from those for 2019, using all cause deaths reported by the Ministry of Health (MOH). Calculations for 2019 and 2020 Life Tables using MOH death data are presented in the spreadsheet for the __DT20__ method. Results are presented in __Supplementary Table 1__ (*e<sub>0</sub>*) and __Supplementary Table 2__ (*e<sub>65</sub>*).



### 2. DT19:

The calculations for this method are presented in excel file [`/code/DT19.xlsx`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/code/DT19.xlsx). The excel file is organized into 3 sections:

-	__Summary:__ This sheet summarizes the results of the change in life expectancy calculations (labeled _Summary_)
-	__Analysis sheets:__ These sheets present the constructed the life tables considering COVID-19 deaths (labeled *0.Brazil_LT – 27. DF_LT*)
-	__Appendix sheets:__ These sheets presents the raw and processed data used as inputs for the life table calculations and other parts of the analysis (labeled _Appendix 1a – Appendix 4_)

The contents of the excel sheets are described individually below: 

__Summary__
This sheet summarizes the estimated change and percent change in life expectancy at birth (*e<sub>0</sub>*) (presented in  __Supplementary Table 3__) and age 65 (*e<sub>65</sub>*) (presented in __Supplementary Table 4__) using the DT19 method for Brazil and each of the 26 states and 1 Federal District in Brazil.


__0.Brazil_LT__
This sheet presents the DT19 life expectancy calculations for Brazil. Here we treat the 2019 base-case life tables (from IBGE) as the cause-deleted life tables, also known as associated single decrement life tables), which are a hypothetical set of life expectancies and other life tables quantities that would be expected if a single cause of death were eliminated **[1]**. In this case, COVID-19 is the eliminated cause and we thus back-calculate all-cause life tables for causes of death inclusive of COVID-19. The application of these methods to COVID-19 has been described in previous work **[2, 3]**.


1.	We calculated *<sub>n</sub>R<sub>x</sub>*, the age- and sex-specific ratio of deaths in the absence of COVID-19 to deaths with COVID-19. This ratio is similar to that described by Chiang’s method: the ratio of deaths from a single cause to deaths from all causes **[4]**. However, in this application, we replace the variable for deaths from a single cause with the variable deaths from all but one cause, so the ratio represents deaths from all but one cause to deaths from all causes. We used Chiang’s method which, as Andrasfay and Goldman previously note, assumes that the force of decrement from cause *i* (or in this case, all causes except *i*) is proportional to the force of decrement from all other causes  **[2, 4]**. (In contrast to this assumption, the potential dependence between COVID-19 and other causes might lead to modified probabilities of dying from other causes if COVID-19 were eliminated or added as a cause of death.)

<img width="637" alt="equation5" src="https://user-images.githubusercontent.com/43140693/112845943-71cf9380-9073-11eb-9bd6-c938060a50a8.png">


2.	To simplify subsequent calculations, we calculated the inverse of *<sub>n</sub>R<sub>x</sub>*, which is the ratio of deaths in the presence of COVID-19 to deaths in the absence of COVID-19.  
3.	We then calculated the probability of surviving from age *x* to age *x + n* (*<sub>n</sub>p<sub>x</sub>*), the probability of dying between ages *x* and *x + n* (*<sub>n</sub>q<sub>x</sub>*), and the average person-years lived in the interval by those dying in the interval (*<sub>n</sub>a<sub>x</sub>*) in the presence of COVID-19. 

We  applied standard life table relationships to complete these counterfactual life tables **[1]**. We calculated the probability of surviving from age x to age x + n (*<sub>n</sub>p<sub>x</sub>*), the probability of dying between ages x and x + n (*<sub>n</sub>q<sub>x</sub>*), and the average person-years lived in the interval by those dying in the interval (*<sub>n</sub>a<sub>x</sub>*):

 ![formula_1](https://user-images.githubusercontent.com/43140693/123362869-5e7f7780-d53f-11eb-97a9-6ec045bbc194.png)

where * indicates that the measure is from the life table that does not contain COVID-19 as a cause of death. 


We then applied standard life table relationships to complete the rest of the life tables in the presence of COVID-19 **[1]**.


__1.RO_LT – 27.DF_LF:__ (State and Federal District sheets)
These sheets (listed in full in the table below) repeat the life table calculations in sheet **0.Brazil_LT** for each of the 26 states and the Federal District in Brazil.


| *Sheet*        | *State/Federal District* | *Region*  |
| :---           | :---                 | :---          |
| **1.RO_LT**      | Rondônia	            |  North        | 
| **2.AC_LT**	     |  Acre	              | North         |
| **3.AM_LT**	     |  Amazonas	          | North         |
| **4.RR_LT**	     |  Roraima	            | North         |
| **5.PA_LT**	     |  Pará	              | North         |
| **6.AP_LT**	     |  Amapá	              | North         |
| **7.TO_LT**	     |  Tocantins	          | North         |
| **8.MA_LT**      |	Maranhão	          | Northeast     |
| **9.PI_LT**	     |  Piauí	              | Northeast     |
| **10.CE_LT**     |	Ceará	              | Northeast     |
| **11.RN_LT**	   |  Rio Grande do Norte	| Northeast     |
| **12.PB_LT**	   |  Paraíba	            | Northeast     |
| **13.PE_LT**	   |  Pernambuco	        | Northeast     |
| **14.AL_LT**	   |  Alagoas	            | Northeast     |
| **15.SE_LT**	   |  Sergipe	            | Northeast     |
| **16.BA_LT**	   |  Bahia	              | Northeast     |
| **17.MG_LT**	   |  Minas Gerais	      | Southeast     |
| **18.ES_LT**	   |  Espírito Santo      | Southeast     |
| **19.RJ_LT**	   |  Rio de Janeiro      | Southeast     |
| **20.SP_LT**	   |  São Paulo	          | Southeast     |
| **21.PR_LT**	   |  Paraná	            | South         |
| **22.SC_LT**	   |  Santa Catarina      | South         |
| **23.RS_LT**	   |  Rio Grande do Sul   | South         |
| **24.MS_LT**	   |  Mato Grosso do Sul  | Central West  |
| **25.MT_LT**	   |  Mato Grosso	        | Central West  |
| **26.GO_LT**	   |  Goiás	              | Central West  |
| **27.DF_LT**	   |  Distrito Federal    |	Central West  |


__Appendix 1a. Person-years 2020__
Person-years for 2020 by state, sex, and age group. Calculation for person-years are detailed in Section I above, and take into account the deaths that occurred in each month in 2020 as reported by MOH, and IBGE population projects.

__Appendix 1b. Person-years 2019__
Person-years for 2019 as calculated from IBGE population projections and MOH reported deaths by month, state, sex, and age group.

__Appendix 2a. Deaths 2020__
2020 all-cause and COVID-19 deaths by state, sex, and age group, as reported by the MOH  

__Appendix 2b. Deaths 2019__  
2019 all-cause deaths by state, sex, and age group, as reported by the MOH  

__Appendix 3. <sub>n</sub>a<sub>x</sub> IBGE 2019__
This sheet presents the original abridged IBGE life tables for 2019 by state and sex from birth to age group 90+. The first interval is one year (age 0), the second is 4 years (1-4), the last interval is all ages above 90, and the intervening intervals are 5 years in length. From the values presented in IBGE's life table, we back calculate the *<sub>n</sub>a<sub>x</sub>* used by IBGE, and use it to help construct life tables using 2019 deaths, as reported by MOH.

__Appendix 4. LT_MOH_2019__
This sheet presents the life tables we construct using MOH deaths, person-years for 2019, and the IBGE *<sub>n</sub>a<sub>x</sub>*.





### 3. DT20:

The calculations for this method are presented in excel file [`code/DT20.xlsx`](https://github.com/mcastrolab/Brazil-Covid19-e0-change/tree/main/code/DT20.xlsx). The excel file is organized into 3 sections 

-	__Summary:__ This sheet summarizes the results of the change in life expectancy calculations (labeled __Summary__)
-	__Analysis sheets:__ These sheets present the constructed the life tables considering COVID-19 deaths (labeled **0.Brazil_LT – 27. DF_LT**)
-	__Appendix sheets:__ These sheets presents the raw and processed data used as inputs for the life table calculations and other parts of the analysis (labeled **Appendix 1a – Appendix 7**)

The contents of the excel sheets are described individually below: 

__Summary__
This sheet presents the estimated change and percent change in life expectancy at birth (*e<sub>0</sub>*) (presented in  __Supplementary Table 3__) and age 65 (*e<sub>65</sub>*) (presented in __Supplementary Table 4__) using the DT20 method for Brazil and each of the 26 states and 1 Federal District in Brazil.

__0.Brazil_LT__
This sheet presents the DT20 life expectancy calculations for Brazil. Here we calculate the cause-eliminated life tables, which examines the scenario of removing COVID-19 mortality from 2020 deaths. In this case, COVID-19 is the eliminated cause and we thus back-calculate all-cause life tables for causes of death inclusive of COVID-19.

First, we calculated *<sub>n</sub>R<sub>x</sub>*, the age- and sex-specific ratio of deaths in the absence of COVID-19 to deaths with COVID-19. This ratio is similar to that described by Chiang’s method: the ratio of deaths from a single cause to deaths from all causes **[4]**. We made the assumption of proportionality between forces of decrement from cause *i* and the force of decrement from all other causes combined **[2, 4]**. (In contrast to this assumption, the potential dependence between COVID-19 and other causes might lead to modified probabilities of dying from other causes if COVID-19 were eliminated or added as a cause of death.)

<img width="637" alt="equation5" src="https://user-images.githubusercontent.com/43140693/112845943-71cf9380-9073-11eb-9bd6-c938060a50a8.png">

The remaining calculation steps mirror those of steps 2-3 in the DT19 method detailed above, and use standard life table relationships to complete the cause-eliminated life table in the absence of COVID-19 **[1]**.

__1.RO_LT – 27.DF_LF:__ (State and Federal District sheets)
These sheets (listed in full in the table below) repeat the life table calculations in sheet *0.Brazil_LT* for each of the 26 states and the Federal District in Brazil. See full list of states in table presented in DT19 methods above.

__Appendix 1a. Person-years 2020__
Person-years for 2020 as calculated from IBGE population projections and MOH reported deaths by month, state, sex, and age group.

__Appendix 1b. Person-years 2019__
Person-years for 2019 as calculated from IBGE population projections and MOH reported deaths by month, state, sex, and age group.

__Appendix 2a. Deaths 2020__
2020 all-cause and COVID-19 deaths by state, sex, and age group, as reported by the MOH  

__Appendix 2b.Deaths 2019__
2019 all-cause deaths by state, sex, and age group, as reported by the MOH  

__Appendix 3a. *<sub>n</sub>a<sub>x</sub>* IBGE 2020__
This sheet presents the original abridged IBGE life tables for 2020 by state, sex, and age group. From the values presented in IBGE's life table, we back calculate the *<sub>n</sub>a<sub>x</sub>* used by IBGE, and use it to help construct life tables using 2020 deaths, as reported by MOH.

__Appendix 3b. *<sub>n</sub>a<sub>x</sub>* IBGE 2019__
This sheet presents the original abridged IBGE life tables for 2019 by state, sex, and age group. From the values presented in IBGE's life table, we back calculate the *<sub>n</sub>a<sub>x</sub>* used by IBGE, and use it to help construct life tables using 2019 deaths, as reported by MOH.

__Appendix 4. 2020 IBGE LT__
2020 original IBGE life tables by state, sex, and Age Group

__Appendix 5. IBGE ex 00-19__
IBGE life expectancy for ages 0 and 65 by state, sex, and year from 2000-2019

__Appendix 6a. IBGE e0 corrected__
The *e0* values presented in this sheet are used to compare the estimated *e0* which take into account COVID-19 deaths, in order to assess the setback in 2020 life expectancy at birth  due to COVID-19. Because IBGE makes some adjustment for under-reporting of deaths, that is not transparent, and thus not adjusted for in our analysis, we "correct" the IBGE estimate of 2000-2019 *e0* to adjust for to differential in underlying assumptions, thus producing 2000-2019 values that are better comparison to our estimated 2020 life expectancies.

This sheet presents the calculation for each year, state, sex, for *e0*

*Setback Methodology:* In __Supplementary Table 10__ we present results from a setback comparison where we determine the year that corresponds to life expectancies closest to the estimated 2020 life expectancy at birth (*e<sub>0</sub>*) and life expectancy at age 65 (*e<sub>65</sub>*) considering deaths associated with COVID-19 for Brazil and each state and the Federal District. We selected the year with the ex that was closest (in either direction) to the estimated 2020 *e<sub>x</sub>* in the presence of COVID-19 deaths. We used the IBGE abridged life table projections based on the 2000 census (the earliest available annual estimates by state) because in many states the estimated life expectancies accounting for COVID-19 are closest to life expectancies that corresponded to years before 2010 (the most recent available abridged estimates). In some states, the life expectancy was less than that in the year 2000. Therefore, in these states, we include the value of the *e<sub>x</sub>* from 2000 with a note indicating that the *e<sub>x</sub>* may correspond to a year before 2000. 

__Appendix 6b. IBGE e65 corrected__
Similar to Appendix 6a, except this sheet presents the calculation for each year, state, sex, for *e65*

__Appendix 7. LT MOH 2019__
Constructed 2019 Life Table using deaths from MOH and *<sub>n</sub>a<sub>x</sub>* from IBGE


##  References:

1. 	S. H. Preston, P. Heuveline, M. Guillot, *Demography: Measuring and Modeling Population Processes* (Blackwell Publishing, 2001).
2. 	T. Andrasfay, N. Goldman, Reductions in 2020 US life expectancy due to COVID-19 and the disproportionate impact on the Black and Latino populations. *PNAS* __118__ (2021).
3. 	P. Heuveline, M. Tzen, Beyond Deaths per Capita: Comparative CoViD-19 Mortality Indicators. *medRxiv,* 2020.04.29.20085506 (2021).
4. 	C. L. Chiang, “The life table and its construction” in *Introduction to Stochastic Processes in Biostatistics,* (1968), pp. 198–214.



## License
The data collected and presented is licensed under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying code used to format, analyze and display that content is licensed under the [MIT license](http://opensource.org/licenses/mit-license.php). 

