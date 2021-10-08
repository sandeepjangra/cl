#05/10/2021

#Let's print something
print("hello world")
cat("hello word")

#the useful paste command
i=1
paste("concatenate with",i)
#Get the working directory path
getwd()

#Set your own working path

setwd("enter your path")

#R's basic data structures

#Vector (or one-dimension array)
######################
a=c(0,2,5,8) #create a vector
a[3]#View content of a specific vector element
print(a[3])#Same as previous line
cat(a[3]) #Same as previous line

x=c(1.1,2.3,5.1)
x=as.integer(x) #type overloading
print(x)
a[2]=8#Insert a new element in a vector
a=a[-3]#Delete element from vector

#Subsetting
set.seed(123)
b=sample(1:100,25,replace=TRUE)#production of 25 random integers by uniform distribution in space [1,100] by replacement
b[4:11]
max(b)#find max element
min(b)#find min element
which.max(b)
which.min(b)
#indexes for all max elements
which(b==3)#indexes for all elements matching a conditional
b>30 #returns a vector with logical values
b[b>30]#return vector items with values greater than 30
sort(b)#sort in ascending order
sort(b,decreasing = TRUE)#sort in descending order


#Generate a vector of consecutive integers
d=3:14
e=seq(3,14,0.1)
e
#Vector operations

x=1:4
y=6:9
x*y #element-element vector multiplication


#Create a vector of sequential numbers with step
d1=seq(1,4,0.7)

#Create a vector with a repeating pattern
d2=rep(1:3,2)

d2
#Display objects in the working enviroment
ls()#The same can be seen from the tab enviroment

#Object size
length(d1)

#Enter a value from the keyboard
n <- readline(prompt="Enter a number: ")
n=as.numeric(n)#because by default the readline command saves the entered value as a character

s=as.numeric(readline(prompt="enter value:"))

#Conditionals(1)
########################
x=sample(1:100,1)
if (x%%2==0){
  print("even")
}else{
  print("odd")
}

#Conditionals(2)
##########################
x=sample(1:100,1)
if (x<=10){
  x=x+2
}else if(x<=40){
  x=x-4
}else{
  print("alternative solution")
}

#Exercise 1: Write a script in R that solves a second or first degree equation

#Loops(1)
for (i in seq(1,10,2)){
  print(i)
}

#Loops(2)
i<-11
s<-0
while (i<100){
  s<-s+i^2
  print(s)
  i=i+2
}



#Matrix
###############################
#A table has 2 dimensions. It consists of rows and columns. 
#The number of column rows remains unchanged after its creation

#Creating a 5x4 matrix with random integers from a uniform distribution 
#with replacement
b=matrix(sample(1:100,20,replace=TRUE),5,4)
dim(b)=c(2,10)#Change matrix dimensions
print(b[2,9])#print matrix item

#
rownames(b)=c("first row","second row") #rename rows
b[,6] #sixth column printing

b["first row",] #print row through its name

#########Create column names
myColNames=c()
for (i in 1:ncol(b)){
  myColNames[i]=paste("column",i)
}
colnames(b)=myColNames
#########

rowSums(b) #sums per row
colSums(b) #sums per column
rowMeans(b) #average per row
colMeans(b) #average per column
summary(b)#descriptive statistics for each column (useful!)


#Matrix multiplication
x=matrix(1:4,2,2)
y=matrix(rep(10,4),2,2)
x%*%y #matrix multiplication


set.seed(123)
table(sample(1:20,150,replace=TRUE))

#data frames
#######################################
mtcars #pre-installed data frame στην R
iris #pre-installed data frame στην R
str(mtcars)#show internal structure of on R object
data(package = .packages(all.available = TRUE))#all available datasets per library

mtcars$hp #display the hp column of the dataframe mtcars
data() #display of pre-installed dataset in R
mtcars[1,4]#display of 1st row, 4th column item
mtcars$hp[1]#same result as the above command
cbind(mtcars$mpg,mtcars$disp) #concatenate columns

