resource "google_compute_instance" "cloudstudy_vm" {
  name                      = "cloud-study-tf-vm"
  machine_type              = var.vm_params[0]
  zone                      = var.vm_params[1]
  allow_stopping_for_update = var.vm_params[2]

  boot_disk {
    initialize_params {
    #   image = "debian-cloud/debian-11"
    # image = "cos-cloud/cos-stable"
    image = var.os_image
    }
  }
  network_interface {
    network = google_compute_network.terraform_network.self_link
    subnetwork = google_compute_subnetwork.terraform_subnet.self_link
    access_config {
      //necessary even empty
    }
  }
}