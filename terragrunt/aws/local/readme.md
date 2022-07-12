### Local Environment Access

- Access localhost from docker container using `LOCAL_AWS_ACCESS_KEY_ID`

### Backend Remote State Bucket

```
just create-terraform-state

 # or use

aws --endpoint-url=http://localhost:4566 s3 mb s3://k8clusters-terraform-state-local
aws --endpoint-url=http://localhost:4566 dynamodb create-table --table-name local-terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

```
