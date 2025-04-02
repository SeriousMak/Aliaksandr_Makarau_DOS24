provider "google" {
  credentials = file("/home/makarov/modified-glyph-450412-k6-a498aa55c17d.json")  
  project = "modified-glyph-450412-k6"
  region  = "US"
}

resource "google_storage_bucket" "default" {
  name          = "my-first-bucket-gcp-terraform"
  location      = "US"
  storage_class = "STANDARD"
}