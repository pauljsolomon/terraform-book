
output "elb_dns_name" {
  value = "${aws_elb.example.dns_name}"
}

#output "autoscaling_group_nodes" {
#  description = "The load balancer names associated with the autoscaling group"
#  value       = "${aws_autoscaling_group.example.load_balancers}"
#}
