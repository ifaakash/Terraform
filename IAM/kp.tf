/*
algorithm : Currently-supported values are: RSA, ECDSA, ED25519.
*/

# Generate a private key for the Instance
resource "tls_private_key" "tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = var.kp_name
  public_key = tls_private_key.tls.private_key_openssh
}

resource "aws_ssm_parameter" "kp_ssm" {
  name  = var.kp_ssm_parameter_name
  type  = "SecureString"
  value = tls_private_key.tls.private_key_pem
}
