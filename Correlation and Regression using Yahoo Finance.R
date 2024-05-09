library(tseries)
library(dplyr)
library(devtools)

#Directory Change
getwd()
setwd("C:\\Users\\kowth\\Desktop\\R\\Data")

#Getting the Data and Creating the required variables 
NIFTY<-read.csv("^NSEI_ASS.csv")
KO<-read.csv("KO_ASS.csv")
NClose<-NIFTY$Adj.Close
NRet<-(diff(log(NClose)))
KClose<-KO$Adj.Close
KRet<-(diff(log(KClose)))

#Graphs
par(mfrow=c(2,3)) #Closing
NLC<-plot(NClose,type="l",col="grey40",lwd=1,main="NIFTY Line Graph CP",xlab = "Date",ylab = "CP")
NDC<-plot(density(NClose),col="grey40",lwd=1,main="NIFTY Density CP")
NHC<-hist(NClose,col="grey40",breaks=50,main="NIFTY CP Histogram")
KLC<-plot(KClose,type="l",col="darkred",lwd=1,main="CocaCola Line Graph CP",xlab = "Date",ylab = "CP")
KDC<-plot(density(KClose),col="darkred",lwd=1,main="CocaCola Density CP")
KHC<-hist(KClose,col="darkred",breaks=50,main="CocaCola CP Histogram")
par(mfrow=c(2,3)) #Returns
NLR<-plot(NRet,type="l",col="grey40",lwd=1,main="NIFTY Line Graph Returns",xlab = "Date",ylab = "Returns")
NDR<-plot(density(NRet),col="grey40",lwd=1,main="NIFTY Density Returns")
NHR<-hist(NRet,col="grey40",breaks=50,main="NIFTY Returns Histogram")
KLR<-plot(KRet,type="l",col="darkred",lwd=1,main="CocaCola Line Graph Returns",xlab = "Date",ylab = "Returns")
KDR<-plot(density(KRet),col="darkred",lwd=1,main="CocaCola Density Returns")
KHR<-hist(KRet,col="darkred",breaks=50,main="CocaCola Returns Histogram")

#Correlation & Regression
Data<-left_join(NIFTY,KO,"Date")
View(Data)
Data<-na.omit(Data)
NR<-(diff(log(Data$Adj.Close.x)))
KR<-(diff(log(Data$Adj.Close.y)))
#Correlation
Correlation<-cor(NR,KR,method = "spearman")
Correlation
#Regression
Regression<-lm(NR~KR)
Regression
