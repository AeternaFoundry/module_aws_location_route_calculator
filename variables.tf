variable "location_route_calculators" {
  description = <<EOT
Map of location_route_calculators, attributes below
Required:
    - calculator_name
    - data_source
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    calculator_name = string
    data_source     = string
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.location_route_calculators : (
        length(v.calculator_name) >= 1 && length(v.calculator_name) <= 100
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

