april_average_delay <- function() {
  # flight$FL_DATE = ymd()
  flight %>%
    mutate(year = year(FL_DATE), month = month(FL_DATE), day = day(FL_DATE)) ->flight_new
  
  flight_new %>%
    filter(month == 4, day <= 7) %>%
    summarise(avg = mean(ARR_DELAY, na.rm = TRUE)) %>%
    print()
}

flight_quaterly_loss <- function() {
  flight_new %>%
    mutate(quarter = quarter(FL_DATE)) -> flight_new
  flight_new %>%
    filter(ARR_DELAY > 0) %>%
    group_by(quarter, OP_UNIQUE_CARRIER) %>%
    summarise(LOSS = sum(ARR_DELAY * 74.24))%>%
    arrange(desc(LOSS))
}

  
which_day <- function(){
  flight_new %>%
    count(month, day) %>%
    arrange(n)
}