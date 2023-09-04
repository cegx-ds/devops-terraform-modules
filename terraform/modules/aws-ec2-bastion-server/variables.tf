variable "ami" {
  type        = string
  description = "AMI to use for the instance. Setting this will ignore `ami_filter` and `ami_owners`."
  default     = null
}

variable "ami_owners" {
  description = "The list of owners used to select the AMI of action runner instances."
  type        = list(string)
  default     = ["amazon"]
}

variable "ami_filter" {
  description = "List of maps used to create the AMI filter for the action runner AMI."
  type        = map(list(string))

  default = {
    name = ["amzn2-ami-hvm-2.*-x86_64-ebs"]
  }
}

variable "tags" {
  description = "map of tags to apply to all resources"
  type        = map(any)
  default     = {}
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Bastion instance type"
}

variable "instance_profile" {
  type        = string
  description = "A pre-defined profile to attach to the instance (default is to build our own)"
  default     = ""
}

variable "user_data_base64" {
  type        = string
  description = "The Base64-encoded user data to provide when launching the instances. If this is set then `user_data` will not be used."
  default     = ""
}

variable "security_groups" {
  type        = list(string)
  description = "A list of Security Group IDs to associate with bastion host."
  default     = []
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Whether to associate a public IP to the instance."
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Key name"
}

variable "subnet_id" {
  type        = string
  description = "id for subnet to launch instance on"
}

variable "monitoring" {
  type        = bool
  description = "Launched EC2 instance will have detailed monitoring enabled"
  default     = true
}

variable "disable_api_termination" {
  type        = bool
  description = "Enable EC2 Instance Termination Protection"
  default     = false
}

variable "metadata_http_endpoint_enabled" {
  type        = bool
  default     = true
  description = "Whether the metadata service is available"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  default     = 1
  description = "The desired HTTP PUT response hop limit (between 1 and 64) for instance metadata requests."
}

variable "metadata_http_tokens_required" {
  type        = bool
  default     = true
  description = "Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2."
}

variable "root_block_device_encrypted" {
  type        = bool
  default     = true
  description = "Whether to encrypt the root block device"
}

variable "root_block_device_volume_size" {
  type        = number
  default     = 8
  description = "The volume size (in GiB) to provision for the root block device. It cannot be smaller than the AMI it refers to."
}

variable "ebs_block_device_encrypted" {
  type        = bool
  default     = true
  description = "Whether to encrypt the EBS block device"
}

variable "ebs_block_device_volume_size" {
  type        = number
  default     = 0
  description = "The volume size (in GiB) to provision for the EBS block device. Creation skipped if size is 0"
}

variable "ebs_delete_on_termination" {
  type        = bool
  default     = true
  description = "Whether the EBS volume should be destroyed on instance termination"
}

variable "ebs_device_name" {
  type        = string
  default     = "/dev/sdh"
  description = "The name of the EBS block device to mount on the instance"
}
