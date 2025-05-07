variable "actionGroups" {
  type = map(object({
    actionGroupName          = string
    actionGroupShortName     = string
    actionGroupRGName        = string
    actionGroupEnabled       = string
    actionGroupEmailReceiver = list(map(string))
  }))
}

variable "location" {}
variable "alert-group-rg" {}

variable "tags" {}

