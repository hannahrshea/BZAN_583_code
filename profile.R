Rprof()
library(readr)
library(randomForest)
setwd("C:/Users/hrj33/Downloads/BZAN542-Files Data Mining/BZAN542-GroupProject")
project542data <- read_csv("project542data.csv")
sample_size <- 0.01
subset_data <- project542data[sample(seq_len(nrow(project542data)), size=floor(sample_size*nrow(project542data))),]
rf_model <- randomForest(INCWAGE ~ .,
                         data = training_data,
                         ntree = 200,
                         importance = TRUE)
Rprof(NULL)
summaryRprof()
