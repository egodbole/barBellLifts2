# Created: 2020-06-05

# ensuring data is loaded properly
if(!exists("training")){
        source("cleanData.R")
}

# exploring data

# loading relevant libraries
library(tidyverse)

head(training)

# removing identification data
training <- training %>%
                select(-(1:6))
testing <- testing %>%
                select(-(1:6))

# making all predictors numeric
nonNumerics <- c(1, 5, 9:14, 18, 22:27, 31, 35:39, 44, 48:51)
for(i in nonNumerics){
        training[, i] <- as.numeric(training[, i])
        testing[, i] <- as.numeric(testing[, i])
}

summary(training)

sapply(training, class)

# checking correlations
corr <- cor(training[, -53])

# there are a few variables with moderate-to-high correlations,let's try
#       principal components
