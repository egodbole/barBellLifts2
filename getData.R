# Created: 2020-06-04

# downloading data
urlTrain <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
urlTest <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

if(!file.exists("pmlTrain.csv")){
        download.file(urlTrain,
                      destfile="pmlTrain.csv")
}

if(!file.exists("pmlTest.csv")){
        download.file(urlTest,
                      destfile="pmlTest.csv")
}

pmlTrain <- read.csv("pmlTrain.csv",
                     header=TRUE)
pmlTest <- read.csv("pmlTest.csv",
                    header=TRUE)
