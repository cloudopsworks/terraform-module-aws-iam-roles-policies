##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "iam_roles" {
  description = "List of IAM roles created by the module, each with its name and ARN."
  value = [
    for role in aws_iam_role.this : {
      name = role.name
      arn  = role.arn
    }
  ]
}

output "iam_policies" {
  description = "List of customer managed IAM policies created by the module, each with its name and ARN."
  value = [
    for policy in aws_iam_policy.this : {
      name = policy.name
      arn  = policy.arn
    }
  ]
}

output "service_linked_roles" {
  description = "List of IAM service-linked roles created by the module, each with its name and ARN."
  value = [
    for role in aws_iam_service_linked_role.this : {
      name = role.name
      arn  = role.arn
    }
  ]
}
