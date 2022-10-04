
set more off
*use "F:\Dropbox\WorkShop\gee\data_GEE.dta", clear

* this is to set panel and bole dibo konta time variable and konta study ID:
xtset study_id time

*---------------------------------------------------------------------------------Linear

* correlation check korar jonno wide korte hobe must ---->

reshape wide d1 hemo_t, i(study_id) j(time)

reshape long d1 hemo_t, i(study_id) j(time)

*we can check correlation by this --- 
pwcorr hemo_t2 hemo_t1 hemo_t2 hemo_t3 hemo_t4 hemo_t5 hemo_t6 hemo_t7 hemo_t8 hemo_t9 hemo_t10 hemo_t11 hemo_t12 hemo, sig



xtgee hemo_t i.group , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.social , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.age , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.sex , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.residence , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.morbit , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.handwash , family(gaussian) link(identity) corr(exchangeable)
xtgee hemo_t i.ses bmi, family(gaussian) link(identity) corr(exchangeable)
*
xtgee hemo_t i.group i.social i.age i.sex i.residence i.morbit i.handwash i.ses bmi, family(gaussian) link(identity) corr(exchangeable)


*  Jodi exposure variable ta age hoy tahole log binomial chok bondho kore ------->

*---------------------------------------------------------------------------------Log binomial
xtgee d1 i.group , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.social , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.age , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.sex , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.residence , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.morbit , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.handwash , family(binomial 1) link(log) corr(exchangeable) eform
xtgee d1 i.ses bmi, family(binomial 1) link(log) corr(exchangeable) eform
*
xtgee d1 i.group i.social i.age i.sex i.residence i.morbit i.handwash i.ses bmi, family(binomial 1) link(log) corr(exchangeable) eform

*---------------------------------------------------------------------------------Logisitc
xtgee d1 i.group , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.social , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.age , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.sex , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.residence , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.morbit , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.handwash , family(binomial 1) link(logit) corr(exchangeable) eform
xtgee d1 i.ses bmi, family(binomial 1) link(logit) corr(exchangeable) eform
*
xtgee d1 i.group i.social i.age i.sex i.residence i.morbit i.handwash i.ses bmi, family(binomial 1) link(logit) corr(exchangeable) eform

* Jodi amra kono ekta variable er upore base analysis korte chai ----- 

bys ses: xtgee d1 i.group i.social i.age i.sex i.residence i.morbit i.handwash i.ses bmi, family(binomial 1) link(logit) corr(exchangeable) eform


*---------------------------------------------------------------------------------Poisson
xtgee d1 i.group , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.social , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.age , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.sex , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.residence , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.morbit , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.handwash , family(poisson) link(log) corr(exchangeable) eform
xtgee d1 i.ses bmi, family(poisson) link(log) corr(exchangeable) eform
*
xtgee d1 i.group i.social i.age i.sex i.residence i.morbit i.handwash i.ses bmi, family(poisson) link(log) corr(exchangeable) eform


* how to add new variable/column basd on another column --- 

gen abc = 0
replace abc=. if morbit ==.
replace abc=. if handwash ==.

replace abc=1 if morbit == 1 & handwash ==1 





