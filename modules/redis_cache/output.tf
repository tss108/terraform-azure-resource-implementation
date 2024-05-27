output "resource_groups" {
  description = "A map of the Redis Cache's with their names and other details"
  value = {
    for rc in azurerm_redis_cache.redis_cache :
    rc.name => {
      name       = rc.name,
      id         = rc.id,
      port       = rc.port,
      hostname   = rc.hostname,
      access_key = rc.primary_access_key
    }
  }
}
