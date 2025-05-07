#------------
# WAF Policy
#------------

variable "name" {
  type        = string
  default     = null
  description = "(Required) The name of the policy. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "(Required) The name of the resource group. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  default     = null
  description = "(Required) Resource location. Changing this forces a new resource to be created."
}

variable "custom_rules" {
  description = "(Optional) One or more custom_rules blocks as defined below."
  type = list(object({
    name               = string       // (Optional) Gets name of the resource that is unique within a policy. This name can be used to access the resource.
    priority           = string       // (Required) Describes priority of the rule. Rules with a lower value will be evaluated before rules with a higher value.  
    rule_type          = string       // (Required) Describes the type of rule. Possible values are MatchRule, RateLimitRule and Invalid
    variable_name      = string       // (Required) The name of the Match Variable. Possible values are RemoteAddr, RequestMethod, QueryString, PostArgs, RequestUri, RequestHeaders, RequestBody and RequestCookies.
    operator           = string       // (Required) Describes operator to be matched. Possible values are Any, IPMatch, GeoMatch, Equal, Contains, LessThan, GreaterThan, LessThanOrEqual, GreaterThanOrEqual, BeginsWith, EndsWith and Regex.
    negation_condition = string       // (Optional) Describes if this is negate condition or not
    match_values       = list(string) // (Optional) A list of match values. This is Required when the operator is not Any.
  }))
  default = []
}

variable "policy_settings" {
  description = " (Optional) A policy_settings block as defined below."
  type = object({
    enabled                     = bool             // (Optional) Describes if the policy is in enabled state or disabled state. Defaults to true.
    mode                        = string           // (Optional) Describes if it is in detection mode or prevention mode at the policy level. Valid values are Detection and Prevention. Defaults to Prevention.
    request_body_check          = bool             // (Optional) Is Request Body Inspection enabled? Defaults to true.
    file_upload_limit_in_mb     = optional(number) // (Optional) The File Upload Limit in MB. Accepted values are in the range 1 to 4000. Defaults to 100.
    max_request_body_size_in_kb = optional(number) // (Optional) The Maximum Request Body Size in KB. Accepted values are in the range 8 to 2000. Defaults to 128.
  })
  default = {
    enabled            = true
    mode               = "Detection"
    request_body_check = false
  }
}

variable "waf_policy_exclusion" {
  description = "(Optional) One or more exclusion block defined below."
  type = list(object({
    match_variable          = string //  (Required) The name of the Match Variable. Possible values: RequestArgKeys, RequestArgNames, RequestArgValues, RequestCookieKeys, RequestCookieNames, RequestCookieValues, RequestHeaderKeys, RequestHeaderNames, RequestHeaderValues.
    selector                = string // (Required) Describes field of the matchVariable collection.
    selector_match_operator = string // (Required) Describes field of the matchVariable collection.
  }))
  default = []
}

variable "managed_rule_set" {
  description = "(Required) A managed_rules_set blocks as defined below."
  type = list(object({
    type    = string // (Optional) The rule set type. Possible values: Microsoft_BotManagerRuleSet, Microsoft_DefaultRuleSet and OWASP. Defaults to OWASP.
    version = string // (Required) The rule set version. Possible values: 0.1, 1.0, 2.1, 2.2.9, 3.0, 3.1 and 3.2.
    rule_group_override = optional(list(object({
      rule_group_override_name = optional(string) // (Required) The name of the Rule Group. 
      rule = list(object({
        id      = string // (Required) Identifier for the managed rule.
        enabled = bool   // (Optional) Describes if the managed rule is in enabled state or disabled state.
        action  = string // (Optional) Describes the override action to be applied when rule matches. Possible values are Allow, AnomalyScoring, Block, JSChallenge and Log. JSChallenge is only valid for rulesets of type Microsoft_BotManagerRuleSet.
      }))
    })))
  }))
  default = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the Web Application Firewall Policy."
  type        = any
  default     = null
}
