resource "hcloud_server" "server" {
  name = var.SERVER_NAME
  location = "hel1"
  image = "ubuntu-22.04"
  server_type = var.SERVER_TYPE
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
