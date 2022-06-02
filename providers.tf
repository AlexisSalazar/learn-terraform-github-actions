terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.22.0"
    }
  }
  required_version = "~> 1.0"

  backend "remote" {
    organization = "terraform-personal-study"

    workspaces {
      name = "demo-github-actions" 
    }
  }
}


provider "google" {
  # Configuration options
  project = "terraform-gcp-351615"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "key.json"
}