##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

## Role definition Structure YAML
# roles:
#   - name_prefix: string
#     description: string # (optional)
#     path: string # (optional)
#     assume_roles:
#       - actions: list(string)
#         type: string
#         principals: list(string)
#         principal_refs: list(string) # (optional)
#         conditions: # (optional)
#           - test: string
#             values: list(string)
#             variable: string
#     managed_policies: list(string)
#     policy_refs: list(string)
#     inline_policies:
#       - name: string
#         statements:
#           - sid: string
#             effect: string
#             actions: list(string)
#             resources: list(string)
#             resource_refs: list(string)
#             conditions:
#               - test: string
#                 values: list(string)
#                 variable: string
variable "roles" {
  description = "A list of IAM roles to create"
  type        = any
  default     = []
}


## Policy definition Structure YAML
#
# policies:
#   - name_prefix: string
#     description: string              # (optional)
#     statements:
#       - sid: string
#         effect: string
#         actions: list(string)
#         resources: list(string)
#         resource_refs: list(string) # (optional)
#         conditions:                 # (optional)
#           - test: string
#             values: list(string)
#             variable: string
variable "policies" {
  description = "A list of IAM policies to create"
  type        = any
  default     = []
}

## Service Linked Roles definition Structure YAML
#
# service_linked_roles:
#   - service: string
#     description: string # (optional)
#     suffix: string      # (optional)

variable "service_linked_roles" {
  description = "A list of service roles to create"
  type        = any
  default     = []
}