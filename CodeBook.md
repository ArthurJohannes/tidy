# Code book for tidy data set

Output of script run_analysis.R is a textfile  tidydataset.txt  to be read with read.csv () function of R programming language.
The resulting tidy data set is derived from the original Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

### Experimental set-up:

Using a smartphone embedded accelerometer and gyroscope, the authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz for 30 subjects performing 6 different activities. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The body linear acceleration and angular velocity as determined by gyroscope were derived in time to obtain jerk signals. Also, the magnitudes of these three-dimensional signals were calculated. A Fast Fourier Transform (FFT) was applied to some of these signals. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Features were normalized and bounded between -1 and  +1.

### Citation for the original experiment: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
The original dataset has been published and described in the UCI machine learning depository. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Tidy dataset description:

Tidydataset is a dataframe containing 180 observations for 6 times 30 combinations of activities and subjects (rows) and with 60 variables (columns).  To obtain this tidy dataset, the original x_train and x_test files containing 561 normalized variable values were combined, The means and standard deviation variables for 16 features were selected, and then averaged by activity and subject.
The values of the variables are averages of normalized values within range -.1.0 and + 1.0 and are unit-less. Variables are labelled mean for mean and std for standard deviation. x,y,z are axes of acceleration for accelerometer or velocity in case of gyroscope measurements. 

### Further explanation on abbreviated variable names:

- 1-6: time domain body acceleration
- 7-12:  time domain gravity acceleration
- 13-18: time domain body gyroscope velocity
- 19-24: time domain body gyroscope jerk
- 25-26: time domain body acceleration magnitude
- 27-28: time domain gravity acceleration magnitude
- 29-30: time domain body acceleration jerk magnitude
- 31-32: time domain body gyroscope velocity magnitude
- 33-34: time domain body gyroscope jerk magnitude
- 35-40: frequency domain body acceleration
- 41-46: frequency domain body acceleration jerk magnitude
- 47-52: frequency domain body gyroscope velocity
- 53-54: frequency domain body acceleration magnitude
- 55-56: frequency domain body acceleration jerk magnitude
- 57-58: frequency domain body gyroscope velocity magnitude
- 59-60: frequency domain body jerk magnitude

The rownames of the 180 observations are fully descriptive and ordered first per activity and secondly per subject/person.

