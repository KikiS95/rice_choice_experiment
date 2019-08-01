ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
# ricedata <- read_csv("~/Dropbox/Shared_NIES/Shared_KiranAgrPJ/DataAnalysis/ce_complete.csv")
# kota read file
str(ricedata)

#--- Comment:: I cannot understand the code follow...
#### what do you want to do their code ?

# ricedata[2:14]<- lapply(ricedata[5:14], as.numeric)
# ricedata$asc <-as.character(ricedata$asc)
# ricedata$alt <-as.integer(ricedata$alt)
# str(ricedata)

rice <- data.table::data.table(ricedata)
riceml <- mlogit::mlogit.data(rice, choice = "choice", shape = "long",alt.levels = "alt", id.var = "STR",varying=4:15)

riceml
criceml <- mlogit::mlogit(choice ~ frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data =riceml )
criceml <- mlogit::mlogit(choice ~ as.factor(alt) + frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)


# Tried clogit instead of mlogit

library(survival)
ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
criceml1 <- clogit(choice ~ asc + frog + bird + fish + location1 + cultivation1 + price + strata(STR), data = riceml)
summary(criceml1)


library(survival)
ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
criceml2 <- clogit(choice ~ asc + frog + fish + location1 + cultivation1 + price + strata(STR), data = riceml)
summary(criceml2)


