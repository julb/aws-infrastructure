# stage/terragrunt.hcl
remote_state {
    backend = "s3"
    generate = {
        path      = "_backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        bucket = "infra.terraform-state.s3"

        key = "${path_relative_to_include()}/terraform.tfstate"
        region         = "eu-west-3"
        encrypt        = true
        dynamodb_table = "infra.terraform-locks.dynamodb-table"
    }
}