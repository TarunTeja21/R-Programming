library(ggplot2)
library(ggpubr)
library(dplyr)

#Non-Parametric Tests
#Wilcoxon Singed Rank Test
#Normality Tests
data("CO2")
Uptake<-(CO2$uptake)
Type<-(CO2$Type)
#Data Presentation
Summary_Statistics<-c(Count=length(Uptake),Median=median(Uptake))
Summary_Statistics
#Normality test
ggqqplot(Uptake,title="Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black"))
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(Uptake)
#H1 is accepted as p-value is lesser than 0.05
#Comparision of Median/Wilcoxon Signed Rank Test
#H0: Median difference between paired observations is zero
#H1: Median difference between paired observations is not zero
WSRT<-wilcox.test(CO2$uptake,mu=30,alternate="less")
WSRT #H1 is rejected as p-value is greater than 0.05

#Wilcoxon Rank Sum Test (Man Whitney U Test)
Treatment<-(CO2$Treatment)
Dataframe<-data.frame(Treatment,Uptake)
Nonchilled<-Uptake[Treatment=="nonchilled"]
Chilled<-Uptake[Treatment=="chilled"]
#Data Presentation
group_by(Dataframe,Treatment) %>% summarise(Count=n(),Median=median(Uptake,na.rm = TRUE))
#Normality Test
qplot(CO2$Treatment,xlab="Treatment",CO2$uptake,ylab="Uptake",data = CO2,geom = "boxplot",colour="darkred") + ggtitle("Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black")) + theme(legend.position = "none")
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(Chilled)
#H1 is accepted as data is less than 0.05
#H0: Data is normally distributed
#H1: Data is not normally distributed
shapiro.test(Nonchilled)
#H1 is accepted as data is less than 0.05
#Comparision of Median/Wilcoxon Rank Sum Test
#H0: The distributions of the two groups are statistically equal
#H1: The distributions of the two groups are not statistically equal
WRST<-wilcox.test(Uptake~Treatment,data=Dataframe,paired=F)
WRST

#Non-Parametric version of Anova test
#H0: Median of CO2 Uptake are similar in all samples
#H1: Median of CO2 Uptake are different
Kruskal<-kruskal.test(CO2$uptake~CO2$Plant)
Kruskal