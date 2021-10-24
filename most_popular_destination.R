flights%>%
  count(DEST,sort=TRUE)%>%
  slice(1)->res
  print(res)