### Run terragrunt commands
- Configure terraform-live as below

<img src="./terraform-live.png" width="600">

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