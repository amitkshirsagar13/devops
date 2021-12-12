### Run terragrunt commands
- Configure terraform-live as below

<img src="./terraform-live.png" width="600">


### Tutorial for lookup
- [Terraform Pipelines in Jenkins
](https://medium.com/@timhberry/terraform-pipelines-in-jenkins-47267129ff06)

```
terragrunt init
```

```
terragrunt plan
```

```
terragrunt plan -var application=k8cluster
```

```
terragrunt apply
```

```
terragrunt apply -var application=demo
```