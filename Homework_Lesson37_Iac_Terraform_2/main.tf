#terraform {
#    required_version = "1.11.1"
#  required_providers {
#    google = {
#        source = "hashicorp/google"
#        version = "~>6.24.0"
#  }
# } 
#}

provider "google" {
  credentials = file("/home/makarov/modified-glyph-450412-k6-a498aa55c17d.json")
  project = var.project_id
  region  = var.region
}

module "storage" {
  source      = "./module-gcp/storage"
  bucket_name = var.bucket_name
}

variable "project_id" {
  description = "ID проекта GCP"
}

variable "region" {
  description = "Регион для развертывания ресурсов"
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Имя бакета"
  default     = "my-unique-bucket-name"
}

output "storage_bucket_name" {
  value = module.storage.bucket_name
}

resource "google_storage_bucket_object" "file" {
  name   = "Hello_world_DOS24.txt"
  bucket = module.storage.bucket_name
  content_type = "text/plain"
  source = "/home/makarov/my-test-project/Hello_world_DOS24.txt"
}  
