#05/10/2021------------
#Exercise: Write a script in R that solves a second or first degree equation

quad <- function(a, b, c)
{
  a <- as.complex(a)
  answer <- c((-b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a),
              (-b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a))
  
  if (all(Im(answer) == 0))
    answer <- Re(answer)
  if (answer[1] == answer[2])
    return (answer[1])
  answer
}


vara <-  readline("Enter numeric value for a: ")
varb <-  readline("Enter numeric value for b: ")
varc <-  readline("Enter numeric value for c: ")
vara <-  as.numeric(vara)
varb <-  as.numeric(varb)
varc <-  as.numeric(varc)
quadResult <-  quad(a = vara, b = varb, c = varc)




#Exercise: Write a script in R that finds the roots of the function f (x) = 3 * X ^ 4-2 * x ^ 3 + 2 * x-1
#in the interval [-10 ^ 6, 10 ^ 6] with step 0.5. As a root consider f (x) <= 0.05

root <- function()
{
  lowInterval <- -10 ^ 6
  upperInterval <- 10 ^ 6
  
  for (x in seq(lowInterval, upperInterval, by = 0.5))
  {
    print(sqrt((3 * x ^ 4) - (2 * x ^ 3) + (2 * x) - 1))
  }
}

root()


#Exercise: create a vector with 150 random positive integers in interval
#[1,20] by replacement. Create the frequency table without using the table command

(random = sample(1:20, 150, replace = TRUE))
countNum = rep(0, 20)

for (r in random)
{
  countNum[r] = countNum[r] + 1
}
countNum

(countTable = cbind(c(1:20), countNum))

#Exercise: Write a script with a function that accepts a positive integer and prints the value of its factorial
#(e.g 5!=1*2*3*4*5=120)

fact <- function(a)
{
  (factorial(a))
}

num <- readline("Enter positive number to generate factorial number: ")
num <- as.integer(num)

while (num < 0) {
  num <- readline("You have entered value less than 0. Pleaes try again: ")
  num <- as.integer(num)
}

fact(num)

#Exercise:Create a matrix with 100 random  positive integers (25X4, rowsXcolumns) from a uniform distribution in space [1, 3] by repositioning.
#Then in each element of the table to create a column of relative frequencies using the apply command

# (matrix.number <- matrix(floor(runif(100, min = 1, max = 3)), nrow = 25, ncol = 4))
# 
# relative_freq <- function(matrix_col)
#   matrix_col/length

#Exercise:Create a 4 - row and 5 - column dataframe with real numbers (use rnorm()) and place NA value in 7 random positions using
#the sample() function. Fill in the missing values with the total average of the dataframe

rnorm_data <-  matrix(rnorm(4*5), nrow = 4, ncol = 5)
seven_sample <- sample(rnorm_data, 7)
df <- data.frame(rnorm_data)
col.names <- c(1:5)
colnames(df) <- col.names

for (sample_value in seven_sample) {
  df[which(df == sample_value, arr.ind = TRUE)[1], which(df == sample_value, arr.ind = TRUE)[2]] <-  NA
}

mean_list = rep(0, 5)
for (c in 1:5) {
  mean_list[c] = mean(df[ , c], na.rm = TRUE)
}

mean_df <-  mean(mean_list)
na_index_df <- data.frame(which(is.na.data.frame(df), arr.ind = TRUE))

for (i in 1:nrow(na_index_df)){
  df[na_index_df[i, 1], na_index_df[i, 2]] = mean_df
}

# Exercise:Write a script in R that produces from uniform distribution 10000 random integers in space [1, 100]
# and places them on a square matrix 100X100. Find the basic descriptive statistics of the table as a whole, by line and by column 
# using simple commands (not using loops etc).

uniform_matrix <- matrix(runif(10000, min = 0, max = 1), nrow = 100, ncol = 100)
summary(uniform_matrix)


# Exercise:remove rows containing missing values from the airquality dataset. 
#Then, for the remaining rows select only those lines which had a temperature above 65F.(hint:use dplyr library)

airquality_dataset <- airquality
airquality_dataset[na.omit(airquality_dataset)["Temp"] > 65, ]
#OR
airquality_dataset[airquality_dataset[complete.cases(airquality_dataset),]["Temp"] > 65, ]
 
# Exercise:from the mtcars dataset sort the rows of the horsepower column in descending order. 
#Only the first 3 columns should be included in the results.

mtcars_dataset <- data.frame(mtcars)
mtcars_dataset[order(mtcars_dataset$hp, decreasing = TRUE), ][c("mpg", "cyl", "disp")]

# Exercise:The aim of this exercise is to become more familiar with the dplyr package. 
#Implement the following queries in R, using dplyr library functions.
# a) Load the  mtcars dataset provided by R, and convert it so that its class is tbl_df.

library(dplyr)
mtcars_tbl_df <- tibble(mtcars)
class(mtcars_tbl_df)

# b) Select the mpg, cyl and wt columns.

subset_mtcars_tbl_df <- mtcars_tbl_df %>% 
  select("mpg", "cyl", "wt") 

# c) Filter the selected subset and keep only the records with cyl equal to 8. 
#Then sort the records in ascending order in mpg and in descending order to wt.

subset_mtcars_tbl_df %>% 
  filter(cyl == 8) %>%
  arrange(mpg, desc(wt))