#List
l=letters
m=sample(1:10,25,replace=TRUE)
n=factor(c("male","female","female","male")) #create a factor(categorical variable)
o=matrix(sample(1:10,12,replace=TRUE),3,4)
mylist=list(l,m,n,o)#create list
mylist[[2]] #access second object of the list
mylist[[2]][1] #access first element of the second object of the list
str(mylist) #list object structure

#Missing values
##############################33
z=sample(1:1000,100,replace=FALSE)
p=sample(1:100,14,replace=FALSE)
z[p]=NA 
na.omit(z) #omission of ΝΑ values
is.na(z) #logical control for NA values
which(is.na(z)) #find NA values 
sum(z,na.rm=TRUE) #find sum by omitting NA values
z[which(is.na(z))]=round(mean(z,na.rm = TRUE)) #fill NA values with mean and then round them to closest integer

#Functions
#######################
myfun<-function(r){
  r=r+3
  print(r)
  
}


#lapply (apply function to each object of a list - very usefull)
rnorm(7,mean=0, sd=1)#random generation for the normal distribution
runif(5,min=1,max=100)#random number generation from uniform distribution with given min max values 
x=list(a=1:5,b=rnorm(10))
lapply(x,mean)#application per list object of the mean function
k=matrix(sample(1:10,6,replace=FALSE),2,3)
lapply(k,function(myd){r=factorial(myd);r=r+1})#επιστρέφει λίστα με το παραγοντικό κάθε στοιχείου του πίνακα αυξημένο κατά 1
#apply
y=matrix(rnorm(10),2,5)
apply(y,1,sum)#application of a function by row
apply(y,2,sum)#application of a function by column

#finding distance table/matrix
dist(runif(5,0,10))
dist(matrix(rnorm(30),nrow=6))

###check for tidyverse installation->if there is no installation, then install and load tidyverse
if(!require("tidyverse")==TRUE){
  install.packages("tidyverse")
}
library(tidyverse)


# filter rows (row filtering)
#dataset iris
iris
filter(iris, Species == "setosa")#select rows under conditional
filter(iris, Species == "setosa",Sepal.Width>3.8,Petal.Length>mean(Petal.Width))

# select columns
select(iris, Sepal.Width, Petal.Width) 
select(iris, Sepal.Length:Petal.Length) 
select(iris, -Sepal.Width, -Petal.Width) 

# arrange (sort) rows by column values
arrange(iris,Sepal.Length)
arrange(iris,desc(Sepal.Length))
arrange(iris,desc(Sepal.Length),desc(Petal.Length))


#group by (create group of rows and summarize them)
group_by(iris, Species)

#summarise(aggregation)#Commonly used with group_by
summarise(group_by(iris, Species),members = n())# number of flower per species

#2nd way (same output)
iris%>%
  group_by(Species)%>%
  tally()->result
  result
  
#mutate(create a new column)
mutate(iris,new_col=seq(1:nrow(iris)))

iris%>%
  mutate(random_attribute_value=sample(1:100,150,replace = TRUE))

#Calculation of flower names of the group virginica that had the highest values of Sepal.Length (sequential)

#1ος τρόπος(with variable creation!not a good approach in terms of computer memory)
f1<-cbind(iris,id=seq(1:nrow(iris)))
f2<-filter(f1,Species=="virginica")
f3<-arrange(f2,desc(Sepal.Length))
f3$id[1:3]
#2nd way(nesting) (maybe difficult for others to read)
a<-arrange(filter(cbind(iris,id=seq(1:nrow(iris))),Species=="virginica"),desc(Sepal.Length))
a$id[1:3]


#An efficient way to write the solution
#3rd way (using pipelines)
iris%>%
  mutate(id=seq(1:nrow(iris)))%>%
  filter(Species=="virginica")%>%
  arrange(desc(Sepal.Length))%>%
  select(id)%>%
  slice(1:3)



#JOINS
inner_join(band_members,band_instruments)
left_join(band_members,band_instruments)
right_join(band_members,band_instruments)
semi_join(band_members,band_instruments)
anti_join(band_members,band_instruments)
full_join(band_members,band_instruments)

#more commands/reference cards at https://dplyr.tidyverse.org/reference/index.html










