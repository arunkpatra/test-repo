resource "aws_account_alternate_contact" "security" {
  account_id = "378240665051"
  name       = "Security Team"
  email_address = "security-team@example.com"
  phone_number  = "+1234567890"
  title         = "Security Lead"
  alternate_contact_type = "SECURITY"
}