#Greater than or Lesser than or Equal to
x<-120
y<-75
x>y
if(x>y){
  print("x is greater than y")
}else{
  print("x is lesser than y")
}

#Even or Odd
a<-42
b<-(a/2)
if(b==round(b)){
  print("Even")
}else{
  print("Odd")
}

#>75,>55,<55
Tarun<-round(runif(1,min=0,max=100))
if(Tarun>=75){
  print("First Class",Tarun)
} else if (Tarun>=55){
  print("Second Class",Tarun)
} else {
  cat("Third Class",Tarun)
}

#For loop
for(i in c(1,2,3,4,5,6,7,8,9,10))
{
  print(i^2)
}
for(a in c(1,2,3,4,5,0,6,7,8,9))
{
  if (a==0){
    break #prints till 0 
  }
  print(a)
}
for(b in c(1,2,3,4,5,0,6,7,8,9))
{
  if (b==0){
    next #ingores 0 and prints the rest
  }
  print(b)
}