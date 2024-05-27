output "storage_account" {
  description = "A map of the storage account's with their names and other details"
  value = {
    for sa in azurerm_storage_account.storage_account :
    sa.name => {
      name               = sa.name,
      id                 = sa.id,
      primary_access_key = sa.primary_access_key
    }
  }
}
output "storage_container" {
  description = "A map of the storage container with their names and other details"
  value = {
    for sc in azurerm_storage_container.storage_container :
    sc.name => {
      name = sc.name,
      id   = sc.id,
    }
  }
}

