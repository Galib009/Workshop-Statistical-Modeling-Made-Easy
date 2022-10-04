
clear
set more off
*
use "F:\Dropbox\WorkShop\Logistic_\DataCaseControl.dta", clear

for var no_mask social sex  occu edu ses handwash: tab X covid_, col ch
*
logistic covid_ i.no_mask i.social i.sex age i.occu i.edu i.ses i.handwash weight income
*
logistic covid_ i.no_mask 
logistic covid_ i.social 
logistic covid_ i.sex 
logistic covid_ age 
logistic covid_ i.occu 
logistic covid_ i.edu 
logistic covid_ i.ses 
logistic covid_ i.handwash 
logistic covid_ weight 
logistic covid_ income

