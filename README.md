# Fracking_EndocrineDisruption_BirthOutcomes
For holding relevant files related to the manuscript (A National Study of the Associations between Hormonal Modulators in Hydraulic Fracturing Fluid Chemicals and Birth Outcomes in the United States of America: A County-Level Analysis)

This folder contains the following files:

1.) Figure4_data.csv
This file contains the data used to create Figure 4. This is the same data as contained within Excel Supplement Table S5, except subsetted to be relevant. This file is read in by the R script figure4_FINAL_github.R  and then produces the final output figure file Figure4_forestplot.pdf  

2.) figure4_FINAL_github.R This R script reads in as input Figure4_data.csv straight from github (no need to download the .csv file if you don't want to) and produces the image that is saved as Figure4_forestplot.pdf It displays the estimates with their corresponding 95% Confidence Intervals as a forest plot for ease of understanding.

3.) Figure4_forestplot.pdf This file is the output of the R script (figure4_FINAL_github.R) and represents a forest plot of the data stored in (Figure4_data.csv).  
