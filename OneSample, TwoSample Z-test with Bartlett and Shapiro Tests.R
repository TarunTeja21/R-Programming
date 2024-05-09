library(BSDA)
library(ggplot2)
library(ggpubr)
library(dplyr)

#One Sample Z-test
IQ<-c(88,92,94,94,96,97,97,97,99,99,105,109,109,109,110,112,112,113,114,115)
Population_Mean<-100
SD_IQ<-sd(IQ)
#Data Presentation
Summary_Statistics<-c(Count=length(IQ),Mean=mean(IQ),SD=SD_IQ)
Summary_Statistics
#Normality test
ggqqplot(IQ,title="Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black"))
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(IQ)
#H1 rejected as p-value is greater than 0.05
#Z-test
One_Sample<-z.test(IQ,mu=Population_Mean,sigma.x=SD_IQ)
One_Sample

#Two Sample Z-test
CityA<-c(82,84,85,89,91,91,92,94,99,99,105,109,109,109,110,112,112,113,114,114)
CityB<-c(90,91,91,91,95,95,99,99,108,109,109,114,115,116,117,117,128,129,130,133)
SDA<-sd(CityA)
SDB<-sd(CityB)
Dataframe<-data.frame(City=c(rep("CityA",20),rep("CityB",20)),IQ=c(CityA,CityB))
#Data Presentation
group_by(Dataframe,City) %>% summarise(Count=n(),Mean=mean(IQ,na.rm = TRUE),SD=sd(IQ,na.rm = TRUE))
#Normality Test
qplot(City,IQ,data=Dataframe,geom = "boxplot",colour="darkred") + ggtitle("Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black")) + theme(legend.position = "none")
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(CityA)
#H1 accepted as p-value is lesser than 0.05 (as shapiro test is too sensitive to larger data it shows the data is not normally distribtued)
shapiro.test(CityB)
#H1 rejected as p-value is greater than 0.05
#Homogenity of Variance Test
#H0: The variences are statistically equal
#H1: The variences are not statistically equal
bartlett.test(IQ~City,data=Dataframe)
#H1 rejected as p-value is greater than 0.05
#Z-Test
#H0: IQ of City A = IQ of City B
#H1: IQ of City A ≠ IQ of City B
Two_Sample<-z.test(CityA,CityB,alternative="two.sided",conf.level=0.95,sigma.x=SDA,sigma.y=SDB)
Two_Sample #H1 accepted as p-value is greater than 0.05