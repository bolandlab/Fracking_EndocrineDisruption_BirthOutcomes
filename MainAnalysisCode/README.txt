#Code for Generalized Linear Models for 'A National Study of the Association between Hormonal Modulators in Hydraulic Fracturing Fluid Chemicals and Birth Outcomes in the United States of America: A County-Level Analysis' by Ella M Poole and Mary Regina Boland

##Description
This R script allows users to take the aggregated, county-level datasets on hydraulic fracturing exposure and covariates relevant to birth outcomes (preterm birth rates and low birth weight rates) that we compiled and run the models used in our analysis.
The script creates 64 unique generalized linear models and combines their results into one output file.

Overview of Input Datasets:
The 'full data' file contains data on all US counties
The 'unambiguous states subset' file contains data on US counties in states that are required to report fracking to FracFocus and/or have no oil or gas resources according to the EIA
The 'farming and mining subset' file contains data on US counties that are designated with primary economic types of farming or mining by the USDA
The 'non-metro subset' file contains data on US counties that are designated as non-metro by the USDA

Overview of Output Dataset:
This R script outputs one file glm_results.csv containing the results of our models.

Abbreviations in R Script defined
'fips'- US FIPS code corresponding to each county of county-equivalent in the US
'full'- full dataset
'ua'- unambiguous subset
'fm'- farming and mining subset
'nm'- nonmetro subset
'all'- all fracking wells
'est'- fracking wells with ingredients that target estrogen pathways
'test' - fracking wells with ingredients that target testosterone pathways
'hor'- fracking wells with ingredients that target other hormone pathways
'ptb'- pre term birth rate
'lbw'- low birth weight rate
'2014to2018' - wells that were active during the years 2014to2018, which correspond to the timeframe of most of our covariate data

County-level covariates that may impact birth outcomes defined
'pop_per_sqr_mile' - population density from American Community Survey 2014-2018 5-year estimate
'white'- percentage of population self-identifying as white from American Community Survey 2014-2018 5-year estimate
'black'- percentage of population self-identifying as black from American Community Survey 2014-2018 5-year estimate
'native'- percentage of population self-identifying as American Indian or Alaskan Native from American Community Survey 2014-2018 5-year estimate
'asian'- percentage of population self-identifying as asian from American Community Survey 2014-2018 5-year estimate
'pacific'- percentage of population self-identifying as Native Hawaiian or other pacific islander from American Community Survey 2014-2018 5-year estimate
'multiracial'- percentage of population self-identifying as multiracial from American Community Survey 2014-2018 5-year estimate
'hispanic'- percentage of population self-identifying as hispanic from American Community Survey 2014-2018 5-year estimate
'poverty'- percentage of population living below the poverty line from American Community Survey 2014-2018 5-year estimate
'hs'- percentage of population that graduated high school from American Community Survey 2014-2018 5-year estimate
'ba'- percentage of population that graduated from a bachelors of science or bachelors of arts program from American Community Survey 2014-2018 5-year estimate
'marital'- percentage of women over 15 years old who are married from American Community Survey 2014-2018 5-year estimate
'drug_death_per_100000'- rates of drug-related deaths from CDC WONDER Multiple Cause of Death dataset from 2014-2018
'insured'- percentage of civillian, non-institutionalized population with health insurance from from American Community Survey 2014-2018 5-year estimate
'fertilizer_per_sqr_mile'- relative amount of fertilizer used in agricultural operations within the county from USDA 2017 Census of Agriculture
'insecticide_per_sqr_mile'- relative amount of insecticide used in agricultural operations within the county from USDA 2017 Census of Agriculture
'herbicide_per_sqr_mile'- relative amount of herbicide used in agricultural operations within the county from USDA 2017 Census of Agriculture
'maternal_care_code'- maternal care accessibility (whether county is a maternal care desert or not) as categorized by March of Dimes 2022 report
'acres_ag_land_per_sqr_mile' - proportion of the county that is agricultural land (proxy for ruralness) from USDA 2017 Census of Agriculture

Other columns in input data files
'required_report'- designates counties in states that are required to report fracking to FracFocus, used to create 'unambiguous states' subset
'no_report_but_resources'- designates counties in states that are not required to report fracking to FracFocus and have oil or gas resources according to the CIA, used to create 'unambiguous states' subset
'total_area'- county area in square miles from the 2018 U.S. Gazetteer files, used to normalize variables by county area
'Metro-nonmetro status'- USDA 2013 county classification as nonmetro or metro, used to create 'non-metro' subset
'Economic Types'- USDA 2015 county classification of primary economic type, used to create 'farming and mining' subset

Columns in output data file:
'model'- designates the row's generalized linear model with format [dataset or subset]_[wells included]_[birth outcome], see 'Abbreviations in R Script defined' above for definitions
'names'- variables considered in each generalized linear model, including well density variables and county-level covariates as described above
'Estimate'- coefficient estimate for variable in glm
'Std. Error'- standard error for variable in glm
't value'- t value for variable in glm
'Pr(>|t|)'- p value for variable in glm
'2.50%'- 95% confidence interval lower limit for variable in glm
'97.50%'- 95% confidence interval upper limit for variable in glm


More information on the datasets and methods will be available in our publication: (insert reference later)

##Getting Started

###Dependencies
Install the "dplyr" R package
Read in 'full dataset,' 'unamiguous states subset,' 'farming and mining subset,' 'non-metro subset'

###Executing
After adding your filepaths, R script can be run to output the results of the generalized linear models

##License
Please cite our paper (insert reference later) when using this code

##Authors
Ella Poole
Mary Regina Boland
bolandm@upenn.edu
