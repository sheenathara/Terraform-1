variable "instance_name" {
  description = "VM instance name"
  default     = "my-vm-instance"
}

provider "google" {
  project = "iactest-380109"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

