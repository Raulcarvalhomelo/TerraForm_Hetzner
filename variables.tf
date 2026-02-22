variable "HCLOUD_TOKEN" {
  type = string
  description = "Hetzner Cloud API token"
  sensitive = true 
}
variable "SERVER_NAME" {
  type = string
  description = "Server name"
}
variable "SERVER_TYPE" {
  type = string
  description = "Server type"
}