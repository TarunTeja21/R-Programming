library(dplyr)
library(ggplot2)

#Analysis of Variance
data("PlantGrowth")
View(PlantGrowth)
levels(PlantGrowth$group)
Weight<-PlantGrowth$weight
Group<-PlantGrowth$group
tapply(Weight,Group,mean)
tapply(Weight,Group,length)
#Data Presentation
group_by(PlantGrowth,group) %>%summarise(Count=n(),Mean=mean(weight,na.rm=TRUE),SD=sd(weight,na.rm=TRUE))
#Normality Test
qplot(Group,Weight,data=PlantGrowth,geom="boxplot",colour="darkred") + ggtitle("Visual Normality Test") + theme(plot.title=element_text(hjust=0.5,face="bold",color="black")) + theme(legend.position = "none")
#H0: Data is normally distributed
#H1: Data is not normally distributed
tapply(Weight,Group,shapiro.test)
#H1 rejected as p-value is greater than 0.05
#Homogenity of Variance Test
#H0: The variences are statistically equal
#H1: The variences are not statistically equal
bartlett.test(Weight~Group)
#H1 rejected as p-value is greater than 0.05
#ANOVA Test
#H0: mu(ctrl)=mu(trt1)=mu(trt2)
#H1: At least one mean (weight of plant) is different
ANOVA<-aov(Weight~Group)
summary(ANOVA)
#Post Hoc Test
#H0: There is Significant Difference in the pair
#H1: There is no Significant Difference in the pair
TukeyHSD(ANOVA)
TukeyHSD(ANOVA,conf.level = 0.99)
#As Padj is less than 0.05 for the pair trt2-trt1,H1 is rejected for them