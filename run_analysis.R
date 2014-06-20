
run_analysis <- function () {

## start function, read test and train files out of directories

setwd("C:/Users/Arthur/Desktop/CourseraR/smartphonedata/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")


subtest <- read.table ("subject_test.txt", sep = "", header = FALSE)

xtest <- read.table ("X_test.txt" , sep = "", header = FALSE)

ytest <- read.table ("y_test.txt" , sep = "", header = FALSE)


setwd("C:/Users/Arthur/Desktop/CourseraR/smartphonedata/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")


subtrain <- read.table ("subject_train.txt", sep = "", header = FALSE)

xtrain <- read.table ("X_train.txt" , sep = "", header = FALSE)

ytrain <- read.table ("y_train.txt" , sep = "", header = FALSE)

## label with column names

colnames (subtest) <- "subject"
colnames (ytest)   <- "activity"
colnames (subtrain) <- "subject"
colnames (ytrain)   <- "activity"

## subset for mean and std features in columns and bind columns

featuresubset <- c (1:6, 41:46, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

xtestsubset <- xtest [, featuresubset]
df1 <- cbind (ytest, subtest, xtestsubset)

xtrainsubset <- xtrain [, featuresubset]
df2 <- cbind (ytrain, subtrain, xtrainsubset)

## bind test and train dataframes

dfboth <- rbind (df1, df2)

## order measurements with activity first, subjects second

ordervector <- order (dfboth$activity, dfboth$subject)
dfbothordered <- dfboth[ordervector, ]

## aggregate file (mean of windows per activity per subject) , leave out activity and subject columns, 


aggdata3 <-aggregate(dfbothordered [,3:62], by=list(dfbothordered$subject,dfbothordered$activity),
                     FUN=mean)

##remove 2 new group columns, make sure subjects and activities not mixed up!

aggdata4 <- aggdata3 [,3:62]

## set directory for reading the  features file
##editing and adding of column names to aggregated file

setwd("C:/Users/Arthur/Desktop/CourseraR/smartphonedata/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

features <- read.table ( "features.txt")
featurenames <- features [featuresubset, ]
featurenames2 <- featurenames [,2]
featurenames3 <- as.character (featurenames2)

colnames (aggdata4) <- featurenames3

colnames (aggdata4) <- tolower (colnames (aggdata4))
colnames (aggdata4) <- gsub ("-", " ", colnames (aggdata4))



## set directory for reading the activity and subject files
## editing and adding rownames to aggregated file

actlabels <- read.table ( "activity_labels.txt")
actlabels2 <- actlabels [,2]
actlabels3 <- as.character (actlabels2)
actlabels4 <- rep (actlabels3, each = 30)
actlabels5 <- tolower (actlabels4)
actlabels6 <- gsub ("_", " ", actlabels5)
persons <-  rep (c ("subject"), times = 180)
personsb <-   rep (as.character (c (1:30)), times = 6)
rownamesfinal <- paste (actlabels6, persons, personsb)

rownames (aggdata4) <- rownamesfinal

## set directory an save  tidydata file

setwd("C:/Users/Arthur/Desktop/CourseraR/R-output")

write.table (aggdata4, "tidydataset.txt", sep = ",")

## message

print ("tidydataset saved")
 


## close function

}


