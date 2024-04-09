Rprof()
#Code for Monte Carlo Simulation
ntrials<-1000000
win.A<-0
win.B<-0
tie<-0
for(n in 1:ntrials){
  buzz.A<-sample(0:1,30,replace=TRUE,prob=c(60,40))
  buzz.B<-(1-buzz.A)
  correct.A<-sample(0:1,30,replace=TRUE,prob=c(20,80))
  correct.B<-sample(0:1,30,replace=TRUE)
  score.A<-sum(buzz.A*correct.A)
  score.B<-sum(buzz.B*correct.B)
  if(score.A>score.B){win.A<-win.A+1}
  if(score.A<score.B){win.B<-win.B+1}
  if(score.A==score.B){tie<-tie+1}
}

#Outcomes
#Chance A wins
win.A/ntrials
#Chance B wins
win.B/ntrials
#Chance of tie
tie/ntrials
Rprof(NULL)
summaryRprof()
