

##download 2019.csv from https://www.kaggle.com/sherrytp/airline-delay-analysis
##rename 2019.csv file to flights.csv and then import dataset to Rstudio


library(tidyverse)
glimpse(flights)
summary(flights)
########problem of big size

flights%>%
  group_by(OP_UNIQUE_CARRIER)%>%
  tally(sort=TRUE)

#Find carrier with the most flights
##alternative way
flights%>%
  count(OP_UNIQUE_CARRIER,sort=TRUE)

##Find the most "popular" destination
source("most_popular_destination.R")

##Find the most "popular" route
source("solutions.R")
most_popular_route()

##Find Atlanta's most popular carrier
atlanta_most_popular_carrier()

##Find the schedule table of the most popular flight
schedule_most_popular_flight()

##Now create a scatter plot with fl_date as x-axis and dep_delay as y-axis. Color points by carrier
res1%>%
  ggplot(aes(x=FL_DATE,y=DEP_DELAY,color=OP_UNIQUE_CARRIER))+geom_point()+scale_x_date(date_breaks = "1 month")

##Any ideas how to solve overplotting issue?

##Find the five longest destinations and select columns origin,dest and distance(discrete destinations)
##(hands on session)
five_longest_destinations()
  
##Find total average arr_delay on the first week of  April
april_average_delay()


##Find which day of the year was the busiest and which route was the most popular at this day
flights_new%>%
  count(month,day,sort=TRUE)->res
flights_new%>%
  filter(month==12,day==1)%>%
  count(ORIGIN,DEST,sort=TRUE)


##If one minute of delay on arrival costs $74.24 to a flight carrier then calculate and print quarterly losses by flight carrier
find_quarterly_costs()

##Find information from internet about the day with the min number of executed flights
which_day()


