output "keyvault" {
  description = "A map of the Keyvault's with their names and other details"
  value = { 
    for key in azurerm_key_vault.keyvault : 
    key.name => {
      name     = key.name,
      id       = key.id
    }
  }
}

output "secret" {
  description = "A map of the Secret's with their names and other details"
  value = { 
    for secret in azurerm_key_vault_secret.secret : 
    secret.name => {
      name     = secret.name,
      id       = secret.id
      value    = secret.value
    }
  }
}
