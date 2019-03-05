provider "google" {
  project = "abab-cdcd-023991"
  region  = "us-central1"
  zone    = "us-central1-c"
}

locals {
  email0_id = "projects/abab-cdcd-023991/notificationChannels/11497409249297891355",
  email1_id = "projects/abab-cdcd-023991/notificationChannels/12532464389112270325"
}

resource "google_monitoring_alert_policy" "alert_policy0" {
  display_name = "1 - Availability - Google Cloud HTTP/S Load Balancing Rule - Request count (filtered) [COUNT]"
  combiner = "OR"
  conditions {
    display_name = "Google Cloud HTTP/S Load Balancing Rule - Request count (filtered) [COUNT]"
    condition_threshold {
      filter = "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\" metric.label.response_code!=\"200\"" 
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 1
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_COUNT"
      }
    }
  }
  documentation {
    content = "The load balancer rule $${condition.display_name} has generated this alert for the $${metric.display_name}."
  }
  notification_channels = [
      "${local.email0_id}",
      "${local.email1_id}",
  ]

}

resource "google_monitoring_alert_policy" "alert_policy1" {
  display_name = "2 - Latency - Google Cloud HTTP/S Load Balancing Rule - Total Latency (filtered) [99 percentile]"
  combiner = "OR"
  conditions {
    display_name = "Google Cloud HTTP/S Load Balancing Rule - Total Latency (filtered) [99 percentile]"
    condition_threshold {
      filter = "metric.type=\"loadbalancing.googleapis.com/https/total_latencies\" resource.type=\"https_lb_rule\" resource.label.url_map_name=\"web-map\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 100
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
    }
  }
  documentation {
    content = "The load balancer rule $${condition.display_name} has generated this alert for the $${metric.display_name}."
  }
  notification_channels = [
      "${local.email0_id}",
      "${local.email1_id}",
  ]
}

resource "google_monitoring_alert_policy" "alert_policy2" {
  display_name = "3 - Latency - Google Cloud HTTP/S Load Balancing Rule - Frontend Latency (filtered) [99 percentile]"
  combiner = "OR"
  conditions {
    display_name = "Google Cloud HTTP/S Load Balancing Rule - Frontend Latency (filtered) [99 percentile]"
    condition_threshold {
      filter =  "metric.type=\"loadbalancing.googleapis.com/https/frontend_tcp_rtt\" resource.type=\"https_lb_rule\" resource.label.url_map_name=\"web-map\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 50
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
    }
  }
  documentation {
    content = "The load balancer rule $${condition.display_name} has generated this alert for the $${metric.display_name}."
  }
  notification_channels = [
      "${local.email0_id}",
      "${local.email1_id}",
  ]
}

resource "google_monitoring_alert_policy" "alert_policy3" {
  display_name = "4 - Latency - Google Cloud HTTP/S Load Balancing Rule - Backend Latency (filtered) [99 percentile]"
  combiner = "OR"
  conditions {
    display_name = "Google Cloud HTTP/S Load Balancing Rule - Frontend Latency (filtered) [99 percentile]"
    condition_threshold {
      filter =  "metric.type=\"loadbalancing.googleapis.com/https/backend_latencies\" resource.type=\"https_lb_rule\" resource.label.url_map_name=\"web-map\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 50
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
    }
  }
  documentation {
    content = "The load balancer rule $${condition.display_name} has generated this alert for the $${metric.display_name}."
  }
  notification_channels = [
      "${local.email0_id}",
      "${local.email1_id}",  ]
}

resource "google_monitoring_alert_policy" "alert_policy4" {
  display_name =  "5 - Volume - Google Cloud HTTP/S Load Balancing Rule - Request count (filtered) [COUNT]"
  combiner = "OR"
  conditions {
    display_name = "Google Cloud HTTP/S Load Balancing Rule - Request Count(filtered) [COUNT]"
    condition_threshold {
      filter =  "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\" resource.label.url_map_name=\"web-map\"" 
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 100
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
  documentation {
    content = "The load balancer rule $${condition.display_name} has generated this alert for the $${metric.display_name}."
  }
  notification_channels = [
      "${local.email0_id}",
      "${local.email1_id}",  
  ]
}