# resource "aws_lb" "test" {
#   name               = "itay-lb"
#   internal           = false
#   load_balancer_type = "network"
#   security_groups    = [aws_security_group.itay-zrihan-sg-ec2-instance.id]
#   subnets            = [aws_subnet.public-us-east-1a.id,aws_subnet.public-us-east-1b.id]

#   enable_deletion_protection = true

#   tags = {
#     Environment = "test"
#   }
# }

# resource "aws_lb_target_group" "test" {
#   name     = "itay-lb-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.itay-zrihan-vpc.id
# }

# resource "aws_lb_listener" "lb_listener_http" {
#   load_balancer_arn = aws_lb.test.arn
#   protocol          = "HTTP"
#   port              = "80"
#   default_action {
#     target_group_arn = aws_lb_target_group.test.arn
#     type             = "forward"
#   }
# }

# resource "aws_lb_target_group_attachment" "itay-attach-groups" {
#   count = "1"
#   target_group_arn = aws_lb_target_group.test.arn
#   target_id = aws_instance.ec2.id
#   port = 80
# }