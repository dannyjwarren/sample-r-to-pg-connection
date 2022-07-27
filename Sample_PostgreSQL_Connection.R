# Example to view entire contents of a PostgreSQL table
# Result comes though as 'query_result'

library(DBI)

# Input connection parameters
# These can be stored externally in a .Renviron file for enhanced security
database_args<-list(
  Driver = "PostgreSQL Unicode",
  Server = "XXXXXXXX",
  Database = "XXXXXXXX",
  Port = XXXXXXX,
  UID = "XXXXXXXX",
  PWD = "XXXXXXXX",
  Trusted_Connection = "True"
)

# Open a database connection
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

# Run a query using the DBI dbGetQuery function
# When referencing a PostgreSQL table in a query, the standard syntax is schema_name.table_name
query_result <- dbGetQuery(con, "SELECT * FROM creel.angler_type_lut;")

# Close connection
dbDisconnect(con)
