variable "key_name" {}
variable "rsa_bits" {
  description = "(Number) When algorithm is RSA, the size of the generated RSA key, in bits (default: 2048)."
  type = number
  default = 2048
}
