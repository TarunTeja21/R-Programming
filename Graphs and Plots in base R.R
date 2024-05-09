View(iris)
Data<-(iris)
SLength<-iris$Sepal.Length
SWidth<-iris$Sepal.Width
PLength<-iris$Petal.Length
PWidth<-iris$Petal.Width
Species<-iris$Species
Colours<-c("#710193", "#9370DB", "#571B7E")
Mean_SL<-tapply(SLength,Species,mean)
#Barplot
barplot(Mean_SL,main="Barplot of Mean of Sepal Length by Iris Species",xlab="Species",ylab="Mean Sepal Lenth",col=Colours,ylim=c(0,max(Mean_SL)+1))
#Histogram
hist(SLength,main="Histogram of Sepal Length of Iris Species",breaks=15,ylim=c(0,20),xlab="Sepal Length",col=Colours[1])
#Pie Chart
pie(table(Species),labels=c("Setosa","Versicolor","Virginica"),main="Pie Chart of Distribution of the Iris Species",col=Colours)
#Scatter Plot
plot(SLength,SWidth,type="p",col=Colours,lwd=3,main="Scatter Plot of Sepal Length to Sepal Width of Iris Species",ylab="Sepal Width",xlab="Sepal Lenth")
#Locator
Point<-locator(1,type = "p",col = "red",pch = 19)
identify(Point$x,Point$y, labels = SLength)
#Pie Chart 3D
library(plotrix)
pie3D(table(Species),labels=c("Setosa","Versicolor","Verginica"),labelcex=1,labelcol="white",main="Pie Chart 3D of Distribution of the Iris Species",col=Colours,explode=0.1,radius = 3)
#Scatter Plot 3D
library(scatterplot3d)
scatterplot3d(SWidth,SLength,PWidth,color=Colours[1],main="3D Scatter Plot of Sepal Width Length and Petal Width of Iris Species")
