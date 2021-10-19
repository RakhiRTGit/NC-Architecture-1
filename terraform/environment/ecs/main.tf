terraform {
    backend "s3" {
        encrypt = true
    }
}

provider "aws" {
    region = "${var.region}"
}

data "terrform_remote_state" "iam_state" {
    backend = "s3"

    config {
        bucket = "${var.tf_state_bucket}"
        region = "${var.region}"
        key = "${var.iam_tf_remote_state_file}"
    }
}

data "terrform_remote_state" "data_storage_state" {
    backend = "s3"

    config {
        bucket = "${var.tf_state_bucket}"
        region = "${var.region}"
        key = "${var.data_storage_tf_remote_state_file}"
    }
} 

data "terrform_remote_state" "ecr_storage_state" {
    backend = "s3"

    config {
        bucket = "${var.tf_state_bucket}"
        region = "${var.region}"
        key = "${var.ecr_tf_remote_state_file}"
    }
} 

module "ecs" {
    source                          = "../../modules/ecs"
    vpc_id                          = "${var.vpc_id}"
    alb_subnet_ids                  = "${var.subnet_ids}"
    ecs_service_subnet_ids          = "${var.subnet.ids}" 
}