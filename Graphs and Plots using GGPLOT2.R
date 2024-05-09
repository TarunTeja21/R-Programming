library(ggplot2)
library(ggpubr)
View(diamonds)
data("diamonds")
par(mfrow=c(1,3))
#Basic GGplot2 plots using diamonds dataset
Scatterplot_E<-qplot(carat, price, data = diamonds)
Scatterplot_L<-qplot(log(carat), log(price), data = diamonds)
Densityplot<-qplot(carat, x * y * z, data = diamonds)
ggarrange(Scatterplot_E,Scatterplot_L,Densityplot,ncol=3,nrow=1)
#Taking a sample of the diamonds dataset and making scatterplot to show different colours and cuts
DIA<-diamonds[sample(nrow(diamonds), 100),]
Colour<-qplot(carat, price, data = DIA, colour = color)
Shape<-qplot(carat, price, data = DIA, shape = cut)
ggarrange(Colour,Shape,ncol=2,nrow=1)
#Checking where the bulk of the points lie using ggplot2
Transparncy_one<-qplot(carat, price, data = diamonds, alpha = I(1/10))
Transparncy_two<-qplot(carat, price, data = diamonds, alpha = I(1/100))
Transparncy_three<-qplot(carat, price, data = diamonds, alpha = I(1/200))
ggarrange(Transparncy_one,Transparncy_two,Transparncy_three,nrow=1,ncol=3)
#Adding a smoother to the plots
Sample<-qplot(carat, price, data = DIA, geom = c("point", "smooth"))
Data<-qplot(carat, price, data = diamonds, geom = c("point", "smooth"))
ggarrange(Sample,Data,nrow=1,ncol=2)
#Jitters and Boxplots
Jitter<-qplot(color,price/carat, data = diamonds,geom = "jitter")
Box<-qplot(color,price/carat, data = diamonds,geom = "boxplot")
ggarrange(Jitter,Box,nrow=1,ncol=2)
#Checking normality using ggpubr
ggqqplot(DIA$carat)

