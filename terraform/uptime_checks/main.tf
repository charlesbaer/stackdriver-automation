provider "google" {
  project = "abab-cdcd-023991"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_monitoring_uptime_check_config" "http" {
  display_name = "01 - Website uptime check [global]"
  timeout = "10s"
  period = "60s"

  http_check {
    path = "/"
    port = "80"
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = "35.241.47.194"
    }
  }
}