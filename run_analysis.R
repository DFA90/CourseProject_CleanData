library(dplyr)

# read in the three tables related to the test data
test1 <- read.table("test/X_Test.txt")
test2 <- as.factor(readLines("test/Y_Test.txt"))
test3 <- as.factor(readLines("test/subject_test.txt"))

testAll <- cbind(subject = test3, y = test2, test1) #combine to one table
    
# read in the three tables related to the train data
train1 <- read.table("train/X_train.txt")
train2 <- as.factor(readLines("train/Y_train.txt"))
train3 <- as.factor(readLines("train/subject_train.txt"))

trainAll <- cbind(subject = train3, y = train2, train1) #combine to one table

#combine test and train data
allData <- rbind(testAll, trainAll)

#rename the variables columns using the strings from "features.txt"
features <- readLines("features.txt")
names(allData)[3:563] <- sapply(features, function(i) strsplit(i, " ")[[1]][2], USE.NAMES = F)

#grep only the first towo columns and all features containing "mean" or "std"
cols <- grep("mean|std", names(allData))
allData <- allData[,c(1,2,cols)]

#use descriptive avtivity labels instead of factors for the second column
activities <- read.table("activity_labels.txt")[,2]
levels(allData[,2]) <- activities
names(allData)[2] <- "activities"

#tidy up (calculate mean for all columns grouped by subject and activity)
tidyData <- allData %>% 
    group_by(subject, activities) %>% 
    summarise_each(funs(mean))

#tidyData is the dataset asked for
    