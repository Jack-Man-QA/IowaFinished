#=============================================================(INSTALL PACKAGES)======================================================#|
#Installing packages, commented out once installed                                                                                    #|
                                                                                                                                      #|
#install.packages("RMySQL")                                                                                                           #|
                                                                                                                                      #|
#=============================================================(ADDING IN LIBRARY)=====================================================#|
#Adding in RMySQL for the database                                                                                                    #|
                                                                                                                                      #|
library("RMySQL")                                                                                                                     #|
                                                                                                                                      #|
#========================================================(MAKING THE CONNECTION TO SQL)===============================================#|
#Making the connection to a value called "con"                                                                                        #|
                                                                                                                                      #|
con <- dbConnect(MySQL(),                                                                                                             #|
             user="root", password="pass",                                                                                            #|
             dbname="r", host="127.0.0.1")                                                                                            #|
                                                                                                                                      #|
#Sending query to SQL and fetching the database into R with all columns: Clearing and disconnecting the database afterwards           #|
                                                                                                                                      #|
rsl <-dbSendQuery(con, "SELECT * FROM r.backup;")                                                                                     #|
database <- fetch(rsl, n = -1)                                                                                                        #|
dbClearResult(rsl)                                                                                                                    #|
dbDisconnect(con)                                                                                                                     #|
                                                                                                                                      #|
#========================================================(DBCONNECTIONKILL FUNCTION)==================================================#|
#'@killDbConnections Creating a function that kills all connections incase the connection stays open                                  #|
#'@all_cons adding the dbListConnections to a variable                                                                                #|
#'@for Creating a for loop so for each cons open then disconnect it                                                                   #| 
                                                                                                                                      #|
killDbConnections <- function () {                                                                                                    #|
  all_cons <- dbListConnections(MySQL())                                                                                              #|
  print(all_cons)                                                                                                                     #|
                                                                                                                                      #|
  for(con in all_cons)                                                                                                                #|
    +  dbDisconnect(con)                                                                                                              #|
                                                                                                                                      #|
  print(paste(length(all_cons), " connections killed."))                                                                              #|
                                                                                                                                      #|
}                                                                                                                                     #|
                                                                                                                                      #|
?killDbConnections
#=====================================================================================================================================#|