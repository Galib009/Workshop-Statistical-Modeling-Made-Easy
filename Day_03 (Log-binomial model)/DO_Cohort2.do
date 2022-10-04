*

*
*-----------------------------------Data Analysis--------------------
tab covid mask, col ch
tab social mask, col ch
tab age mask, col ch
tab sex mask, col ch
tab residence mask, col ch
tab edu mask, col ch
tab handwash mask, col ch
tab ses mask, col ch
tab occu mask, col ch
tab bmi_CAT mask, col ch
*
ttest mHt, by(mask)
ttest mWt, by(mask)
ttest income_, by(mask)
ttest expenditure, by(mask)
ttest AgeY, by(mask)
ttest bmi, by(mask)
*
*----------------------------------Simple logbinomial regression
binreg covid ib0.mask, rr
binreg covid ib0.social, rr
binreg covid ib0.age, rr
binreg covid ib0.sex, rr
binreg covid ib0.residence, rr
binreg covid ib0.edu, rr
binreg covid ib0.handwash, rr
binreg covid ib0.ses, rr
binreg covid ib0.occu, rr
binreg covid mHt, rr
binreg covid mWt, rr
binreg covid income_, rr
binreg covid expenditure, rr
*binreg covid AgeY, rr
binreg covid bmi, rr
binreg covid ib0.bmi_CAT, rr
*
*
*----------------------------------Multiple logbinomial regression
binreg  covid ib0.mask ib0.social ib0.age   i.handwash  ib0.occu, rr
coefplot, drop(_cons) xline(1) eform citop  ciopt(recast(rcap))
*



*binreg covid ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, rr



*
*To estimate risk ratios for COVID-19, we used Poisson regression as an approximation 
*of log-binomial regression since the log-binomial models did not converge
*https://academic.oup.com/aje/article/159/7/702/71883
*
poisson covid ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
coefplot, drop(_cons) xline(1) eform citop  ciopt(recast(rcap))





poisson covid ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr


************************************************Multiple outcome
tab 	covid		mask, col ch
tab 	covid_20	mask, col ch
tab 	covid_21	mask, col ch
tab 	covid_22	mask, col ch
tab 	covid_23	mask, col ch
tab 	covid_24	mask, col ch
tab 	covid_25	mask, col ch
tab 	covid_26	mask, col ch
*--
poisson covid 		ib0.mask, irr
poisson covid_20	ib0.mask, irr
poisson covid_21	ib0.mask, irr
poisson covid_22	ib0.mask, irr
poisson covid_23	ib0.mask, irr
poisson covid_24	ib0.mask, irr
poisson covid_25	ib0.mask, irr
poisson covid_26	ib0.mask, irr
*
poisson   covid		ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_20	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_21	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_22	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_23	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_24	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_25	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr
poisson covid_26	ib0.mask ib0.edu ib0.ses ib0.social ib0.age i.handwash ib1.sex ib0.occu, irr








































