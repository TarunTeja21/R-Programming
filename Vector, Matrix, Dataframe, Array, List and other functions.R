#Creating Vectors
Variable<-c(1:25)
Variable
Variable1<-c("Male","Female","Male","Female","Male","Male")
class(Variable) #Checking the class of the variable
length(Variable) #Checking the length of the variable
str(Variable) #Both length and class
summary(Variable) #Summarizing the variable
class(Variable1)

#Replace Function
Variable2<-replace(Variable,Variable>10,9)
Variable2

#Repeat Function
Variable3<-rep(10,10)
Variable3

#Converting a Variable into a factor
Gender<-as.factor(Variable1)
Gender
Gender<-factor(Variable1, levels = c("Male", "Female"), labels = c(1, 2))
Gender
class(Gender)

#Creating a Matrix
Matrix<-matrix(Variable,5,5,F)
Matrix1<-matrix(Variable,5,5,T)
Matrix
Matrix1
Matrix %*% Matrix1 #Matrix Multiplication

#Creating a Dataframe
Name<-c("Tarun", "Akankshya", "Ayushkant", "Abhinandan", "Abhishek","Abhipsa")
Roll_No<-c(004:009)
Math<-c(67,78,34,56,67,78)
Phy<-c(77,23,41,57,91,45)
Chem<-c(67,88,45,35,53,81)
Total<-Math+Phy+Chem
Percentage<-(Total/300)*100
Percentage<-round(Percentage)
Dataframe<-data.frame(Name,Roll_No,Math,Phy,Chem,Total,Percentage)
Dataframe
Dataframe<-cbind(Dataframe,"Status"=c("Pass","Pass","Fail","Fail","Pass","Pass")) #Adding a new coloumn showing pass/fail status
Dataframe<-rbind(Dataframe,"E"=c("Aditee",10,100,100,100,300,100,"Pass")) #Adding a new person as a row
Dataframe

#Creating a List
List<-list(1,2,3,"Tarun","Akankshya",Matrix,Dataframe)
List

#Creating an Array
List2<-list(c("r1","r2","r3"),c("c1","c2"))
Array<-array(c(12,23,45,56,89,76),dim=c(3,2,5),dimnames=List2)
Array
