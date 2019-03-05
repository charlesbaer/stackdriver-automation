provider "google" {
  project = "abab-cdcd-023991"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_monitoring_notification_channel" "email0" {
  display_name = "Website Oncall"
  type = "email"
  labels = {
    email_address = "website-oncall-a@example.com"
  }
}

resource "google_monitoring_notification_channel" "email1" {
  display_name = "Website Support"
  type = "email"
  labels = {
    email_address = "support-website-a@example.com"
  }
}

output "email0_id" {
  value = "${google_monitoring_notification_channel.email0.name}"
}

output "email1_id" {
  value = "${google_monitoring_notification_channel.email1.name}"
}