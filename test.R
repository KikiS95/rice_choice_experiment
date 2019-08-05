ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
# ricedata <- readr::read_csv("~/Dropbox/Shared_NIES/Shared_KiranAgrPJ/DataAnalysis/ce_complete.csv")
# kota read file
str(ricedata)

#--- Comment:: I cannot understand the code follow...
#### what do you want to do their code ?
# ricedata[2:14]<- lapply(ricedata[5:14], as.numeric)
# ricedata$asc <-as.character(ricedata$asc)
# ricedata$alt <-as.integer(ricedata$alt)
# str(ricedata)

rice <- data.table::data.table(ricedata)

riceml <- mlogit::mlogit.data(rice, choice = "choice", shape = "long",alt.levels = c("alt1","alt2","alt3"), id.var = "STR",varying=4:16)
criceml <- mlogit::mlogit(choice ~ frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data =riceml )
summary(criceml)

# criceml2 <- mlogit::mlogit(choice ~ as.factor(alt) + frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)
# criceml <- mlogit(choice ~ frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)
# criceml <- mlogit(choice ~ asc + frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)


# Tried clogit instead of mlogit

library(survival)
ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")
criceml1 <- clogit(choice ~ asc + frog + bird + fish + location1 + cultivation1 + price + strata(STR), data = riceml)
summary(criceml1)

#replaced bird with fish
library(survival)
ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
criceml2 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + strata(STR), data = riceml)
summary(criceml2)


## price:male
rice_demo <- read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")
criceml4 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + price:male +strata(STR), data = rice_demo)
summary(criceml4)

##price:none
rice_demo <- read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")
criceml5 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + price:none +strata(STR), data = rice_demo)
summary(criceml5)

##price:ricebuyer1 price:ricebuyer2 price:ricebuyer3
rice_demo <- read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")
criceml6 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + price:rice_buyer1 + price:rice_buyer2 + price:rice_buyer3 +strata(STR), data = rice_demo)
summary(criceml6)

##price:rice_frequency
rice_demo <- read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")
rice_demo$rice_frequency <-as.factor(rice_demo$rice_frequency) 
criceml7 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + rice_frequency + price:rice_frequency + strata(STR), data = rice_demo[!is.na(rice_demo$age),])
summary(criceml7)
