ricedata <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_complete.csv")
str(ricedata)
ricedata[2:14]<- lapply(ricedata[5:14], as.numeric)
ricedata$asc <-as.character(ricedata$asc)
ricedata$alt <-as.integer(ricedata$alt)
str(ricedata)

riceml <- mlogit.data(ricedata, choice = "choice", shape = "long", alt.levels = c("alt1", "alt2", "alt3"))
head(riceml)


criceml <- mlogit(choice ~ frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)
criceml <- mlogit(choice ~  asc +frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data = riceml)

