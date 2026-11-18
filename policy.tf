##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Entry Format:
#
# name_prefix: string   # one of name_prefix or name is required
# name: string
# description: string
# path: string
# statements:
#   - sid: string
#     effect: string
#     actions: list(string)
#     resources: list(string)
#     resource_refs: list(string)
#     conditions:
#       - test: string
#         values: list(string)
#         variable: string
locals {
  # Policies are keyed by name_prefix when set, otherwise by name (used by roles[].policy_refs).
  policy_map = {
    for policy in var.policies :
    (try(policy.name_prefix, "") != "" ? policy.name_prefix : policy.name) => policy
  }
  # name_prefix renders "<name_prefix>-<system_name>"; name is used verbatim.
  policy_names = {
    for key, policy in local.policy_map :
    key => try(policy.name_prefix, "") != "" ? format("%s-%s", policy.name_prefix, local.system_name) : policy.name
  }
}

# The policy itself
resource "aws_iam_policy" "this" {
  for_each    = local.policy_map
  name        = local.policy_names[each.key]
  path        = try(each.value.path, null)
  description = try(each.value.description, "") != "" ? each.value.description : format("IAM Policy %s", local.policy_names[each.key])
  tags        = local.all_tags
  policy      = data.aws_iam_policy_document.policy[each.key].json
}

# Inline policies
data "aws_iam_policy_document" "policy" {
  for_each = local.policy_map
  version  = "2012-10-17"
  dynamic "statement" {
    for_each = each.value.statements
    content {
      sid     = try(statement.value.sid, null)
      effect  = statement.value.effect
      actions = statement.value.actions
      resources = concat(try(statement.value.resources, []), [
        for item in try(statement.value.resource_refs, []) :
        aws_iam_role.this[item].arn
      ])
      dynamic "condition" {
        for_each = try(statement.value.conditions, [])
        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}
