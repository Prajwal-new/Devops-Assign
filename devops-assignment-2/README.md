# DevOps Assignment 2

## Features
- Two IAM roles (read-only, write-only)
- S3 bucket with lifecycle rule
- EC2 uploads logs to S3 on startup

## How to Run

1. Make sure AWS CLI and Terraform are configured.
2. Replace `<YOUR_BUCKET_NAME>` in `userdata.sh` with your actual S3 bucket name.
3. Run the following:

```bash
terraform init
terraform apply -var="bucket_name=my-devops-logs" -var="key_name=my-key-name"
```

4. After EC2 runs, check the S3 bucket under `system-logs/` and `app/logs/`.