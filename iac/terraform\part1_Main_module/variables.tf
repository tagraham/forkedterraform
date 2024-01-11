variable "resourceGroupName" {
    type = string
    nullable = false
    default = "iac-training-rg-terraform"
}

variable "storageAccountName" {
    type = string
    nullable = false
    validation {
        condition = length(var.storageAccountName) > 3
        error_message = "The storage account name should be at least 3 characters"
    }
}



variable "uniqueIdentifier" {
    type = string
    nullable = false
    
}

locals {
  storageAccountNameFull = "${var.storageAccountName}${var.uniqueIdentifier}"
}
