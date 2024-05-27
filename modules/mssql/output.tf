output "mssql_server" {
  description = "A map of the MSSQL Servers with their names and other details"
  value = { 
    for server in azurerm_mssql_server.mssql_server : 
    server.name => {
      name     = server.name,
      id       = server.id
    }
  }
}

output "mssql_database" {
  description = "A map of the MSSQL Database with their names and other details"
  value = { 
    for db in azurerm_mssql_database.mssql_database : 
    db.name => {
      name     = db.name,
      id       = db.id
    }
  }
}
