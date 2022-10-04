
/*
keep caseid v012 v021 v024 v025 v106 v113 v116 v136 v151 v190 v201 v437 v438 v701 v730 b3 b4 m2a m2b m2c m2e m2j m14 m15 m17 ///
h11 h22 hw70 hw71 hw72 hw73 v008 v005 v011
*/
set more off
use "F:\Dropbox\WorkShop\Linear_Regression\DataBDHS_.dta", clear
*
numlabel, add
gen swt=v005/1000000
la var swt "Sampling weight"
svyset v021, weight(swt) vce(linearized) 
*
gen anc2=0
replace anc2=1 if (m2a==1| m2b==1| m2c==1| m2e==1 |m2j==1)&(m14 >3 & m14 <= 20)
la de anc2 0 "No" 1 "Yes", replace
la val anc2 anc2
la var anc2 "At leas 4 ANC from Medically trained provider"
*
gen Diarrhea=1 if h11==2
replace Diarrhea=0 if h11==0
la de Diarrhea 0 "No" 1 "Yes", replace
la val Diarrhea Diarrhea 
la var Diarrhea "Diarrhea" 
*
gen fever=1 if h22==1
replace fever=0 if h22==0
la de fever 0 "No" 1 "Yes", replace
la val fever fever 
la var fever "Fever" 
*
ge ChildAge = (v008 - b3) 
label variable ChildAge "Child's Age in Months"
tab ChildAge
*
for var hw70 hw71 hw72 hw73: replace X=. if X>9000
for var hw70 hw71 hw72 hw73: replace X=X/100
*
gen stunting=0
replace stunting=1 if hw70<-2
replace stunting=. if hw70==.
label define stunting 1 "stunted" 0 "non-stunted", replace
label values stunting stunting
*
gen wasting=0
replace wasting=1 if hw72<-2
replace wasting=. if hw72==.
label define wasting 1 "wasted" 0 "non-wasted", replace
label values wasting wasting 
*
gen underweight=0
replace underweight=1 if hw71<-2
replace underweight=. if hw71==.
label define underweight 1 "underweight" 0 "non-underweight", replace
label values underweight underweight 
*
la var stunting "Childhood stunting"
la var wasting "Childhood wasting "
la var underweight "Childhood underweight "
*
gen agem=v008- v011
la var agem "age in month"
*
gen h=v438/10 if v438<9000
la var h "Height in cm"
*
gen w=v437/10 if v437<9000
la var w "Weight in kg"
*
gen bmi =w/(h/100)^2
la var bmi "BMI"
*
gen edu=0 if v106==0|v106==1
replace edu=1 if v106==2|v106==3
la var edu "Education"
la de edu 0 "below secondary" 1 "Secondary and above", replace
la val edu edu 
*
ge PartnerEdu = 0 if v701==0
replace PartnerEdu = 0 if v701==1
replace PartnerEdu = 1 if v701==2|v701==3
label define PartnerEdu 0 "below secondary" 1 "Secondary and above", replace 
label value PartnerEdu PartnerEdu 
label variable PartnerEdu "Partner's  Education"
*
ge toilet = 1 if v116==11|v116==12|v116==13|v116==21|v116==22       
replace toilet = 2 if v116==23|v116==31|v116==41|v116==42|v116==43|v116==97       
label define toilet 1 "improved" 2 "unimproved"  
label value toilet toilet
label variable toilet "type of toilet facility"
*
gen bmiCAT=bmi<18.5
replace bmiCAT=. if bmi>50
la var bmiCAT "Maternal underweight(BMI<18.5)" 
la de bmiCAT 1 "Underweight" 0 "Normal", replace
la val bmiCAT bmiCAT
*
gen stunting3=1 if hw70>=-2
replace stunting3=2 if hw70<-2& hw70>=-3
replace stunting3=3 if hw70<-3
replace stunting3=. if hw70==.
ta stunting3
la de stunting3 1 "Non_stunting" 2 "Moderate_stunting" 3 "Severe_Stunting", replace 
la val stunting3 stunting3
la var stunting3 "Chronic malnutrition"
*
gen underweight3=1 if hw71>=-2
replace underweight3=2 if hw71<-2& hw71>=-3
replace underweight3=3 if hw71<-3
replace underweight3=. if hw71==.
ta underweight3
la de underweight3 1 "Non_underweight" 2 "Moderate_underweight" 3 "Severe_underweight", replace 
la val underweight3 underweight3
la var underweight3 "Under-nutrition"
*
gen wasting3=1 if hw72>=-2
replace wasting3=2 if hw72<-2& hw72>=-3
replace wasting3=3 if hw72<-3
replace wasting3=. if hw72==.
ta wasting3
la de wasting3 1 "Non_wasting" 2 "Moderate_wasting" 3 "Severe_wasting", replace 
la val wasting3 wasting3
la var wasting3 "Acute malnutrition"
*
*
reg h ib2.v025
reg h ib8.v024
reg h v012
reg h ib1.v190
reg h ib0.edu

reg h ib1.v025 ib8.v024 v012 ib1.v190 ib0.edu   
reg w ib1.v025 ib8.v024 v012 ib1.v190 ib0.edu   


