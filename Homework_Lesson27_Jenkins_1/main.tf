terraform {
    required_version = "1.11.1"
  required_providers {
    google = {
        source = "hashicorp/terraform-provider-google"
        version = "~>6.24.0"
  }
  
}

provider "google" {
  project = "modified-glyph-450412-k6" 
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "jenkins-server-test"
  machine_type = "e2-small" 
  zone         = "us-central1-c"

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

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugi
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo mkdir /u01/jenkins
    sudo cd /u01/jenkins/
    sudo git clone https://github.com/deng4/jenkins.git
    sudo docker compose up -d
  EOF
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}