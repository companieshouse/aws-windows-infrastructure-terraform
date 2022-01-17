# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR ALB Security Group and rules
# ------------------------------------------------------------------------------
module "abbyy_doc_ocr_internal_alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-abbyy-doc-ocr-internal-alb-001"
  description = "Security group for ${var.application} ABBYY Document Capture & OCR Internal ALB"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_cidr_blocks = local.admin_cidrs
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]

  egress_rules = ["all-all"]
}

#--------------------------------------------
# ABBYY Document Capture & OCR ALB
#--------------------------------------------
module "abbyy_doc_ocr_internal_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name                       = "alb-abbyy-doc-ocr-internal-001"
  vpc_id                     = data.aws_vpc.vpc.id
  internal                   = true
  load_balancer_type         = "application"
  enable_deletion_protection = true

  security_groups = [module.abbyy_doc_ocr_internal_alb_security_group.this_security_group_id]
  subnets         = data.aws_subnet_ids.web.ids

  access_logs = {
    bucket  = local.elb_access_logs_bucket_name
    prefix  = local.elb_access_logs_prefix
    enabled = true
  }

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.aws_acm_certificate.acm_cert.arn
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name                 = "tg-abbyy-doc-ocr-internal-001"
      backend_protocol     = "HTTP"
      backend_port         = var.fe_service_port
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = var.fe_health_check_path
        port                = var.fe_service_port
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      tags = {
        InstanceTargetGroupTag = "${var.application}-abbyy-doc-ocr"
      }
    },
  ]

  tags = merge(
    local.default_tags,
    map(
      "ServiceTeam", var.ServiceTeam
    )
  )
}


#--------------------------------------------
# ALB CloudWatch Merics
#--------------------------------------------
module "internal_alb_proxy_metrics" {
  source = "git@github.com:companieshouse/terraform-modules//aws/alb-metrics?ref=tags/1.0.26"

  load_balancer_id = module.abbyy_doc_ocr_internal_alb.this_lb_id
  target_group_ids = module.abbyy_doc_ocr_internal_alb.target_group_arns

  depends_on = [module.abbyy_doc_ocr_internal_alb]
}