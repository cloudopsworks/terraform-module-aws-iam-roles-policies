##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

## Role definition Structure YAML
# roles:
#   - name_prefix: "sample-role"      # (Required) The prefix for the role name.
#     description: "Role description"  # (Optional) The description of the role. Default: "IAM Role <name_prefix>-<system_name>"
#     path: "/"                        # (Optional) The path for the role. Default: "/"
#     instance_profile: false          # (Optional) Whether to create an instance profile for the role. Default: false
#     assume_roles:                    # (Optional) The trust policy for the role.
#       - actions: ["sts:AssumeRole"]  # (Required) Actions for the trust policy.
#         type: "Service"              # (Required) Type of principal (e.g., Service, AWS, Federated).
#         principals: ["ec2.amazonaws.com"] # (Required) List of principals that can assume the role.
#         conditions:                  # (Optional) Conditions for the trust policy.
#           - test: "StringEquals"     # (Required) The condition test.
#             values: ["value"]        # (Required) The condition values.
#             variable: "variable"     # (Required) The condition variable.
#     managed_policies: ["arn:aws:iam::aws:policy/ReadOnlyAccess"] # (Optional) List of managed policy ARNs to attach.
#     policy_refs: ["policy-key"]      # (Optional) List of keys of policies created by this module to attach.
#     inline_policies:                 # (Optional) List of inline policies to create.
#       - name: "inline-policy"        # (Required) The name of the inline policy.
#         statements:                  # (Required) List of statements for the inline policy.
#           - sid: "StatementId"       # (Optional) The statement ID.
#             effect: "Allow"          # (Required) The effect of the statement (Allow or Deny).
#             actions: ["s3:Get*"]     # (Required) List of actions.
#             resources: ["*"]         # (Optional) List of resources.
#             resource_refs: ["role-key"] # (Optional) List of keys of roles created by this module to use as resource ARNs.
#             conditions:              # (Optional) Conditions for the statement.
#               - test: "StringEquals" # (Required) The condition test.
#                 values: ["value"]    # (Required) The condition values.
#                 variable: "variable" # (Required) The condition variable.
variable "roles" {
  description = "A list of IAM roles to create"
  type        = any
  default     = []
}


## Policy definition Structure YAML
#
# policies:
#   - name_prefix: "sample-policy"     # (Required) The prefix for the policy name.
#     description: "Policy description" # (Optional) The description of the policy. Default: "IAM Policy <name_prefix>-<system_name>"
#     path: "/"                        # (Optional) The path for the policy. Default: "/"
#     statements:                      # (Required) List of statements for the policy.
#       - sid: "StatementId"           # (Optional) The statement ID.
#         effect: "Allow"              # (Required) The effect of the statement (Allow or Deny).
#         actions: ["s3:ListBucket"]   # (Required) List of actions.
#         resources: ["arn:aws:s3:::bucket"] # (Optional) List of resources.
#         resource_refs: ["role-key"]  # (Optional) List of keys of roles created by this module to use as resource ARNs.
#         conditions:                  # (Optional) Conditions for the statement.
#           - test: "StringEquals"     # (Required) The condition test.
#             values: ["value"]        # (Required) The condition values.
#             variable: "variable"     # (Required) The condition variable.
variable "policies" {
  description = "A list of IAM policies to create"
  type        = any
  default     = []
}

## Service Linked Roles definition Structure YAML
#
# service_linked_roles:
#   - service: "service.amazonaws.com" # (Required) The AWS service name.
#     description: "Description"       # (Optional) The description of the role.
#     suffix: "suffix"                 # (Optional) A custom suffix for the role name.
variable "service_linked_roles" {
  description = "A list of service roles to create"
  type        = any
  default     = []
}