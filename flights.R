---title:"R Notebook"
output:html_notebook---# The data set can be found at https://www.kaggle.com/akulbahl/covid19-airline-flight-delays-and-cancellations
  # There is information about the content of each data variable.
  #
  # The following chunk must be run first before loading your dataset to enter the necessary libraries to execute the present code
  
  
  #Enter the names of packages
  if (require("tidyverse") == FALSE) {
    install.packages("tidyverse")
  }
#hello
library("tidyverse")


# Q.1
# Find the number of flights operated for each airline per month and display the results in descending order.

flightData <- read_csv("flight_data/jantojun2020.csv")

flightData %>% group_by(MKT_UNIQUE_CARRIER, MONTH) %>%
  tally() %>%
  arrange(desc(n))

# Q.2
# Find and display in which month and which day of this month throughout the registration period
# there were the most type D cancellations for the departure airport with the code "LAX"

flightData %>% filter(ORIGIN == "LAX", CANCELLATION_CODE == "D") %>%
  select(ORIGIN, CANCELLATION_CODE, MONTH, DAY_OF_MONTH)


# Q.3 Find and display the three-digit codes of the first 3 airports (destination airports)
# that had the most traffic during the hours (12.00-14.00) for the months of January to March.

flightData %>% filter(CRS_DEP_TIME >= 1200 |
                        CRS_DEP_TIME <= 1400) %>%
  filter(MONTH == c(1:3)) %>%
  group_by(ORIGIN) %>%
  tally() %>%
  arrange(desc(n)) %>%
  top_n(3)

# Q.4 Find the flight with the second longest distance.
# Then display the average monthly delay in minutes (ARR_DELAY> 0) for the period January-April.

SECOND_LONG <- flightData %>% distinct(DISTANCE) %>%
  arrange(desc(DISTANCE)) %>%
  slice_max(DISTANCE, n = 2) %>%
  slice_min(DISTANCE, n = 1)

flightData %>% filter(DISTANCE == SECOND_LONG$DISTANCE) %>%
  filter(MONTH == seq(1, 4)) %>%
  group_by(MONTH) %>%
  #mutate(AVG_MONTH_DELAY = mean(DEP_DELAY, na.rm = TRUE)) %>%
  summarise(AVG_MONTH_DELAY = mean(DEP_DELAY, na.rm = TRUE),
            n = n())
select(MONTH, AVG_MONTH_DELAY) %>%
  distinct()


# Q.5
# Find the flight (flight code) with the most scheduled itineraries for the recording interval.
# Then for the specific flight to represent in a diagram all the itineraries as follows:
#   horizontal axis the day of the month, vertical axis the real departure time and in a grid panel the months.


# Q.6
# Calculate and display which airport (departure location) had the most flights with delays (departures)
# of more than half an hour due to air carriers in the second ten days of February.

flightData %>%
  filter(!is.na(CARRIER_DELAY)) %>%
  filter(DEP_DELAY >= 30) %>%
  filter(MONTH == 2) %>%
  filter(DAY_OF_MONTH > 15) %>%
  group_by(ORIGIN) %>%
  select(ORIGIN) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  top_n(1)

# Q.7
# What was the route (flight) with the most cancellations type D. 
# Display the details of the columns MKT_UNIQUE_CARRIER as DEST_STATE_NM for this route.

flightData %>%
  filter(CANCELLATION_CODE == "D") %>%
  group_by(MKT_UNIQUE_CARRIER, DEST_STATE_NM) %>%
  summarise(n=n()) %>%
  select(MKT_UNIQUE_CARRIER, DEST_STATE_NM, n) %>%
  arrange(desc(n))

# Q.8
# Calculate and display how many cancellations of type A flights occurred on the 13th day of each month of the recording period. 
# Visualize these flights as follows:horizontal axis departure airport, vertical axis arrival airport, 
# coloring points based on airline ~ month

flightData %>%
  filter(DAY_OF_MONTH == 13) %>%
  filter(CANCELLATION_CODE == "A") %>%
  #filter(MKT_UNIQUE_CARRIER == "AA") %>%
  group_by(MKT_UNIQUE_CARRIER, MONTH) %>%
  select(MKT_UNIQUE_CARRIER, MONTH, ORIGIN, DEST) %>%
  tally()
# How this can be done. Needs to check further.


# Q.9
# Find for each airport the total number of flights cancelled during the registration period. 
# If we consider that from each flight the airport earns from landing fees 1500 euros, 
# find the total revenue lost for each airport per airline. 
# Also visualize this loss of revenue as follows:horizontal axis airport, vertical axis loss of revenue 
# and each point being colored based on the column of airline names.

REV_LOST_BY_AIRPORT <- flightData %>%
  filter(CANCELLED == 1) %>%
  group_by(DEST) %>%
  summarise(COUNT_AIRPORT = n()) %>%
  mutate(REV_LOST_BY_AIRPORT = COUNT_AIRPORT * 1500) %>%
  ungroup()


REV_LOST_BY_AIRPORT_BY_FLIGHT <-   flightData %>%
  filter(CANCELLED == 1) %>%
  group_by(MKT_UNIQUE_CARRIER) %>%
  summarise(COUNT_FLIGHT = n()) %>%
  mutate(REV_LOST_BY_AIRPORT_BY_FLIGHT = COUNT_FLIGHT * 1500)

sum(REV_LOST_BY_AIRPORT$REV_LOST_BY_AIRPORT)
sum(REV_LOST_BY_AIRPORT_BY_FLIGHT$REV_LOST_BY_AIRPORT_BY_FLIGHT)
