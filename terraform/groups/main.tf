provider "google" {
  project = "abab-cdcd-023991"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_monitoring_group" "apache_parent" {
  display_name = "Apache"
  filter = "metadata.user_labels.app=has_substring(\"website\")"
}

resource "google_monitoring_group" "apache_prod_subgroup" {
  display_name = "prod"
  filter = "metadata.user_labels.env=\"prod\""
  parent_name =  "${google_monitoring_group.apache_parent.name}"
}

resource "google_monitoring_group" "apache_qa_subgroup" {
  display_name = "qa"
  filter = "metadata.user_labels.env=\"qa\""
  parent_name =  "${google_monitoring_group.apache_parent.name}"
}