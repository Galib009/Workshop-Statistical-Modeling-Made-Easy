
*
clear
use "F:\Dropbox\WorkShop\Logistic_\BDHS_Logisitc_Clean.dta", clear
*
*svyset v021, weight(swt) vce(linearized) 

for var stunting  v151 v190 anc2 edu PartnerEdu bmiCAT v012 ChildAge b4: tab X v025, col ch
for var v012 ChildAge: ttest X, by( v025 )
*

*
*------------------------------------------Stunting
logistic stunting ib1.v025 ib2.v151 ib5.v190 i.anc2 ib1.edu ib1.PartnerEdu i.bmiCAT v012 ChildAge ib2.b4
*
logistic stunting  ib1.v025 
logistic stunting  ib2.v151 
logistic stunting  ib5.v190 
logistic stunting  i.anc2 
logistic stunting  ib1.edu 
logistic stunting  ib1.PartnerEdu 
logistic stunting  i.bmiCAT 
logistic stunting  v012 
logistic stunting  ChildAge 
logistic stunting  ib2.b4
*
*
*------------------------------------------wasting
logistic wasting ib1.v025 ib2.v151 ib5.v190 i.anc2 ib1.edu ib1.PartnerEdu i.bmiCAT v012 ChildAge ib2.b4
*
logistic wasting  ib1.v025 
logistic wasting  ib2.v151 
logistic wasting  ib5.v190 
logistic wasting  i.anc2 
logistic wasting  ib1.edu 
logistic wasting  ib1.PartnerEdu 
logistic wasting  i.bmiCAT 
logistic wasting  v012 
logistic wasting  ChildAge 
logistic wasting  ib2.b4
*
*
*------------------------------------------underweight
logistic underweight  ib1.v025 
logistic underweight  ib2.v151 
logistic underweight  ib5.v190 
logistic underweight  i.anc2 
logistic underweight  ib1.edu 
logistic underweight  ib1.PartnerEdu 
logistic underweight  i.bmiCAT 
logistic underweight  v012 
logistic underweight  ChildAge 
logistic underweight  ib2.b4
*
logistic underweight ib1.v025 ib2.v151 ib5.v190 i.anc2 ib1.edu ib1.PartnerEdu i.bmiCAT v012 ChildAge ib2.b4
*
*
*------------------------------------------Multinomial 3
mlogit stunting3 ib0.bmiCAT , baseoutcome(1)rrr
mlogit stunting3 ib1.anc2 , baseoutcome(1)rrr
mlogit stunting3 ib0.fever , baseoutcome(1)rrr
mlogit stunting3 ib1.edu , baseoutcome(1)rrr
mlogit stunting3 ib5.v190 , baseoutcome(1)rrr
*
mlogit stunting3 ib0.bmiCAT ib1.anc2 ib0.fever ib1.edu  ib5.v190, baseoutcome(1)rrr

