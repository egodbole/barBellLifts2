# Created: 2020-06-04

# loading relevant libraries
library(caret)

# making sure data is loaded properly
if(!exists("pmlTrain")){
        source("getData.R")
}

# cleaning data

# identifying mostly NA columns and removing them
NAs <- which(is.na(pmlTrain[1, ]))
training <- pmlTrain[, -NAs]

# checking for near zero variance predictors and removing them
nzv <- nearZeroVar(training)
training <- training[, -nzv]

testing <- pmlTest[, -NAs]
testing <- testing[, -nzv]
