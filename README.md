# Fracking_EndocrineDisruption_BirthOutcomes
For holding relevant files related to the manuscript (A National Study of the Associations between Hormonal Modulators in Hydraulic Fracturing Fluid Chemicals and Birth Outcomes in the United States of America: A County-Level Analysis)

This folder contains the following files:

1.) **Figure4_data.csv**
This file contains the data used to create Figure 4. This is the same data as contained within Excel Supplement Table S5, except subsetted to be relevant. This file is read in by the R script figure4_FINAL_github.R  and then produces the final output figure file Figure4_forestplot.pdf  

2.) **figure4_FINAL_github.R** This R script reads in as input Figure4_data.csv straight from github (no need to download the .csv file if you don't want to) and produces the image that is saved as Figure4_forestplot.pdf It displays the estimates with their corresponding 95% Confidence Intervals as a forest plot for ease of understanding.

3.) **Figure4_forestplot.pdf** This file is the output of the R script (figure4_FINAL_github.R) and represents a forest plot of the data stored in (Figure4_data.csv).  

4.) **MainAnalysisCode** is a folder that contains the following sets of scripts related to the main analysis described in the manuscript:<br />
&nbsp;&nbsp;&nbsp;&nbsp;a.) **README.txt** contains specific information for the files/scripts in this folder and information on each of the column headings and so forth<br />
&nbsp;&nbsp;&nbsp;&nbsp;b.) **Runnable generalized linear models_for_github.R** this is the R script that can be used to run the analysis. It reads in the 4 input files directly from github. Those 4 input files are (c., d., e., and f., below) and it outputs the glm_results.csv (file g. below) <br />
&nbsp;&nbsp;&nbsp;&nbsp;c.) **full_data.csv** is a dataset containing the full data<br />
&nbsp;&nbsp;&nbsp;&nbsp;d.) **farming_and_mining_subset.csv** is a subset of the full dataset that contains only the farming and mining subset of the data<br />
&nbsp;&nbsp;&nbsp;&nbsp;e.) **non_metro_subset.csv** is a subset of the full dataset that contains only the non-metro subset of the data<br />
&nbsp;&nbsp;&nbsp;&nbsp;f.) **unambiguous_subset.csv** is a subset of the full dataset that contains only the unambiguous states (this removes the 9-states that were not mandated to report their results to the FracFocus dataset and therefore would not necessarily be in WellExplorer either since WellExplorer uses the FracFocus dataset)<br />
&nbsp;&nbsp;&nbsp;&nbsp;g.) **glm_results.csv** is the output you should obtain after running the R script (**Runnable generalized linear models.R**)<br />

5.) **Excel_Supplemental_Tables** is a folder that contains 5 supplemental tables included with the manuscript:<br />
&nbsp;&nbsp;&nbsp;&nbsp;a.) **Excel_supplemental_table_S1.csv** contains Excel Table S1 Unique Protein/Gene - Chemical Pairs Used in Fracking Fluid that Target at least One of the Three Hormonal Pathways Studied (N=3423 pairs)<br />
&nbsp;&nbsp;&nbsp;&nbsp;b.) **Excel_supplemental_table_S2.csv** contains Excel Table S2 Unique Protein/Gene - Chemical Pairs Used in Fracking Fluid that were linkable using T3DB, Includes those that target hormonal pathways and those that are not known to target hormonal pathways (N=41571 pairs)<br />
&nbsp;&nbsp;&nbsp;&nbsp;c.) **Excel_supplemental_table_S3.csv** contains Excel Table S3 Unique Protein/Genes Targeted by Chemicals Used in Fracking Fluid Ingredients (sorted by the number of Chemicals targeting specific proteins), (N=106 distinct chemicals)<br />
&nbsp;&nbsp;&nbsp;&nbsp;d.) **fExcel_supplemental_table_S4.csv** contains Excel Table S4 represents the data from various sources that was used to run our fully-adjusted generalized linear models.<br />
&nbsp;&nbsp;&nbsp;&nbsp;e.) **Excel_supplemental_table_S5.csv** contains Excel Table S5, which provides the results of all our generalized linear models, including those highlighted in the paper. 'Full' refers to models from our datasets of all counties, 'ua' refers to models of 'unambiguous' states or those whose HF exposure is fully captured, 'nm' refers to models of counties classified as non-metro, 'fm' refers to models of counties classified as having primary farming or mining economic types. 'All' refers to models that consider all types of HF wells, 'est' refers to models that consider wells with ingredients known to impact estrogen pathways and similarly, 'test' and 'hor' refer to testosterone and other hormone pathways respectively. Amongst the variables, 'hs' represents the percent of the population that completed high school and 'ba' represents the percent of the population that completed an undergrad degree.<br />

