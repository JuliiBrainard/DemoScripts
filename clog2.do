//run this with command = execute while at stata command window, or from unix prompt, stata -b do (thisfilename)
use "cc.dta"
log using clog2.log, text replace

* single var. clogit, not OR, coeffs with p<0.2 were 


gen typhabit4 = 1
replace typhabit4 = 0 if(typhabitsimp != 4)

gen tvoccup = occup
replace tvoccup = 5 if(occup == 6)

gen occupreglab = 1
replace occupreglab = 0 if(occup != 2)

gen partassnever = 1
replace partassnever = 0 if(partass != 3)

gen lavdef3 = 0
replace lavdef3 = 1 if(lavdef == 3)

gen alifronever = 0
replace alifronever = 1 if(alifro == 1)
//gen sortapinteract = sortrea * anytapever

gen alifroreg = 0
replace alifroreg = 1 if(alifro == 3)
//gen sortapinteract = sortrea * anytapever

//clogit status i.partass ib2.tvoccup anytapever sortrea urinfeacl i.alifro i.lavdef, group(adssub) or 

//* STEP3 after insisting p< 0.15
//foreach nom in i.partass i.alifro i.lavdef ib2.tvoccup{
//testparm `nom'
//}

//clogit status i.partass ib2.tvoccup anytapever sortrea urinfeacl alifroreg i.lavdef, group(adssub) or 

//clogit status i.partass ib2.tvoccup anytapever sortrea urinfeacl alifronever i.lavdef, group(adssub) or 


clogit status i.partass ib2.tvoccup anytapever sortrea urinfeacl i.lavdef, group(adssub) or 

//* STEP3 after insisting p< 0.15
foreach nom in i.partass i.lavdef ib2.tvoccup{
testparm `nom'
}


//clogit status partassnever lavdef3 anytapever urinfeacl alifronever, group(adssub) or 
/* so last is only the vars that are easiest to reliably interpret

//clogit status partassnever occupreglab anytapever#sortrea typhabit4 urinfeacl ib2.alifro ib2.lavdef, group(adssub) or 

//*following before dropping any
//foreach nom in i.alifro i.lavdef i.lavenf i.lavmain i.lavnur i.legcru i.niveeduc i.occup i.obssavo i.partass i.printemp i.sorboir i.sorprin i.typhabitsimp  {

//*after insisting p< 0.60
//foreach nom in i.alifro i.lavdef i.lavmain i.lavnur i.niveeduc i.occup i.obssavo i.partass i.printemp i.typhabitsimp {

//testparm anytapever#sortrea

drop typhabit4 occupreglab partassnever sortapinteract lavdef3 tvoccup // tvprintemp

log close
