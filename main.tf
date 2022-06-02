resource "google_storage_bucket" "GCS1"{
  name = "tf-course-from-terraform-cloud"
  location = "EU"
  storage_class = "NEARLINE"

  labels = {
    "env" = "tf_env"
    "dep" = "compliance"
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  retention_policy {
    retention_period = 864000
  }

}


resource "google_storage_bucket_object" "picture" {
  name = "terraform_workflow"
  bucket = google_storage_bucket.GCS1.name
  source = "Terraform-3000x1500.png"
}