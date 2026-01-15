##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "iam_roles" {
  value = [
    for role in aws_iam_role.this : {
      name = role.name
      arn  = role.arn
    }
  ]
}

output "iam_policies" {
  value = [
    for role in aws_iam_policy.this : {
      name = role.name
      arn  = role.arn
    }
  ]
}

output "service_linked_roles" {
  value = [
    for role in aws_iam_service_linked_role.this : {
      name = role.name
      arn  = role.arn
    }
  ]
}