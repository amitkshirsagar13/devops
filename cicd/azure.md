# Azure DevOps and CICD
## Azure Subscription first needs Organization to be created 
- [amitkshirsagar13](https://dev.azure.com/amitkshirsagar13)

## Organizations can have multiple Projects
- [k8clusters](https://dev.azure.com/amitkshirsagar13/k8clusters)

## Project Setup
### Repositories
- Projects can have N number of respositories
- [k8clusters](https://dev.azure.com/amitkshirsagar13/_git/k8clusters) holds ARM Templates for Project Infrastructure
- Ideally we should have.
  - 1 Infrastructure Repository for Project Possibally Parameterized and reusable from master repository
  - 1 CI/CD related Repository to store scripts and automation
  - N number of Application Repositories per project (Project can have more than 1 applications)

### CD/CD Pipeline
- Create TaskGroups for setting up reusable steps for creating infrastructure
- Create Variable Groups to host Subscription and Application Infrastructure details
- Create Build pipelines to create packages and deployments
- Create Release pipelines to deploy applications to environments
- Create Stages in Release pipeline to target different environments

