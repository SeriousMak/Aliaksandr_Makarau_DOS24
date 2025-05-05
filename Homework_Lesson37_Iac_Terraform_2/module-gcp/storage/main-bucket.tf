variable "bucket_name" {
  description = "Имя бакета"
  type        = string
}

variable "location" {
  description = "Местоположение бакета"
  type        = string
  default     = "US"
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  storage_class = "STANDARD"
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}