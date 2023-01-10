     #@___VARIABLES___@#


      #ACCOUNT_CREDENTIALS#
variable "vivek_AK" {
  default =  "AKIA5Y5HITJGKUX4BM65"
}

variable "vivek_SK" {
  default = "FkyuSxN68MaaSeNd4+3aaKle+DWFo4ylmFmbyPA0"
}

   #IMAGE#

#ubuntu
variable "ami1" {
  default = "ami-0f69bc5520884278e"
}
#amazon Linux
variable "ami2" {
  default = "ami-0cca134ec43cf708f"
}
#Redhat Linux
variable "ami3" {
  default = "ami-0f9d9a251c1a44858"
}


   #INSTANCE_TYPE#

variable "typ1" {
  default = "t2.micro"
}
variable "typ2" {
  default = "t2.small"
}


   #AVAILABILITY_ZONES#

variable "AZ1" {
  default = "ap-south-1a"
}
variable "AZ2" {
  default = "ap-south-1b"
}
variable "AZ3" {
  default = "ap-south-1c"
}


    #KEY#

variable "key1" {
  default =  "tfkey"
}

   #INSTANCE_TAGS#

variable "inst1" {
  default =  "dev"
}
variable "inst2" {
  default =  "prod"
}
variable "inst3" {
  default =  "test"
}

