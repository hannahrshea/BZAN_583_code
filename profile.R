Rprof()
system.time()
library(dplyr)

ntrials=1000000
ngames=30

dataframe<-data.frame(trial = rep(1:ntrials, times = 30),
                      buzz.A = sample(0:1,ntrials*ngames,replace=TRUE,prob=c(60,40))
) %>%
  mutate(buzz.B = (1-buzz.A),
         correct.A = sample(0:1,ntrials*ngames,replace=TRUE,prob=c(20,80)),
         correct.B = sample(0:1,ntrials*ngames,replace=TRUE)
  ) %>%
  mutate(score.A = buzz.A*correct.A,
         score.B = buzz.B*correct.B
  ) %>%
  group_by(trial) %>%
  summarise(A.total=sum(score.A),
            B.total=sum(score.B))

#Chance A wins
mean(dataframe$A.total>dataframe$B.total)
#Chance B wins
mean(dataframe$B.total>dataframe$A.total)
#Chance of tie
mean(dataframe$A.total==dataframe$B.total)
system.time()
Rprof(NULL)
summaryRprof()
