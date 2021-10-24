most_popular_route<-function(){
  flights%>%
    group_by(ORIGIN,DEST)%>%
    tally(sort=TRUE)->res
  print(res)
  
}

atlanta_most_popular_carrier<-function(){
  flights%>%
    filter(DEST=="ATL" || ORIGIN=="ATL")%>%
    count(OP_UNIQUE_CARRIER,sort=TRUE)->res
  print(res)
    
  
}

schedule_most_popular_flight<-function(){
  flights%>%
    count(OP_CARRIER_FL_NUM,sort=TRUE)->res
  
  flights%>%
    filter(OP_CARRIER_FL_NUM==as.integer(paste(res[1,1])))->res1
  print(res1)
  
}

five_longest_destinations<-function(){
  flights%>%
    arrange(desc(DISTANCE))%>%
    distinct(ORIGIN,DEST,.keep_all = TRUE)%>%
    slice(seq(1,10,2))%>%
    select(ORIGIN,DEST,DISTANCE)

}

april_average_delay<-function(){
    flights$FL_DATE=ymd()
    flights%>%
      mutate(year=year(FL_DATE),month=month(FL_DATE),day=day(FL_DATE))->flights_new

    flights_new%>%
      filter(month==4,day<=7)%>%
    summarise(avg=mean(ARR_DELAY,na.rm=TRUE))
    
  
  
}

find_quarterly_costs<-function(){
  flights_new%>%
    mutate(quarter=quarter(FL_DATE))->flights_new
  flights_new%>%
    filter(ARR_DELAY>0)%>%
    group_by(quarter,OP_UNIQUE_CARRIER)%>%
    summarise(losses=sum(ARR_DELAY*74.24))%>%
    arrange(desc(losses))
  
}


which_day<-function(){
  
  flights_new%>%
    count(month,day)%>%
    arrange(n)
  
}

