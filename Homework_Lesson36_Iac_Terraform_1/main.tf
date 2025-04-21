provider "google" {
  credentials = file("/home/makarov/modified-glyph-450412-k6-a498aa55c17d.json")
  project = var.project_id
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "e2-small" 
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts" 
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}  

variable "project_id" {
  description = "ID проекта GCP"
}

variable "vm_name" {
  description = "Имя виртуальной машины"
}
