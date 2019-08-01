rice <-read.csv("/Users/kiran/Desktop/DI998 Dissertation/DataAnalysis/rice_ce/ce_demographic_complete.csv")

riceml <- mlogit.data(rice, choice = "choice", shape = "long",alt.levels = c("alt1","alt2","alt3"), id.var = "STR",varying=4:16)
criceml <- mlogit(choice ~ frog + bird + fish + location1 + cultivation1 + price | 0 | 0, data =riceml )
summary(criceml)

clogit <- gmnl(choice~ frog + bird + fish +location1 + cultivation1 + price | 0 | 0, data = riceml)
wtp.gmnl(clogit, wrt = "price")


