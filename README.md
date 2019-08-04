# terraform-aws-iam-role

Terraform module to create IAM role. Currently following functionality is supported:
* List of ARNs and services that are allowed to assume this role (allow_arn, allow_service)
* List of roles that this role is allowed to assume (assume_role)
* List of S3 buckets that this role is allowed to read/write (s3_read, s3_write)
* List of managed policies that this role can attach (policy_managed)
* List of custom policy files that this role can use (policy_file)
* Specified inline policy that this role can use (policy_inline)
* Arbitrary number of tags (tags)

## usage

```terraform
  module "iam_role" {
  source = "../"
  name = "dp-dl-test"
  path = "/netf/"
  allow_arn = [
    "arn:aws:iam::1234567890:user/netf"
  ]
  
  assume_role = [
    "arn:aws:iam::1234567890:role/test-role",
  ]

  s3_read = [
    "dp-datalake-test-bucket"
  ]
  tags = {
    Platform = "DP"
    Project = "test"
    Owner = "test"
    Environment = "datalake"
  }

}
```

Remember to add KMS access policy after adding s3_read/s3_write
* KMS decrypt (s3_read)
```
{
                "Effect": "Allow",
                "Action": [
                  "kms:Decrypt"
                ],
                "Resource": [
                        "arn:aws:kms:eu-west-1:ACCOUNT_ID:key/KEY_UUID"
                ]
        }
```
* KMS encrypt (s3_write)
```
{
                "Effect": "Allow",
                "Action": [
                  "kms:Encrypt",
                  "kms:Decrypt",
                  "kms:GenerateDataKey"
                ],
                "Resource": [
                        "arn:aws:kms:eu-west-1:ACCOUNT_NO:key/KEY_UUID"
                ]
        }

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->     
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_arn |  | list(string) | `[]` | no |
| allow\_service |  | string | `""` | no |
| assume\_role |  | list(string) | `[]` | no |
| dynamodb\_tables |  | list(string) | `[]` | no |
| enabled |  | bool | `"true"` | no |
| external\_id |  | string | `""` | no |
| max\_session\_duration |  | string | `"3600"` | no |
| name |  | string | `""` | no |
| path |  | string | `"/"` | no |
| policy\_file |  | list(string) | `[]` | no |
| policy\_inline |  | string | `""` | no |
| policy\_managed |  | list(string) | `[]` | no |
| s3\_read |  | list(string) | `[]` | no |
| s3\_write |  | list(string) | `[]` | no |
| tags |  | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id |  |
| instance\_profile\_id |  |
| role\_arn |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
