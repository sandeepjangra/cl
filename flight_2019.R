install.packages("session")
install.packages("radiant")

library(session)

save.session(file = "instance.Rda")
restore.session(file = "instance.Rda")

library(tidyverse)
library(radiant)
flight <- read_csv(file = "flight_data/2019.csv")
glimpse(flight)
table(flight$ORIGIN)
summary(flight)

flight %>%
  count(OP_UNIQUE_CARRIER, sort = TRUE)

# Find most popular destination
source("most_popular_destination.R")


# Most popular routes
# source("solutions.R")
most_popular_routes()

# Find Atlanta's most popular flight
flight %>%
  filter(DEST = "ATL" || ORIGIN = "ATL") %>%
  count(OP_UNIQUE_CARRIER, sort = TRUE)


# Find the schedule table of the most popular flight
# schedule_most_popular_flight()

flight %>%
  count(OP_CARRIER_FL_NUM, sort = TRUE) -> res

res1 <- flight %>%
  filter(OP_CARRIER_FL_NUM == as.integer(res[1,1])) %>%
  print()

# Now create a scatter plot with fl_date on x-axis and dep_delay on y-axis, color point by carrier
res1 %>%
  ggplot(aes(x = FL_DATE, y = DEP_DELAY, color = OP_UNIQUE_CARRIER)) + geom_point() + scale_x_date(date_breaks = "1 month")


# Question: How to solve over plotting

# Find the longest destinations and select column origin, dest and distance (discrete destination)
flight %>%
  arrange(desc(DISTANCE)) %>%
  distinct(ORIGIN, DEST, .keep_all = TRUE) %>%
  slice(1, 10, 2) %>%
  select(ORIGIN, DEST, DISTANCE)


# Average delay on first week of April
source("solution.R")
april_average_delay()


# Which day of year was the busiest and which route was the most popular at this day
flight_new %>%
  count(month, date, sort = TRUE) -> res
flight_new %>%
  filter(month == 12, day == 1) %>%
  count(ORIGIN, DEST, sort = TRUE)


# Find one minute of arrival delay cost $74.24 for a flight carrier then calculate and print quarterly losses 
flight_quaterly_loss()


# Find information from internet about the day with min number of flights

which_day()
