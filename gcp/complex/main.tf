provider "google" {
  project = "iactest-380109"
  region  = "us-central1"
}

//Create an instance:

resource "google_compute_instance" "iac_test_instance" {
  name         = "iac_test_instance"
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
//Create a Cloud Storage bucket:

resource "google_storage_bucket" "iac_test_bucket" {
  name     = "iac_test_bucket"
  location = "US"

  versioning {
    enabled = true
  }
}
//Create a Kubernetes cluster:

resource "google_container_cluster" "iac_test_cluster" {
  name     = "iac-test-cluster"
  location = "us-central1-a"

  initial_node_count = 1

  node_config {
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
