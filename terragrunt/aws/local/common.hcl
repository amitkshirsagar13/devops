# Set the generate config dynamically to the generate config in account.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "3.69.0"
      }
    }
  }

  provider "helm" {
    kubernetes {
      host     = "https://kubernetes.docker.internal:6443"
      insecure = true
      token    = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkI0Z25BMEdTaXlDRTd6cFVQcVFqT3RsVGxseDNtaFNuUW5UWXBlN2w5encifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJlY2hvIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtcm9ib3QtdG9rZW4tY3M1ZnoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucy1yb2JvdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6Ijc0M2IxZWQ2LTI0YjEtNDI1ZC1hZTc1LTBjNGU0ZGMxODQ1YiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDplY2hvOmplbmtpbnMtcm9ib3QifQ.GcSA8k7fe_7ZHgjNqbr4_NwQ4YO_Dk3L3mTiY_ulwV6xOVbVvEbKgDimzEZyjL5onas_Ie_17oN5QRdmSyq7dkfnMfcuOBUu8XCz0xYYCIMa3rmK9cPTuklSp0QnddqAAIwCyiTv1T_BZkW5UaNcwCcX1HQkVUEj60DcL8hH8y6dCpCEV5U0-Woz-hzjc6lBKWCXn0wlRuG49ca-RdRr4qeIWd3pd_evHOqxkPT7lTxmVtXE7nPIXFT4HHeq-ZClliN7deeN6lCkxht5LJE2o6l0L5CfVY2IsRcJgR30H391rwhTwe3xF3lsZqktZITpj9d3KTFIJ2L9F_NJymMoKg"
    }
  }

  provider "aws" {
    access_key = "fake-access-common"
    secret_key = "fake-secret-common"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints {
      apigateway      = "http://host.docker.internal:4566"
      cloudformation  = "http://host.docker.internal:4566"
      cloudwatch      = "http://host.docker.internal:4566"
      dynamodb        = "http://host.docker.internal:4566"
      ec2             = "http://host.docker.internal:4566"
      es              = "http://host.docker.internal:4566"
      firehose        = "http://host.docker.internal:4566"
      iam             = "http://host.docker.internal:4566"
      kinesis         = "http://host.docker.internal:4566"
      lambda          = "http://host.docker.internal:4566"
      route53         = "http://host.docker.internal:4566"
      redshift        = "http://host.docker.internal:4566"
      s3              = "http://host.docker.internal:4566"
      secretsmanager  = "http://host.docker.internal:4566"
      ses             = "http://host.docker.internal:4566"
      sns             = "http://host.docker.internal:4566"
      sqs             = "http://host.docker.internal:4566"
      ssm             = "http://host.docker.internal:4566"
      stepfunctions   = "http://host.docker.internal:4566"
      sts             = "http://host.docker.internal:4566"
    }
  }
  EOF
}

# Set the generate config dynamically to the generate config in account.hcl
generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
      endpoint                    = "http://host.docker.internal:4566"
      dynamodb_endpoint           = "http://host.docker.internal:4566"
      
      skip_credentials_validation = true
      skip_metadata_api_check     = true
      force_path_style            = true

      bucket         = "k8clusters-terraform-state-local"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "sa-east-1"
      encrypt        = true
      
      dynamodb_table = "local-terraform-lock-table"
    }
  }
  EOF
}