module "rds_db_instance" {
  source  = "terraform-aws-modules/rds/aws//modules/db_instance"
  version = "7.2.0"

  # insert the 1 required variable here
}