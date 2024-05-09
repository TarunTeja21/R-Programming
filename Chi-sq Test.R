library(ggplot2)
library(ggpubr)
library(dplyr)
library(MASS)

#Chi Sq. Test Type 1
Weekdays<-c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")
No_of_Accidents<-c(14,18,12,11,15,14,14)
Dataframe<-data.frame(Weekdays,No_of_Accidents)
View(Dataframe)
#Data Presentation
Summary_Statistics<-c(Count=length(No_of_Accidents),Mean=mean(No_of_Accidents),SD=sd(No_of_Accidents))
Summary_Statistics
#Chi Sq. Test
#H0: No significant association between Weekday and the number of accidents
#H1: Significant association between Weekday and the number of accidents
Type1<-chisq.test(Dataframe$No_of_Accidents)
Type1 #H1 is rejected as the p-value is greater than 0.05

#Chi Sq. Test Type 2
View(survey)
Survey<-data.frame(survey$Smoke,survey$Exer)
View(Survey)
#Data Presentation
Smoking_Data<-table(survey$Smoke,survey$Exer)
Summary_Statistics1<-addmargins(Smoking_Data)
Summary_Statistics1
#Chi Sq. Test
#H0: No significant association between Smoking Frequency and the Exercising Habits
#H1: Significant association between Smoking Frequency and the Exercising Habits
chisq.test(Smoking_Data) #H1 is accepted as the p-value is less than 0.05
