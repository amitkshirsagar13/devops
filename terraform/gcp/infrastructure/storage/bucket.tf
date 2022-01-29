# Create a GCS Bucket
resource "google_storage_bucket" "helm_repository" {
    name     = "${var.name}-${var.cluster}"
    location = var.region
}