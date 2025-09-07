variable "tools" {
  default = {

    vault = {
      port         = 8200
      volume_size   = 20
      instance_type = "t3.small"
    }
  }
}
variable "zone_id" {
  default = "Z05470293UTKVXA4543KK"
}
variable "domain_name" {
  default = "vishnuredddy.online"
}
