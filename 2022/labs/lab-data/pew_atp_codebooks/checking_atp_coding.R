library(foreign)
atp <- read.spss("spring-542/lab-data/Mar20 19th Amendment_cleaned dataset.sav")

attr(atp, "variable.labels")[["EQRIGHTS2"]]
levels(atp[["EQRIGHTS2"]])

attr(atp, "variable.labels")[["ADVANCE3"]]
levels(atp[["ADVANCE3"]])

attr(atp, "variable.labels")[["ppgender"]]
levels(atp[["ppgender"]])
