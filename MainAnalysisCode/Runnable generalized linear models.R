#Runnable generalized linear models to get final output
#Ella Poole

library(dplyr)

#replace with your own filepath
filepath="_"
outputfilepath="_"

#read in 4 files of aggregated county level data
#'full dataset' which contains data on all US counties
data = read.csv(paste0(filepath, "full_data.csv") )
#'unambiguous states subset' which contains data on US counties in states that are required to report fracking to FracFocus and/or have no oil or gas resources according to the EIA
ua_subset = read.csv(paste0(filepath, "unambiguous_subset.csv") )
#'farming and mining subset' which contains data on US counties that are designated with primary economic types of farming or mining by the USDA
fm_subset = read.csv(paste0(filepath, "farming_and_mining_subset.csv") )
#'non-metro subset' which contains data on US counties that are designated as non-metro by the USDA
nm_subset = read.csv(paste0(filepath, "non_metro_subset.csv") )

#models highlighted in paper
#full dataset models
#-------------------------------------------------------------------------------
full_all_ptb= glm(data$preterm~ 
                    data$all_wells+
                    #data$all_hormone_wells+
                    #data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_all_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_all_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_all_ptb'
results<-cbind(model, results)

full_all_ptb_results<-results

glm_results<-full_all_ptb_results
#-------------------------------------------------------------------------------
full_hor_ptb= glm(data$preterm~ 
                    #data$all_wells+
                    data$all_hormone_wells+
                    #data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_hor_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_hor_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_hor_ptb'
results<-cbind(model, results)


full_hor_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_est_ptb= glm(data$preterm~ 
                    #data$all_wells+
                    #data$all_hormone_wells+
                    data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_est_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_est_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_est_ptb'
results<-cbind(model, results)


full_est_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_test_ptb= glm(data$preterm~ 
                     #data$all_wells+
                     #data$all_hormone_wells+
                     #data$all_est_wells+
                     data$all_test_wells+
                     data$pop_per_sqr_mile+
                     data$white+
                     data$black+
                     data$native+
                     data$asian+
                     data$pacific+
                     data$multiracial+
                     data$hispanic+
                     data$poverty+
                     data$hs+
                     data$ba+
                     data$marital+
                     data$drug_death_per_100000+ 
                     data$insured+
                     data$fertilizer_per_sqr_mile+
                     data$insecticide_per_sqr_mile+
                     data$herbicide_per_sqr_mile+
                     data$maternal_care_code+
                     data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_test_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_test_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_test_ptb'
results<-cbind(model, results)


full_test_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_all_ptb_2014to2018= glm(data$preterm~ 
                               data$all_wells_2014to2018+
                               #data$all_hormone_wells_2014to2018+
                               #data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_all_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_all_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_all_ptb_2014to2018'
results<-cbind(model, results)


full_all_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_hor_ptb_2014to2018= glm(data$preterm~ 
                               #data$all_wells_2014to2018+
                               data$all_hormone_wells_2014to2018+
                               #data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_hor_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_hor_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_hor_ptb_2014to2018'
results<-cbind(model, results)


full_hor_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_est_ptb_2014to2018= glm(data$preterm~ 
                               #data$all_wells_2014to2018+
                               #data$all_hormone_wells_2014to2018+
                               data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_est_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_est_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_est_ptb_2014to2018'
results<-cbind(model, results)


full_est_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_test_ptb_2014to2018= glm(data$preterm~ 
                                #data$all_wells_2014to2018+
                                #data$all_hormone_wells_2014to2018+
                                #data$all_est_wells_2014to2018+
                                data$all_test_wells_2014to2018+
                                data$pop_per_sqr_mile+
                                data$white+
                                data$black+
                                data$native+
                                data$asian+
                                data$pacific+
                                data$multiracial+
                                data$hispanic+
                                data$poverty+
                                data$hs+
                                data$ba+
                                data$marital+
                                data$drug_death_per_100000+ 
                                data$insured+
                                data$fertilizer_per_sqr_mile+
                                data$insecticide_per_sqr_mile+
                                data$herbicide_per_sqr_mile+
                                data$maternal_care_code+
                                data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_test_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_test_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_test_ptb_2014to2018'
results<-cbind(model, results)


full_test_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_all_lbw= glm(data$lbw~ 
                    data$all_wells+
                    #data$all_hormone_wells+
                    #data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_all_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_all_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_all_lbw'
results<-cbind(model, results)


full_all_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_hor_lbw= glm(data$lbw~ 
                    #data$all_wells+
                    data$all_hormone_wells+
                    #data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_hor_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_hor_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_hor_lbw'
results<-cbind(model, results)


full_hor_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_est_lbw= glm(data$lbw~ 
                    #data$all_wells+
                    #data$all_hormone_wells+
                    data$all_est_wells+
                    #data$all_test_wells+
                    data$pop_per_sqr_mile+
                    data$white+
                    data$black+
                    data$native+
                    data$asian+
                    data$pacific+
                    data$multiracial+
                    data$hispanic+
                    data$poverty+
                    data$hs+
                    data$ba+
                    data$marital+
                    data$drug_death_per_100000+ 
                    data$insured+
                    data$fertilizer_per_sqr_mile+
                    data$insecticide_per_sqr_mile+
                    data$herbicide_per_sqr_mile+
                    data$maternal_care_code+
                    data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_est_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_est_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_est_lbw'
results<-cbind(model, results)


full_est_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_test_lbw= glm(data$lbw~ 
                     #data$all_wells+
                     #data$all_hormone_wells+
                     #data$all_est_wells+
                     data$all_test_wells+
                     data$pop_per_sqr_mile+
                     data$white+
                     data$black+
                     data$native+
                     data$asian+
                     data$pacific+
                     data$multiracial+
                     data$hispanic+
                     data$poverty+
                     data$hs+
                     data$ba+
                     data$marital+
                     data$drug_death_per_100000+ 
                     data$insured+
                     data$fertilizer_per_sqr_mile+
                     data$insecticide_per_sqr_mile+
                     data$herbicide_per_sqr_mile+
                     data$maternal_care_code+
                     data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_test_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_test_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_test_lbw'
results<-cbind(model, results)


full_test_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_all_lbw_2014to2018= glm(data$lbw~ 
                               data$all_wells_2014to2018+
                               #data$all_hormone_wells_2014to2018+
                               #data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_all_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_all_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_all_lbw_2014to2018'
results<-cbind(model, results)


full_all_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_hor_lbw_2014to2018= glm(data$lbw~ 
                               #data$all_wells_2014to2018+
                               data$all_hormone_wells_2014to2018+
                               #data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_hor_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_hor_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_hor_lbw_2014to2018'
results<-cbind(model, results)


full_hor_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_est_lbw_2014to2018= glm(data$lbw~ 
                               #data$all_wells_2014to2018+
                               #data$all_hormone_wells_2014to2018+
                               data$all_est_wells_2014to2018+
                               #data$all_test_wells_2014to2018+
                               data$pop_per_sqr_mile+
                               data$white+
                               data$black+
                               data$native+
                               data$asian+
                               data$pacific+
                               data$multiracial+
                               data$hispanic+
                               data$poverty+
                               data$hs+
                               data$ba+
                               data$marital+
                               data$drug_death_per_100000+ 
                               data$insured+
                               data$fertilizer_per_sqr_mile+
                               data$insecticide_per_sqr_mile+
                               data$herbicide_per_sqr_mile+
                               data$maternal_care_code+
                               data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_est_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_est_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_est_lbw_2014to2018'
results<-cbind(model, results)


full_est_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
full_test_lbw_2014to2018= glm(data$lbw~ 
                                #data$all_wells_2014to2018+
                                #data$all_hormone_wells_2014to2018+
                                #data$all_est_wells_2014to2018+
                                data$all_test_wells_2014to2018+
                                data$pop_per_sqr_mile+
                                data$white+
                                data$black+
                                data$native+
                                data$asian+
                                data$pacific+
                                data$multiracial+
                                data$hispanic+
                                data$poverty+
                                data$hs+
                                data$ba+
                                data$marital+
                                data$drug_death_per_100000+ 
                                data$insured+
                                data$fertilizer_per_sqr_mile+
                                data$insecticide_per_sqr_mile+
                                data$herbicide_per_sqr_mile+
                                data$maternal_care_code+
                                data$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(full_test_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('data\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(full_test_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('data\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'full_test_lbw_2014to2018'
results<-cbind(model, results)


full_test_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------


#additional models included in results
#unambiguous states subset
#-------------------------------------------------------------------------------
ua_all_ptb= glm(ua_subset$preterm~ 
                  ua_subset$all_wells+
                  #ua_subset$all_hormone_wells+
                  #ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_all_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_all_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_all_ptb'
results<-cbind(model, results)


ua_all_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_hor_ptb= glm(ua_subset$preterm~ 
                  #ua_subset$all_wells+
                  ua_subset$all_hormone_wells+
                  #ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_hor_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_hor_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_hor_ptb'
results<-cbind(model, results)


ua_hor_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_est_ptb= glm(ua_subset$preterm~ 
                  #ua_subset$all_wells+
                  #ua_subset$all_hormone_wells+
                  ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_est_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_est_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_est_ptb'
results<-cbind(model, results)


ua_est_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_test_ptb= glm(ua_subset$preterm~ 
                   #ua_subset$all_wells+
                   #ua_subset$all_hormone_wells+
                   #ua_subset$all_est_wells+
                   ua_subset$all_test_wells+
                   ua_subset$pop_per_sqr_mile+
                   ua_subset$white+
                   ua_subset$black+
                   ua_subset$native+
                   ua_subset$asian+
                   ua_subset$pacific+
                   ua_subset$multiracial+
                   ua_subset$hispanic+
                   ua_subset$poverty+
                   ua_subset$hs+
                   ua_subset$ba+
                   ua_subset$marital+
                   ua_subset$drug_death_per_100000+ 
                   ua_subset$insured+
                   ua_subset$fertilizer_per_sqr_mile+
                   ua_subset$insecticide_per_sqr_mile+
                   ua_subset$herbicide_per_sqr_mile+
                   ua_subset$maternal_care_code+
                   ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_test_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_test_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_test_ptb'
results<-cbind(model, results)


ua_test_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_all_ptb_2014to2018= glm(ua_subset$preterm~ 
                             ua_subset$all_wells_2014to2018+
                             #ua_subset$all_hormone_wells_2014to2018+
                             #ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_all_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_all_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_all_ptb_2014to2018'
results<-cbind(model, results)


ua_all_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_hor_ptb_2014to2018= glm(ua_subset$preterm~ 
                             #ua_subset$all_wells_2014to2018+
                             ua_subset$all_hormone_wells_2014to2018+
                             #ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_hor_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_hor_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_hor_ptb_2014to2018'
results<-cbind(model, results)


ua_hor_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_est_ptb_2014to2018= glm(ua_subset$preterm~ 
                             #ua_subset$all_wells_2014to2018+
                             #ua_subset$all_hormone_wells_2014to2018+
                             ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_est_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_est_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_est_ptb_2014to2018'
results<-cbind(model, results)


ua_est_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_test_ptb_2014to2018= glm(ua_subset$preterm~ 
                              #ua_subset$all_wells_2014to2018+
                              #ua_subset$all_hormone_wells_2014to2018+
                              #ua_subset$all_est_wells_2014to2018+
                              ua_subset$all_test_wells_2014to2018+
                              ua_subset$pop_per_sqr_mile+
                              ua_subset$white+
                              ua_subset$black+
                              ua_subset$native+
                              ua_subset$asian+
                              ua_subset$pacific+
                              ua_subset$multiracial+
                              ua_subset$hispanic+
                              ua_subset$poverty+
                              ua_subset$hs+
                              ua_subset$ba+
                              ua_subset$marital+
                              ua_subset$drug_death_per_100000+ 
                              ua_subset$insured+
                              ua_subset$fertilizer_per_sqr_mile+
                              ua_subset$insecticide_per_sqr_mile+
                              ua_subset$herbicide_per_sqr_mile+
                              ua_subset$maternal_care_code+
                              ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_test_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_test_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_test_ptb_2014to2018'
results<-cbind(model, results)


ua_test_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_all_lbw= glm(ua_subset$lbw~ 
                  ua_subset$all_wells+
                  #ua_subset$all_hormone_wells+
                  #ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_all_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_all_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_all_lbw'
results<-cbind(model, results)


ua_all_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_hor_lbw= glm(ua_subset$lbw~ 
                  #ua_subset$all_wells+
                  ua_subset$all_hormone_wells+
                  #ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_hor_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_hor_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_hor_lbw'
results<-cbind(model, results)


ua_hor_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_est_lbw= glm(ua_subset$lbw~ 
                  #ua_subset$all_wells+
                  #ua_subset$all_hormone_wells+
                  ua_subset$all_est_wells+
                  #ua_subset$all_test_wells+
                  ua_subset$pop_per_sqr_mile+
                  ua_subset$white+
                  ua_subset$black+
                  ua_subset$native+
                  ua_subset$asian+
                  ua_subset$pacific+
                  ua_subset$multiracial+
                  ua_subset$hispanic+
                  ua_subset$poverty+
                  ua_subset$hs+
                  ua_subset$ba+
                  ua_subset$marital+
                  ua_subset$drug_death_per_100000+ 
                  ua_subset$insured+
                  ua_subset$fertilizer_per_sqr_mile+
                  ua_subset$insecticide_per_sqr_mile+
                  ua_subset$herbicide_per_sqr_mile+
                  ua_subset$maternal_care_code+
                  ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_est_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_est_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_est_lbw'
results<-cbind(model, results)


ua_est_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_test_lbw= glm(ua_subset$lbw~ 
                   #ua_subset$all_wells+
                   #ua_subset$all_hormone_wells+
                   #ua_subset$all_est_wells+
                   ua_subset$all_test_wells+
                   ua_subset$pop_per_sqr_mile+
                   ua_subset$white+
                   ua_subset$black+
                   ua_subset$native+
                   ua_subset$asian+
                   ua_subset$pacific+
                   ua_subset$multiracial+
                   ua_subset$hispanic+
                   ua_subset$poverty+
                   ua_subset$hs+
                   ua_subset$ba+
                   ua_subset$marital+
                   ua_subset$drug_death_per_100000+ 
                   ua_subset$insured+
                   ua_subset$fertilizer_per_sqr_mile+
                   ua_subset$insecticide_per_sqr_mile+
                   ua_subset$herbicide_per_sqr_mile+
                   ua_subset$maternal_care_code+
                   ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_test_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_test_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_test_lbw'
results<-cbind(model, results)


ua_test_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_all_lbw_2014to2018= glm(ua_subset$lbw~ 
                             ua_subset$all_wells_2014to2018+
                             #ua_subset$all_hormone_wells_2014to2018+
                             #ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_all_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_all_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_all_lbw_2014to2018'
results<-cbind(model, results)


ua_all_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_hor_lbw_2014to2018= glm(ua_subset$lbw~ 
                             #ua_subset$all_wells_2014to2018+
                             ua_subset$all_hormone_wells_2014to2018+
                             #ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_hor_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_hor_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_hor_lbw_2014to2018'
results<-cbind(model, results)


ua_hor_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_est_lbw_2014to2018= glm(ua_subset$lbw~ 
                             #ua_subset$all_wells_2014to2018+
                             #ua_subset$all_hormone_wells_2014to2018+
                             ua_subset$all_est_wells_2014to2018+
                             #ua_subset$all_test_wells_2014to2018+
                             ua_subset$pop_per_sqr_mile+
                             ua_subset$white+
                             ua_subset$black+
                             ua_subset$native+
                             ua_subset$asian+
                             ua_subset$pacific+
                             ua_subset$multiracial+
                             ua_subset$hispanic+
                             ua_subset$poverty+
                             ua_subset$hs+
                             ua_subset$ba+
                             ua_subset$marital+
                             ua_subset$drug_death_per_100000+ 
                             ua_subset$insured+
                             ua_subset$fertilizer_per_sqr_mile+
                             ua_subset$insecticide_per_sqr_mile+
                             ua_subset$herbicide_per_sqr_mile+
                             ua_subset$maternal_care_code+
                             ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_est_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_est_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_est_lbw_2014to2018'
results<-cbind(model, results)


ua_est_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
ua_test_lbw_2014to2018= glm(ua_subset$lbw~ 
                              #ua_subset$all_wells_2014to2018+
                              #ua_subset$all_hormone_wells_2014to2018+
                              #ua_subset$all_est_wells_2014to2018+
                              ua_subset$all_test_wells_2014to2018+
                              ua_subset$pop_per_sqr_mile+
                              ua_subset$white+
                              ua_subset$black+
                              ua_subset$native+
                              ua_subset$asian+
                              ua_subset$pacific+
                              ua_subset$multiracial+
                              ua_subset$hispanic+
                              ua_subset$poverty+
                              ua_subset$hs+
                              ua_subset$ba+
                              ua_subset$marital+
                              ua_subset$drug_death_per_100000+ 
                              ua_subset$insured+
                              ua_subset$fertilizer_per_sqr_mile+
                              ua_subset$insecticide_per_sqr_mile+
                              ua_subset$herbicide_per_sqr_mile+
                              ua_subset$maternal_care_code+
                              ua_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(ua_test_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('ua_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(ua_test_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('ua_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'ua_test_lbw_2014to2018'
results<-cbind(model, results)


ua_test_lbw_2014to2018_results<-results
#View(ua_test_lbw_2014to2018_results)

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------

#farming and mining counties subset
#-------------------------------------------------------------------------------
fm_all_ptb= glm(fm_subset$preterm~ 
                  fm_subset$all_wells+
                  #fm_subset$all_hormone_wells+
                  #fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_all_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_all_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_all_ptb'
results<-cbind(model, results)


fm_all_ptb_results<-results
#View(fm_all_ptb_results)

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_hor_ptb= glm(fm_subset$preterm~ 
                  #fm_subset$all_wells+
                  fm_subset$all_hormone_wells+
                  #fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_hor_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_hor_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_hor_ptb'
results<-cbind(model, results)


fm_hor_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_est_ptb= glm(fm_subset$preterm~ 
                  #fm_subset$all_wells+
                  #fm_subset$all_hormone_wells+
                  fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_est_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_est_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_est_ptb'
results<-cbind(model, results)


fm_est_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_test_ptb= glm(fm_subset$preterm~ 
                   #fm_subset$all_wells+
                   #fm_subset$all_hormone_wells+
                   #fm_subset$all_est_wells+
                   fm_subset$all_test_wells+
                   fm_subset$pop_per_sqr_mile+
                   fm_subset$white+
                   fm_subset$black+
                   fm_subset$native+
                   fm_subset$asian+
                   fm_subset$pacific+
                   fm_subset$multiracial+
                   fm_subset$hispanic+
                   fm_subset$poverty+
                   fm_subset$hs+
                   fm_subset$ba+
                   fm_subset$marital+
                   fm_subset$drug_death_per_100000+ 
                   fm_subset$insured+
                   fm_subset$fertilizer_per_sqr_mile+
                   fm_subset$insecticide_per_sqr_mile+
                   fm_subset$herbicide_per_sqr_mile+
                   fm_subset$maternal_care_code+
                   fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_test_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_test_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_test_ptb'
results<-cbind(model, results)


fm_test_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_all_ptb_2014to2018= glm(fm_subset$preterm~ 
                             fm_subset$all_wells_2014to2018+
                             #fm_subset$all_hormone_wells_2014to2018+
                             #fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_all_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_all_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_all_ptb_2014to2018'
results<-cbind(model, results)


fm_all_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_hor_ptb_2014to2018= glm(fm_subset$preterm~ 
                             #fm_subset$all_wells_2014to2018+
                             fm_subset$all_hormone_wells_2014to2018+
                             #fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_hor_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_hor_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_hor_ptb_2014to2018'
results<-cbind(model, results)


fm_hor_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_est_ptb_2014to2018= glm(fm_subset$preterm~ 
                             #fm_subset$all_wells_2014to2018+
                             #fm_subset$all_hormone_wells_2014to2018+
                             fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_est_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_est_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_est_ptb_2014to2018'
results<-cbind(model, results)


fm_est_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_test_ptb_2014to2018= glm(fm_subset$preterm~ 
                              #fm_subset$all_wells_2014to2018+
                              #fm_subset$all_hormone_wells_2014to2018+
                              #fm_subset$all_est_wells_2014to2018+
                              fm_subset$all_test_wells_2014to2018+
                              fm_subset$pop_per_sqr_mile+
                              fm_subset$white+
                              fm_subset$black+
                              fm_subset$native+
                              fm_subset$asian+
                              fm_subset$pacific+
                              fm_subset$multiracial+
                              fm_subset$hispanic+
                              fm_subset$poverty+
                              fm_subset$hs+
                              fm_subset$ba+
                              fm_subset$marital+
                              fm_subset$drug_death_per_100000+ 
                              fm_subset$insured+
                              fm_subset$fertilizer_per_sqr_mile+
                              fm_subset$insecticide_per_sqr_mile+
                              fm_subset$herbicide_per_sqr_mile+
                              fm_subset$maternal_care_code+
                              fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_test_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_test_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_test_ptb_2014to2018'
results<-cbind(model, results)


fm_test_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_all_lbw= glm(fm_subset$lbw~ 
                  fm_subset$all_wells+
                  #fm_subset$all_hormone_wells+
                  #fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_all_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_all_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_all_lbw'
results<-cbind(model, results)


fm_all_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_hor_lbw= glm(fm_subset$lbw~ 
                  #fm_subset$all_wells+
                  fm_subset$all_hormone_wells+
                  #fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_hor_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_hor_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_hor_lbw'
results<-cbind(model, results)


fm_hor_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_est_lbw= glm(fm_subset$lbw~ 
                  #fm_subset$all_wells+
                  #fm_subset$all_hormone_wells+
                  fm_subset$all_est_wells+
                  #fm_subset$all_test_wells+
                  fm_subset$pop_per_sqr_mile+
                  fm_subset$white+
                  fm_subset$black+
                  fm_subset$native+
                  fm_subset$asian+
                  fm_subset$pacific+
                  fm_subset$multiracial+
                  fm_subset$hispanic+
                  fm_subset$poverty+
                  fm_subset$hs+
                  fm_subset$ba+
                  fm_subset$marital+
                  fm_subset$drug_death_per_100000+ 
                  fm_subset$insured+
                  fm_subset$fertilizer_per_sqr_mile+
                  fm_subset$insecticide_per_sqr_mile+
                  fm_subset$herbicide_per_sqr_mile+
                  fm_subset$maternal_care_code+
                  fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_est_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_est_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_est_lbw'
results<-cbind(model, results)


fm_est_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_test_lbw= glm(fm_subset$lbw~ 
                   #fm_subset$all_wells+
                   #fm_subset$all_hormone_wells+
                   #fm_subset$all_est_wells+
                   fm_subset$all_test_wells+
                   fm_subset$pop_per_sqr_mile+
                   fm_subset$white+
                   fm_subset$black+
                   fm_subset$native+
                   fm_subset$asian+
                   fm_subset$pacific+
                   fm_subset$multiracial+
                   fm_subset$hispanic+
                   fm_subset$poverty+
                   fm_subset$hs+
                   fm_subset$ba+
                   fm_subset$marital+
                   fm_subset$drug_death_per_100000+ 
                   fm_subset$insured+
                   fm_subset$fertilizer_per_sqr_mile+
                   fm_subset$insecticide_per_sqr_mile+
                   fm_subset$herbicide_per_sqr_mile+
                   fm_subset$maternal_care_code+
                   fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_test_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_test_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_test_lbw'
results<-cbind(model, results)


fm_test_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_all_lbw_2014to2018= glm(fm_subset$lbw~ 
                             fm_subset$all_wells_2014to2018+
                             #fm_subset$all_hormone_wells_2014to2018+
                             #fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_all_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_all_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_all_lbw_2014to2018'
results<-cbind(model, results)


fm_all_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_hor_lbw_2014to2018= glm(fm_subset$lbw~ 
                             #fm_subset$all_wells_2014to2018+
                             fm_subset$all_hormone_wells_2014to2018+
                             #fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_hor_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_hor_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_hor_lbw_2014to2018'
results<-cbind(model, results)


fm_hor_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_est_lbw_2014to2018= glm(fm_subset$lbw~ 
                             #fm_subset$all_wells_2014to2018+
                             #fm_subset$all_hormone_wells_2014to2018+
                             fm_subset$all_est_wells_2014to2018+
                             #fm_subset$all_test_wells_2014to2018+
                             fm_subset$pop_per_sqr_mile+
                             fm_subset$white+
                             fm_subset$black+
                             fm_subset$native+
                             fm_subset$asian+
                             fm_subset$pacific+
                             fm_subset$multiracial+
                             fm_subset$hispanic+
                             fm_subset$poverty+
                             fm_subset$hs+
                             fm_subset$ba+
                             fm_subset$marital+
                             fm_subset$drug_death_per_100000+ 
                             fm_subset$insured+
                             fm_subset$fertilizer_per_sqr_mile+
                             fm_subset$insecticide_per_sqr_mile+
                             fm_subset$herbicide_per_sqr_mile+
                             fm_subset$maternal_care_code+
                             fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_est_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_est_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_est_lbw_2014to2018'
results<-cbind(model, results)


fm_est_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
fm_test_lbw_2014to2018= glm(fm_subset$lbw~ 
                              #fm_subset$all_wells_2014to2018+
                              #fm_subset$all_hormone_wells_2014to2018+
                              #fm_subset$all_est_wells_2014to2018+
                              fm_subset$all_test_wells_2014to2018+
                              fm_subset$pop_per_sqr_mile+
                              fm_subset$white+
                              fm_subset$black+
                              fm_subset$native+
                              fm_subset$asian+
                              fm_subset$pacific+
                              fm_subset$multiracial+
                              fm_subset$hispanic+
                              fm_subset$poverty+
                              fm_subset$hs+
                              fm_subset$ba+
                              fm_subset$marital+
                              fm_subset$drug_death_per_100000+ 
                              fm_subset$insured+
                              fm_subset$fertilizer_per_sqr_mile+
                              fm_subset$insecticide_per_sqr_mile+
                              fm_subset$herbicide_per_sqr_mile+
                              fm_subset$maternal_care_code+
                              fm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(fm_test_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('fm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(fm_test_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('fm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'fm_test_lbw_2014to2018'
results<-cbind(model, results)


fm_test_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------

#non-metro counties subset
#-------------------------------------------------------------------------------
nm_all_ptb= glm(nm_subset$preterm~ 
                  nm_subset$all_wells+
                  #nm_subset$all_hormone_wells+
                  #nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_all_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_all_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_all_ptb'
results<-cbind(model, results)


nm_all_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_hor_ptb= glm(nm_subset$preterm~ 
                  #nm_subset$all_wells+
                  nm_subset$all_hormone_wells+
                  #nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_hor_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_hor_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_hor_ptb'
results<-cbind(model, results)


nm_hor_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_est_ptb= glm(nm_subset$preterm~ 
                  #nm_subset$all_wells+
                  #nm_subset$all_hormone_wells+
                  nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_est_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_est_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_est_ptb'
results<-cbind(model, results)


nm_est_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_test_ptb= glm(nm_subset$preterm~ 
                   #nm_subset$all_wells+
                   #nm_subset$all_hormone_wells+
                   #nm_subset$all_est_wells+
                   nm_subset$all_test_wells+
                   nm_subset$pop_per_sqr_mile+
                   nm_subset$white+
                   nm_subset$black+
                   nm_subset$native+
                   nm_subset$asian+
                   nm_subset$pacific+
                   nm_subset$multiracial+
                   nm_subset$hispanic+
                   nm_subset$poverty+
                   nm_subset$hs+
                   nm_subset$ba+
                   nm_subset$marital+
                   nm_subset$drug_death_per_100000+ 
                   nm_subset$insured+
                   nm_subset$fertilizer_per_sqr_mile+
                   nm_subset$insecticide_per_sqr_mile+
                   nm_subset$herbicide_per_sqr_mile+
                   nm_subset$maternal_care_code+
                   nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_test_ptb)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_test_ptb,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_test_ptb'
results<-cbind(model, results)


nm_test_ptb_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_all_ptb_2014to2018= glm(nm_subset$preterm~ 
                             nm_subset$all_wells_2014to2018+
                             #nm_subset$all_hormone_wells_2014to2018+
                             #nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_all_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_all_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_all_ptb_2014to2018'
results<-cbind(model, results)


nm_all_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_hor_ptb_2014to2018= glm(nm_subset$preterm~ 
                             #nm_subset$all_wells_2014to2018+
                             nm_subset$all_hormone_wells_2014to2018+
                             #nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_hor_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_hor_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_hor_ptb_2014to2018'
results<-cbind(model, results)


nm_hor_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_est_ptb_2014to2018= glm(nm_subset$preterm~ 
                             #nm_subset$all_wells_2014to2018+
                             #nm_subset$all_hormone_wells_2014to2018+
                             nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_est_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_est_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_est_ptb_2014to2018'
results<-cbind(model, results)


nm_est_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_test_ptb_2014to2018= glm(nm_subset$preterm~ 
                              #nm_subset$all_wells_2014to2018+
                              #nm_subset$all_hormone_wells_2014to2018+
                              #nm_subset$all_est_wells_2014to2018+
                              nm_subset$all_test_wells_2014to2018+
                              nm_subset$pop_per_sqr_mile+
                              nm_subset$white+
                              nm_subset$black+
                              nm_subset$native+
                              nm_subset$asian+
                              nm_subset$pacific+
                              nm_subset$multiracial+
                              nm_subset$hispanic+
                              nm_subset$poverty+
                              nm_subset$hs+
                              nm_subset$ba+
                              nm_subset$marital+
                              nm_subset$drug_death_per_100000+ 
                              nm_subset$insured+
                              nm_subset$fertilizer_per_sqr_mile+
                              nm_subset$insecticide_per_sqr_mile+
                              nm_subset$herbicide_per_sqr_mile+
                              nm_subset$maternal_care_code+
                              nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_test_ptb_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_test_ptb_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_test_ptb_2014to2018'
results<-cbind(model, results)


nm_test_ptb_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_all_lbw= glm(nm_subset$lbw~ 
                  nm_subset$all_wells+
                  #nm_subset$all_hormone_wells+
                  #nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_all_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_all_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_all_lbw'
results<-cbind(model, results)


nm_all_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_hor_lbw= glm(nm_subset$lbw~ 
                  #nm_subset$all_wells+
                  nm_subset$all_hormone_wells+
                  #nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_hor_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_hor_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_hor_lbw'
results<-cbind(model, results)


nm_hor_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_est_lbw= glm(nm_subset$lbw~ 
                  #nm_subset$all_wells+
                  #nm_subset$all_hormone_wells+
                  nm_subset$all_est_wells+
                  #nm_subset$all_test_wells+
                  nm_subset$pop_per_sqr_mile+
                  nm_subset$white+
                  nm_subset$black+
                  nm_subset$native+
                  nm_subset$asian+
                  nm_subset$pacific+
                  nm_subset$multiracial+
                  nm_subset$hispanic+
                  nm_subset$poverty+
                  nm_subset$hs+
                  nm_subset$ba+
                  nm_subset$marital+
                  nm_subset$drug_death_per_100000+ 
                  nm_subset$insured+
                  nm_subset$fertilizer_per_sqr_mile+
                  nm_subset$insecticide_per_sqr_mile+
                  nm_subset$herbicide_per_sqr_mile+
                  nm_subset$maternal_care_code+
                  nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_est_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_est_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_est_lbw'
results<-cbind(model, results)


nm_est_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_test_lbw= glm(nm_subset$lbw~ 
                   #nm_subset$all_wells+
                   #nm_subset$all_hormone_wells+
                   #nm_subset$all_est_wells+
                   nm_subset$all_test_wells+
                   nm_subset$pop_per_sqr_mile+
                   nm_subset$white+
                   nm_subset$black+
                   nm_subset$native+
                   nm_subset$asian+
                   nm_subset$pacific+
                   nm_subset$multiracial+
                   nm_subset$hispanic+
                   nm_subset$poverty+
                   nm_subset$hs+
                   nm_subset$ba+
                   nm_subset$marital+
                   nm_subset$drug_death_per_100000+ 
                   nm_subset$insured+
                   nm_subset$fertilizer_per_sqr_mile+
                   nm_subset$insecticide_per_sqr_mile+
                   nm_subset$herbicide_per_sqr_mile+
                   nm_subset$maternal_care_code+
                   nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_test_lbw)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_test_lbw,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_test_lbw'
results<-cbind(model, results)


nm_test_lbw_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_all_lbw_2014to2018= glm(nm_subset$lbw~ 
                             nm_subset$all_wells_2014to2018+
                             #nm_subset$all_hormone_wells_2014to2018+
                             #nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_all_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_all_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_all_lbw_2014to2018'
results<-cbind(model, results)


nm_all_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_hor_lbw_2014to2018= glm(nm_subset$lbw~ 
                             #nm_subset$all_wells_2014to2018+
                             nm_subset$all_hormone_wells_2014to2018+
                             #nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_hor_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_hor_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_hor_lbw_2014to2018'
results<-cbind(model, results)


nm_hor_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_est_lbw_2014to2018= glm(nm_subset$lbw~ 
                             #nm_subset$all_wells_2014to2018+
                             #nm_subset$all_hormone_wells_2014to2018+
                             nm_subset$all_est_wells_2014to2018+
                             #nm_subset$all_test_wells_2014to2018+
                             nm_subset$pop_per_sqr_mile+
                             nm_subset$white+
                             nm_subset$black+
                             nm_subset$native+
                             nm_subset$asian+
                             nm_subset$pacific+
                             nm_subset$multiracial+
                             nm_subset$hispanic+
                             nm_subset$poverty+
                             nm_subset$hs+
                             nm_subset$ba+
                             nm_subset$marital+
                             nm_subset$drug_death_per_100000+ 
                             nm_subset$insured+
                             nm_subset$fertilizer_per_sqr_mile+
                             nm_subset$insecticide_per_sqr_mile+
                             nm_subset$herbicide_per_sqr_mile+
                             nm_subset$maternal_care_code+
                             nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_est_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_est_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_est_lbw_2014to2018'
results<-cbind(model, results)


nm_est_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------
nm_test_lbw_2014to2018= glm(nm_subset$lbw~ 
                              #nm_subset$all_wells_2014to2018+
                              #nm_subset$all_hormone_wells_2014to2018+
                              #nm_subset$all_est_wells_2014to2018+
                              nm_subset$all_test_wells_2014to2018+
                              nm_subset$pop_per_sqr_mile+
                              nm_subset$white+
                              nm_subset$black+
                              nm_subset$native+
                              nm_subset$asian+
                              nm_subset$pacific+
                              nm_subset$multiracial+
                              nm_subset$hispanic+
                              nm_subset$poverty+
                              nm_subset$hs+
                              nm_subset$ba+
                              nm_subset$marital+
                              nm_subset$drug_death_per_100000+ 
                              nm_subset$insured+
                              nm_subset$fertilizer_per_sqr_mile+
                              nm_subset$insecticide_per_sqr_mile+
                              nm_subset$herbicide_per_sqr_mile+
                              nm_subset$maternal_care_code+
                              nm_subset$acres_ag_land_per_sqr_mile)

#want p values, estimates, and 95% confidence intervals

estimate_p<-summary.glm(nm_test_lbw_2014to2018)$coefficients
names<-rownames(estimate_p)
names = gsub('nm_subset\\$', "", names)
estimate_p<-cbind(names, estimate_p)


conf_int<-confint(nm_test_lbw_2014to2018,level=0.95)
names<-rownames(conf_int)
names = gsub('nm_subset\\$', "", names)
conf_int<-cbind(names, conf_int)


results<-merge(estimate_p, conf_int, by='names')
results=results[-1,]
model<-'nm_test_lbw_2014to2018'
results<-cbind(model, results)


nm_test_lbw_2014to2018_results<-results

glm_results<-bind_rows(glm_results, results)
#-------------------------------------------------------------------------------

#Save these results to your own library
write.csv(glm_results, paste0(outputfilepath, "glm_results.csv"), row.names=F )
