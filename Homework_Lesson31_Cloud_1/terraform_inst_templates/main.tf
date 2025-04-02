provider "google" {
  credentials = file("/home/makarov/modified-glyph-450412-k6-a498aa55c17d.json")
  project = "modified-glyph-450412-k6"
  region  = "us-central1"
}

resource "google_compute_instance_template" "default" {
  name         = "my-first-template-terraform"
  machine_type = "e2-micro"

  disk {
    auto_delete = true
    boot        = true
    source_image = "debian-cloud/debian-11"
  }

  network_interface {
    network = "default"
    access_config {
      
    }
  }
}

resource "google_compute_instance_group_manager" "default" {
  name               = "my-first-instance-group-terraform"
  version {
    instance_template = google_compute_instance_template.default.id
  }
  base_instance_name = "my-first-instance"
  target_size        = 1
  zone               = "us-central1-a"
}

resource "google_compute_autoscaler" "default" {
  name   = "default-autoscaler"
  zone   = "us-central1-a"
  target = google_compute_instance_group_manager.default.id
  autoscaling_policy {
    max_replicas = 3
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}