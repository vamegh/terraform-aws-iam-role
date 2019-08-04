output "role_arn" {
  value = join("", aws_iam_role.role.*.arn)
}

output "id" {
  value = join("", aws_iam_role.role.*.id)
}

output "instance_profile_id" {
  value = join("", aws_iam_instance_profile.instance-profile.*.id)
}
