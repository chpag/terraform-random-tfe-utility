# General
# -------
variable "fqdn" {
  default     = null
  type        = string
  description = "The fully qualified domain name for the TFE environment"
}

variable "active_active" {
  default     = false
  type        = bool
  description = "True if TFE running in active-active configuration"
}

# Database
# --------
# If you have chosen external for production_type, the following settings apply:
variable "pg_user" {
  default     = null
  type        = string
  description = "PostgreSQL user to connect as."
}

variable "pg_password" {
  default     = null
  type        = string
  description = "The password for the PostgreSQL user."
}

variable "pg_netloc" {
  default     = null
  type        = string
  description = "The hostname and port of the target PostgreSQL server, in the format hostname:port."
}

variable "pg_dbname" {
  default     = null
  type        = string
  description = "The database name"
}

variable "pg_extra_params" {
  default     = null
  type        = string
  description = <<-EOF
  Parameter keywords of the form param1=value1&param2=value2 to support additional options that
  may be necessary for your specific PostgreSQL server. Allowed values are documented on the
  PostgreSQL site. An additional restriction on the sslmode parameter is that only the require,
  verify-full, verify-ca, and disable values are allowed.
  EOF
}

# Redis
# -----
variable "redis_host" {
  default     = null
  type        = string
  description = "The Hostname of the Redis Instance"
}

variable "redis_pass" {
  default     = null
  type        = string
  description = "The Primary Access Key for the Redis Instance. Must be set to the password of an external Redis instance if the instance requires password authentication."
}

variable "redis_enable_non_ssl_port" {
  default     = null
  type        = bool
  description = "If true, the external Redis instance will use port 6379, otherwise 6380"
}

variable "redis_use_password_auth" {
  default     = null
  type        = bool
  description = "Redis service requires a password."
}

variable "redis_use_tls" {
  default     = null
  type        = bool
  description = "Redis service requires TLS"
}

# Azure
# -----
variable "azure_container_name" {
  default     = null
  type        = string
  description = "Azure storage container name"
}

variable "azure_account_key" {
  default     = null
  type        = string
  description = "Azure storage account key"
}

variable "azure_account_name" {
  default     = null
  type        = string
  description = "Azure storage account name"
}

# TFE
# ---
variable "release_sequence" {
  default     = null
  type        = string
  description = "Terraform Enterprise version release sequence"
}

variable "certificate_secret" {
  default = null
  type = object({
    id = string
  })

  description = <<-EOD
  A Key Vault secret which contains the Base64 encoded version of a PEM encoded public certificate for the Virtual
  Machine Scale Set.
  EOD
}

variable "iact_subnet_list" {
  default     = []
  type        = list(string)
  description = <<-EOD
  A list of IP address ranges which will be authorized to access the IACT. The ranges must be expressed
  in CIDR notation.
  EOD
}

variable "installation_type" {
  type        = string
  description = "Installation type for Terraform Enterprise"

  validation {
    condition = (
      var.installation_type == "poc" ||
      var.installation_type == "production"
    )

    error_message = "The installation type must be 'production' (recommended) or 'poc' (only used for demo-mode)."
  }
}

variable "trusted_proxies" {
  default     = []
  description = <<-EOD
  A list of IP address ranges which will be considered safe to ignore when evaluating the IP addresses of requests like
  those made to the IACT endpoint.
  EOD
  type        = list(string)
}

variable "tfe_license_file_location" {
  default     = null
  type        = string
  description = "The path on the TFE instance to put the TFE license."
}

variable "tls_bootstrap_cert_pathname" {
  default     = null
  type        = string
  description = "The path on the TFE instance to put the certificate."
}

variable "tls_bootstrap_key_pathname" {
  default     = null
  type        = string
  description = "The path on the TFE instance to put the key."
}

variable "bypass_preflight_checks" {
  default = false
  type = bool
  description = "Allow the TFE application to start without preflight checks." 
}