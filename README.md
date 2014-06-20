tidy
====

coursera course project

## Readme

This repo contains a R-script run_analysis.R for obtaining a tidy data set and an accompanying file CodeBook.md describing the tidy data set output.
The original dataset with required files has been published and described in the UCI machine learning depository. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script is in R version 3.0.2 and runs under Windows platform: x86_64-w64-mingw32/x64 (64-bit)

- Script starts in any working directory on my local computer with absolute path structure for directories containing the Samsung data in my directories provided with the script.. 
- Function reads and subsets x_ train and x_test files with edited featurevector for mean and std variables 
- Binds activities and subject vectors to subsetted train and test files to obtain dataframes df1 and df2
- Rowbinds df1 and df2  to one dataframe 
- Orders measurements in dataframe according to 6 activities and 30 subjects
- Aggregates taking mean over windows for each activity and subject combination
- Deleting activity and subject columns to obtain aggdata4 dataframe 
- Edit and add columnames to dataframe
- Edit and add rownames to dataframe
- Save tidy dataset

Output  file tidydataset.txt will be saved to R-output directory on my computer and should be read with read.csv ()


