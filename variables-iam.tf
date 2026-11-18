##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

## Role definition Structure YAML
# roles:                                       # (Optional) List of IAM roles to create. Default: []
#   - name_prefix: "sample-role"               # (Required) Unique role key and name prefix. Role name is rendered as "<name_prefix>-<system_name>".
#     description: "Role description"          # (Optional) Role description. Default: "IAM Role <name_prefix>-<system_name>"
#     path: "/"                                # (Optional) IAM path for the role. Default: "/" (AWS default)
#     instance_profile: false                  # (Optional) Create an EC2 instance profile with the same name as the role. Default: false
#     assume_roles:                            # (Optional) Trust policy statements. Default: one statement allowing sts:AssumeRole from Service ec2.amazonaws.com
#       - actions: ["sts:AssumeRole"]          # (Required) Trust actions. e.g. sts:AssumeRole, sts:AssumeRoleWithWebIdentity, sts:AssumeRoleWithSAML, sts:TagSession
#         type: "Service"                      # (Required) Principal type. Valid values: "Service", "AWS", "Federated", "CanonicalUser", "*"
#         principals: ["ec2.amazonaws.com"]    # (Required) Principal identifiers (service names, account/role ARNs, or federated provider ARNs).
#         conditions:                          # (Optional) Trust policy conditions. Default: []
#           - test: "StringEquals"             # (Required) Condition operator. e.g. StringEquals, StringLike, ArnLike, Bool.
#             variable: "aws:SourceAccount"    # (Required) Condition key evaluated by the operator.
#             values: ["123456789012"]         # (Required) Values compared against the condition key.
#     managed_policies:                        # (Optional) Existing managed policy ARNs to attach (AWS or customer managed). Each ARN is validated with a data lookup. Default: []
#       - "arn:aws:iam::aws:policy/ReadOnlyAccess"
#     policy_refs:                             # (Optional) Keys of policies created by this module (their name_prefix, or name) to attach. Default: []
#       - "sample-policy"
#     inline_policies:                         # (Optional) Inline policies embedded in the role. Default: []
#       - name: "inline-policy"                # (Required) Inline policy name; must be unique within the role.
#         statements:                          # (Required) Policy statements. Statements without resources or resource_refs are ignored.
#           - sid: "StatementId"               # (Optional) Statement ID. Default: null
#             effect: "Allow"                  # (Required) Statement effect. Valid values: "Allow", "Deny"
#             actions: ["s3:GetObject"]        # (Required) IAM actions.
#             resources: ["*"]                 # (Optional) Resource ARNs. Default: []
#             resource_refs: ["other-role"]    # (Optional) name_prefix keys of roles created by this module; their ARNs are used as resources. Default: []
#             conditions:                      # (Optional) Statement conditions. Default: []
#               - test: "StringEquals"         # (Required) Condition operator.
#                 variable: "aws:RequestedRegion" # (Required) Condition key.
#                 values: ["us-east-1"]        # (Required) Values compared against the condition key.
variable "roles" {
  description = "(Optional) List of IAM roles to create, with trust policy, managed/module policy attachments, inline policies and optional instance profile. Default: []"
  type        = any
  default     = []
}

## Policy definition Structure YAML
# policies:                                    # (Optional) List of customer managed IAM policies to create. Default: []
#   - name_prefix: "sample-policy"             # (Required unless name is set) Policy key and name prefix. Policy name is rendered as "<name_prefix>-<system_name>".
#     name: "sample-policy-fixed-name"         # (Required unless name_prefix is set) Exact policy name, used verbatim and as the policy key when name_prefix is empty or absent.
#     description: "Policy description"        # (Optional) Policy description. Default: "IAM Policy <rendered policy name>"
#     path: "/"                                # (Optional) IAM path for the policy. Default: "/" (AWS default)
#     statements:                              # (Required) Policy statements.
#       - sid: "StatementId"                   # (Optional) Statement ID. Default: null
#         effect: "Allow"                      # (Required) Statement effect. Valid values: "Allow", "Deny"
#         actions: ["s3:ListBucket"]           # (Required) IAM actions.
#         resources: ["arn:aws:s3:::bucket"]   # (Optional) Resource ARNs. Default: []
#         resource_refs: ["sample-role"]       # (Optional) name_prefix keys of roles created by this module; their ARNs are appended to resources. Default: []
#         conditions:                          # (Optional) Statement conditions. Default: []
#           - test: "StringEquals"             # (Required) Condition operator.
#             variable: "aws:PrincipalTag/team" # (Required) Condition key.
#             values: ["platform"]             # (Required) Values compared against the condition key.
variable "policies" {
  description = "(Optional) List of customer managed IAM policies to create, named by name_prefix (suffixed with the system name) or by exact name. Default: []"
  type        = any
  default     = []
}

## Service Linked Roles definition Structure YAML
# service_linked_roles:                        # (Optional) List of IAM service-linked roles to create. Default: []
#   - service: "elasticbeanstalk.amazonaws.com" # (Required) AWS service principal the role is linked to; must be unique in the list.
#     description: "Description"               # (Optional) Role description. Default: "Default Service Linked Role: <service>"
#     suffix: "suffix"                         # (Optional) Custom suffix appended to the role name. Only supported by some services. Default: null
variable "service_linked_roles" {
  description = "(Optional) List of IAM service-linked roles to create. Default: []"
  type        = any
  default     = []
}
