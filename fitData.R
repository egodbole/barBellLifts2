# Created: 2020-06-06

# loading relevant libraries
library(caret)

# ensuring data is loaded rpoperly
if(!exists("corr")){
        source("exploreData.R")
}

# fitting models
preProc <- preProcess(training[, -53], method="pca", thresh=0.8)
trainPC <- predict(preProc, training[, -53])

ptm1 <- proc.time()
fit1 <- train(classe ~ ., data=training, method="rpart")
print(proc.time() - ptm1)
confusionMatrix(predict(fit1, training), training$classe)

ptm2 <- proc.time()
fit2 <- train(x=trainPC, y=training$classe, method="ranger",
              trControl=trainControl(method="repeatedcv", verboseIter=F))
confusionMatrix(predict(fit2, trainPC), training$classe)
print(proc.time()-ptm2)

# testing on prediction set
testPC <- predict(preProc, testing[, -53])
predict(fit1, testing)
predict(fit2, testPC)
