#################################################
#                 customize IAM                 #
#################################################
resource "aws_iam_role" "customEcsRole" {
  path                 = "/"
  name                 = var.roleAdm
  assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs-tasks.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  max_session_duration = 3600
  tags                 = {}
}
resource "aws_iam_policy_attachment" "ecrToEcsRole" {
  name       = "ecrToEcs"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
  roles      = [aws_iam_role.customEcsRole.name]

}
resource "aws_iam_policy_attachment" "ecsTaskToEcsRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  roles      = [aws_iam_role.customEcsRole.name]
  name       = "ecsTaskToEcs"
}
resource "aws_iam_policy_attachment" "rdstoEcsRole" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  roles      = [aws_iam_role.customEcsRole.name]
  name       = "rdsToEcs"
}
resource "aws_iam_policy_attachment" "secretToEcsRole" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  roles      = [aws_iam_role.customEcsRole.name]
  name       = "secretToEcs"
}
resource "aws_iam_policy_attachment" "dbToEcsRole" {
  policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
  roles      = [aws_iam_role.customEcsRole.name]
  name       = "dbToEcs"
}