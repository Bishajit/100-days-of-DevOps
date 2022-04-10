resource "aws_cloudwatch_metric_alarm" "aws-cw-metric-alarm" {
  alarm_name                = "aws_cloudwatch_metric_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.alarm.arn}" ]


dimensions {
    InstanceId = "${aws_instance.ec2-100day-day1.id}"
      }
}