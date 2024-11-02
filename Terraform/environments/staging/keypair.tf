module "keypair" {
  source = "../../modules/keypair"
  rsa_bits = 4096

  key_name = "group3_key"
}