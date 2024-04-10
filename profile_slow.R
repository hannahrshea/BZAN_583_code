Rprof()

# Store script start time for later
start<-Sys.time()

# Set ntrials
ntrials<-1000000

# Initialize counters
win.A<-0
win.B<-0
tie<-0

# Create for-loop for 1,000,000 reps
for(n in 1:ntrials){
  # Generate player A buzz wins
  buzz.A<-sample(0:1,30,replace=TRUE,prob=c(60,40))
  # Determine player B buzz wins
  buzz.B<-(1-buzz.A)
  # Determine correct answers for both players
  correct.A<-sample(0:1,30,replace=TRUE,prob=c(20,80))
  correct.B<-sample(0:1,30,replace=TRUE)
  # Determine final scores
  score.A<-sum(buzz.A*correct.A)
  score.B<-sum(buzz.B*correct.B)
  # Add tally to the correct counter based on the outcome
  if(score.A>score.B){win.A<-win.A+1}
  if(score.A<score.B){win.B<-win.B+1}
  if(score.A==score.B){tie<-tie+1}
}

# Chance A wins
win.A/ntrials
# Chance B wins
win.B/ntrials
# Chance of tie
tie/ntrials

# Check total run time based on current time vs script start time
render <- Sys.time()-start
print(render)

Rprof(NULL)
summaryRprof()