# Example to view entire contents of a table
# Result comes though as 'query_result'

library(DBI)

database_args<-list(
  Driver = "PostgreSQL Unicode",
  Server = "XXXXXXXX",
  Database = "XXXXXXXX",
  Port = 5433,
  UID = "XXXXXXXX",
  PWD = "XXXXXXXX",
  Trusted_Connection = "True"
)

con <- DBI::dbConnect(
  odbc::odbc(),
  Driver = database_args$Driver,
  Server = database_args$Server,
  Database = database_args$Database,
  Port = database_args$Port,
  UID = database_args$UID,
  PWD = database_args$PWD,
  Trusted_Connection = database_args$Trusted_Connection
)


query_result <- dbGetQuery(con, "SELECT * FROM creel.angler_type_lut;")

dbDisconnect(con)
