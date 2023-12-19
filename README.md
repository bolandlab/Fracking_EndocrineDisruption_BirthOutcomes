# Fracking_EndocrineDisruption_BirthOutcomes
For holding relevant files related to the manuscript (A National Study of the Associations between Hormonal Modulators in Hydraulic Fracturing Fluid Chemicals and Birth Outcomes in the United States of America: A County-Level Analysis)

This folder contains the following files:

1.) **Figure4_data.csv**
This file contains the data used to create Figure 4. This is the same data as contained within Excel Supplement Table S5, except subsetted to be relevant. This file is read in by the R script figure4_FINAL_github.R  and then produces the final output figure file Figure4_forestplot.pdf  

2.) **figure4_FINAL_github.R** This R script reads in as input Figure4_data.csv straight from github (no need to download the .csv file if you don't want to) and produces the image that is saved as Figure4_forestplot.pdf It displays the estimates with their corresponding 95% Confidence Intervals as a forest plot for ease of understanding.

3.) **Figure4_forestplot.pdf** This file is the output of the R script (figure4_FINAL_github.R) and represents a forest plot of the data stored in (Figure4_data.csv).  

4.) MainAnalysisCode is a folder that contains the following sets of scripts related to the main analysis described in the manuscript:
  a.) **README.txt** contains specific information for the files/scripts in this folder and information on each of the column headings and so forth
  b.) **Runnable generalized linear models.R** this is the R script that can be used to run the analysis
  c.) **full_data.csv** is a dataset containing the full data
  d.) **farming_and_mining_subset.csv** is a subset of the full dataset that contains only the farming and mining subset of the data
  e.) **non_metro_subset.csv** is a subset of the full dataset that contains only the non-metro subset of the data
  f.) **unambiguous_subset.csv** is a subset of the full dataset that contains only the unambiguous states (this removes the 9-states that were not mandated to report their results to the FracFocus dataset and therefore would not necessarily be in WellExplorer either since WellExplorer uses the FracFocus dataset)
  g.) **glm_results.csv** is the output you shoudl obtain after running the R script (**Runnable generalized linear models.R**)
