library(ggplot2)
library(ggpubr)
library(dplyr)

#One Sample T-test
Sample_Scores<-c(19,21,25,16,17,14,21)
Population_Mean<-20
#Data Presentation
Summary_Statistics<-c(Count=length(Sample_Scores),Mean=mean(Sample_Scores),SD=sd(Sample_Scores))
Summary_Statistics
#Normality test
ggqqplot(Sample_Scores,title="Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black"))
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(Sample_Scores)
#H1 rejected as p-value is greater than 0.05
#T-Test
#H0: Sample Mean = Population Mean
#H1: Sample Mean ≠ Population Mean
One_Sample<-t.test(Sample_Scores,mu=Population_Mean,alternative="two.sided")
One_Sample #H1 rejected as p-value is greater than 0.05

#Two Sample T-tests
#Independent T-test
LabA<-c(8,9,9,6,4,6)
LabB<-c(7,8,6,4,5,6)
Dataframe<-data.frame(Lab=c(rep("LabA",6),rep("LabB",6)),Sugar_Cont=c(LabA,LabB))
View(Dataframe)
#Data Presentation
group_by(Dataframe,Lab) %>% summarise(Count=n(),Mean=mean(Sugar_Cont,na.rm = TRUE),SD=sd(Sugar_Cont,na.rm = TRUE))
#Normality Test
qplot(Lab,Sugar_Cont,data=Dataframe,geom = "boxplot",colour="darkred") + ggtitle("Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black")) + theme(legend.position = "none")
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(LabA)
#H1 rejected as p-value is greater than 0.05
shapiro.test(LabB)
#H1 rejected as p-value is greater than 0.05
#Homogenity of Variance Test
#H0: The variences are statistically equal
#H1: The variences are not statistically equal
bartlett.test(Sugar_Cont~Lab,data=Dataframe)
#H1 rejected as p-value is greater than 0.05
#T-Test
#H0: Sugar Content obtained by Lab A = Sugar Content obtained by Lab B
#H1: Sugar Content obtained by Lab A ≠ Sugar Content obtained by Lab B
Indpendent<-t.test(Sugar_Cont~Lab,Dataframe,alternative="two.sided",conf.level=0.95)
Indpendent #H1 rejected as p-value is greater than 0.05

#Paired T-test
Before<-c(112,113,118,120,119,113,110,122)
After<-c(116,120,117,125,126,111,111,117)
Difference<-c(Before-After)
Difference<-abs(Difference)
Dataframe2<-data.frame(Time=c(rep("Before",8),rep("After",8),rep("Difference",8)),BP=c(Before,After,Difference))
View(Dataframe2)
#Data Presentation
group_by(Dataframe2,Time) %>% summarise(Count=n(),Mean=mean(BP,na.rm = TRUE),SD=sd(BP,na.rm = TRUE))
#Normality Test
Subset_Dataframe<- subset(Dataframe2, Time %in% c("Before", "After"))
qplot(Time,BP,data=Subset_Dataframe,geom = "boxplot",colour="darkred") + ggtitle("Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black")) + theme(legend.position = "none")
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(Before)
#H1 rejected as p-value is greater than 0.05
shapiro.test(After)
#H1 rejected as p-value is greater than 0.05
#Homogenity of Variance Test
#H0: The variences are statistically equal
#H1: The variences are not statistically equal
bartlett.test(BP~Time,data=Subset_Dataframe)
#H1 rejected as p-value is greater than 0.05
#T-Test
#H0: Sugar Content obtained by Lab A = Sugar Content obtained by Lab B
#H1: Sugar Content obtained by Lab A ≠ Sugar Content obtained by Lab B
Paired<-t.test(BP~Time,Subset_Dataframe,alternative="two.sided",paired=TRUE,conf.level=0.95)
Paired #H1 rejected as p-value is greater than 0.05