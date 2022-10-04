/*
clear
set more off
use "F:\Dropbox\WorkShop\Poisson\Chhoto_Database.dta", clear
gen off_var=log(durationofexposure)
*
poisson numberofevents , offset( off_var ) irr
bys group: poisson numberofevents , offset( off_var ) irr
poisson numberofevents i.group , offset( off_var ) irr
*
*/
use "E:\Courses\statistical moeling made easy tafsir icddrb\Day_04\DataPoisson.dta" 

*
keep if time==0
*
drop d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
gen offset_=log( foll)
*
set more off
for var mask covid social age sex residence morbit handwash ses occu: tab X group, col ch

for var ht wt bmi hemo: ttest X, by(group)


poisson sum_d1, offset(offset_) irr 
poisson sum_d2, offset(offset_) irr 
poisson sum_d3, offset(offset_) irr 
poisson sum_d4, offset(offset_) irr 
poisson sum_d5, offset(offset_) irr 
poisson sum_d6, offset(offset_) irr 
poisson sum_d7, offset(offset_) irr 
poisson sum_d8, offset(offset_) irr 
poisson sum_d9, offset(offset_) irr 
poisson sum_d10, offset(offset_) irr 
*
bys group: poisson sum_d1, offset(offset_) irr 
bys group: poisson sum_d2, offset(offset_) irr 
bys group: poisson sum_d3, offset(offset_) irr 
bys group: poisson sum_d4, offset(offset_) irr 
bys group: poisson sum_d5, offset(offset_) irr 
bys group: poisson sum_d6, offset(offset_) irr 
bys group: poisson sum_d7, offset(offset_) irr 
bys group: poisson sum_d8, offset(offset_) irr 
bys group: poisson sum_d9, offset(offset_) irr 
bys group: poisson sum_d10, offset(offset_) irr 
*

global yy sum_d1 sum_d2 sum_d3 sum_d4 sum_d5 sum_d6 sum_d7 sum_d8 sum_d9 sum_d10

for var $yy: poisson X i.group , offset(offset_)irr
for var $yy: poisson X i.group i.sex i.occu ib1.age bmi i.ses hemo , offset(offset_)irr
*
poisson sum_d1 i.group i.sex i.occu ib1.age bmi i.ses hemo , offset(offset_)irr
*
poisson sum_d1 i.group  , offset(offset_)irr
poisson sum_d1 i.sex  , offset(offset_)irr
poisson sum_d1 i.occu  , offset(offset_)irr
poisson sum_d1 ib1.age  , offset(offset_)irr
poisson sum_d1 bmi  , offset(offset_)irr
poisson sum_d1 i.ses  , offset(offset_)irr
poisson sum_d1 hemo , offset(offset_)irr






 nbreg sum_d3 i.group i.sex i.occu ib1.age bmi i.ses hemo , offset(offset_)irr












