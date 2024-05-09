library(lsr)
#Creating a Vector using random numbers and rounding them off to the closes whole no.
Variable<-c(round(runif(25,min = 1,max = 10)))
#Generating the Mean,Median,Mode,Range of Variable
Mean<-mean(Variable)
Median<-median(Variable)
Mode<-modeOf(Variable)
Range<-max(Variable)-min(Variable)
#Presenting the generated statistics in a Dataframe
DF<-data.frame(Mean=Mean,Median=Median,Mode=Mode,Range=Range)
DF
#summary can also be used to achieve similar outputs
Summary<-summary(Variable)
Summary
#Plotting the data to get a visual representation
plot(Variable,type="p",col="black",lwd="6",main="PLOT",xlab="X Axis",ylab="Y Axis")
