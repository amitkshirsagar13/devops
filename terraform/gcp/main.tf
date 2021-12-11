// Configure the Google Cloud provider
provider "google" {
 credentials = file("credentials.json")
 project     = "k8-cluster-200907"
 region      = "us-central1"
}

resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "default" {
 name         = "k8cluster-vm-${random_id.instance_id.hex}"
 machine_type = "e2-micro"
 zone         = "us-central1-a"
 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

 network_interface {
   network = "default"
   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}