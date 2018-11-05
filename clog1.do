//run this with command = execute while at stata command window, or from unix prompt, something to do with stata -b do (thisfilename) 
&
use "cc.dta"
log using clog1.log, text replace
//table obssavo
//NB: omitted by clogit due to colinearity alimarc, always = 1!

//NB: omitted due to no within group variance = camp

* >95% of obs same single value, so not trying these bs ORs /c too little variation =  
// alimarc, eaulat, defeq, frepl, matlat, orifet, printemp, typlat

//next are the dichotomous or ratio scale ones
foreach nom in anytap lavmain nrbidon 
//nrperson sortrea tapasprimorsec trateau utilat{
//table lirecri
clogit status `nom', group(adssub) or
}

//next are the categorical ones


//* note electr, encein, evift, hyggen, lirecri, radio, recouv, savomen, telev, teport, urinfeacl are really dichotomous, coded as 1 or 2


foreach nom in alifro cusicar electr encein evift hyggen lavdef lavenf lavmain lavnur legcru lirecri neweduc niveeduc obssavo occup partass printemp radio recouv savomen sorboir sorprin sortrea telev teport topography typhabit typlat urinfeacl 
{
//table lirecri
clogit status i.`nom', group(adssub) or
testparm i.`nom'
}



log close
