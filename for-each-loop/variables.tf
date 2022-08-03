variable "password" {
    default = "encrypted-password"
}

variable "user-texts" {
    type = list(string)
    default = [ "text01", "test02", "test03", "test04", "test02" ]
  
}