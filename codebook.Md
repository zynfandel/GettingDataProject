---
title: "Codebook"
date: "Thursday, October 23, 2014"
---


###Raw Data


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeacceleration-XYZ and timegyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals timebodyacceleration-XYZ and timegravityacceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timebodyaccelerationjerk-XYZ  and timebodygyroscopejerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timebodyaccelerationmagnitude, timegravityaccelerationmagnitude, timebodyaccelerationjerkmagnitude, timebodygyroscopemagnitude, timebodygyroscopejerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencybodyacceleration-XYZ, frequencybodyaccelerationjerk-XYZ, frequencybodygyroscope-XYZ, frequencybodyaccelerationjerkmagnitude, frequencybodygyroscopemagnitude, frequencybodygyroscopejerkmagnitude.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each observation, there is the following data:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For the purposes of this assignment, only variables that measure the mean and standard deviation of each measurement have been used.



####Tidy Data


**The run_analysis.R script contains the following variables:**

This refers to the 30 volunteers, numbered 1 to 30.

*"subject"*

This refers to each of the six activities performed by each subject.

*"activity"*

These contain the mean value of the mean and standard deviation of each measurement for each subject and each activity:

*"timebodyaccelerationmeanx"                                  
"timebodyaccelerationmeany"                                  
"timebodyaccelerationmeanz"                                  
"timebodyaccelerationstandarddeviationx"                     
"timebodyaccelerationstandarddeviationy"                     
"timebodyaccelerationstandarddeviationz"                     
"timegravityaccelerationmeanx"                               
"timegravityaccelerationmeany"                               
"timegravityaccelerationmeanz"                               
"timegravityaccelerationstandarddeviationx"                  
"timegravityaccelerationstandarddeviationy"                  
"timegravityaccelerationstandarddeviationz"                  
"timebodyaccelerationjerkmeanx"                              
"timebodyaccelerationjerkmeany"                              
"timebodyaccelerationjerkmeanz"                              
"timebodyaccelerationjerkstandarddeviationx"                 
"timebodyaccelerationjerkstandarddeviationy"                 
"timebodyaccelerationjerkstandarddeviationz"                 
"timebodygyroscopemeanx"                                     
"timebodygyroscopemeany"                                     
"timebodygyroscopemeanz"                                     
"timebodygyroscopestandarddeviationx"                        
"timebodygyroscopestandarddeviationy"                        
"timebodygyroscopestandarddeviationz"                        
"timebodygyroscopejerkmeanx"                                 
"timebodygyroscopejerkmeany"                                 
"timebodygyroscopejerkmeanz"                                 
"timebodygyroscopejerkstandarddeviationx"                    
"timebodygyroscopejerkstandarddeviationy"                    
"timebodygyroscopejerkstandarddeviationz"                    
"timebodyaccelerationmagnitudemean"                          
"timebodyaccelerationmagnitudestandarddeviation"             
"timegravityaccelerationmagnitudemean"                       
"timegravityaccelerationmagnitudestandarddeviation"          
"timebodyaccelerationjerkmagnitudemean"                      
"timebodyaccelerationjerkmagnitudestandarddeviation"         
"timebodygyroscopemagnitudemean"                             
"timebodygyroscopemagnitudestandarddeviation"                
"timebodygyroscopejerkmagnitudemean"                         
"timebodygyroscopejerkmagnitudestandarddeviation"            
"frequencybodyaccelerationmeanx"                             
"frequencybodyaccelerationmeany"                             
"frequencybodyaccelerationmeanz"                             
"frequencybodyaccelerationstandarddeviationx"                
"frequencybodyaccelerationstandarddeviationy"                
"frequencybodyaccelerationstandarddeviationz"                
"frequencybodyaccelerationjerkmeanx"                         
"frequencybodyaccelerationjerkmeany"                         
"frequencybodyaccelerationjerkmeanz"                         
"frequencybodyaccelerationjerkstandarddeviationx"            
"frequencybodyaccelerationjerkstandarddeviationy"            
"frequencybodyaccelerationjerkstandarddeviationz"            
"frequencybodygyroscopemeanx"                                
"frequencybodygyroscopemeany"                                
"frequencybodygyroscopemeanz"                                
"frequencybodygyroscopestandarddeviationx"                   
"frequencybodygyroscopestandarddeviationy"                   
"frequencybodygyroscopestandarddeviationz"                   
"frequencybodyaccelerationmagnitudemean"                     
"frequencybodyaccelerationmagnitudestandarddeviation"        
"frequencybodybodyaccelerationjerkmagnitudemean"             
"frequencybodybodyaccelerationjerkmagnitudestandarddeviation"
"frequencybodybodygyroscopemagnitudemean"                    
"frequencybodybodygyroscopemagnitudestandarddeviation"       
"frequencybodybodygyroscopejerkmagnitudemean"                
"frequencybodybodygyroscopejerkmagnitudestandarddeviation"*