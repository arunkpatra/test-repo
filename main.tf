
provider "aws" {
  region = var.aws_region
}

resource "aws_sqs_queue" "request_queue" {
  name                        = "${var.project_name}-${var.environment}-${var.queue_name}.fifo"
  fifo_queue                 = true
  content_based_deduplication = true
  deduplication_scope        = "messageGroup"
  fifo_throughput_limit      = "perMessageGroupId"
  
  # Standard recommended settings for a FIFO queue
  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600  # 4 days
  max_message_size          = 262144   # 256 KiB
  delay_seconds             = 0
  receive_wait_time_seconds = 20       # Enable long polling
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
