Rprof()

# Store script start time for later
start<-Sys.time()

# Load libraries
library(dplyr)

# Set ntrials and ngames
ntrials=1000000
ngames=30

# Create data frame; generate trial labels and player A buzz wins
dataframe<-data.frame(trial = rep(1:ntrials, times = 30),
                      buzz.A = sample(0:1,ntrials*ngames,replace=TRUE,prob=c(60,40))
                      # Let player A buzz wins render so we can use it for next step
                      ) %>%
  # Use player A buzz wins to determine player B buzz wins
  # Generate correct and incorrect answers for both players
  mutate(buzz.B = (1-buzz.A),
         correct.A = sample(0:1,ntrials*ngames,replace=TRUE,prob=c(20,80)),
         correct.B = sample(0:1,ntrials*ngames,replace=TRUE)
         # Let answers render again so we can use them for the next step
         ) %>%
  # Determine which rounds each player wins
  mutate(score.A = buzz.A*correct.A,
         score.B = buzz.B*correct.B
         # Let the scores render so we can use them for the next step
         ) %>%
  # Group the data by the trial labels
  group_by(trial) %>%
  # Sum the scores for the newly grouped trial data
  summarise(A.total=sum(score.A),
            B.total=sum(score.B))

# Chance A wins
mean(dataframe$A.total>dataframe$B.total)
# Chance B wins
mean(dataframe$B.total>dataframe$A.total)
# Chance of tie
mean(dataframe$A.total==dataframe$B.total)

# Check total run time based on current time vs script start time
render <- Sys.time()-start
print(render)

Rprof(NULL)
summaryRprof()