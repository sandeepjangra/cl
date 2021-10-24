install.packages('session')

#Load your libraries and your data, then save the session state to a file:
  
library(session)
save.session(file='instance.Rda')


#Then you can load the session state in another session:
  
library(session)
restore.session(file='instance.Rda')

