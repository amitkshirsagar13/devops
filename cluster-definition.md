## Cluster Definition
-------------------------------------
### Environments
- tooling
- dev
- test
- stage
- pre-prod
- prod


### tooling
This environment will be enabled to handle jenkins/helm/argocd/repositories
- CI using jenkins
- Networking using gloo/istio
- CD using argocd
- Monitoring using grafana, prometheous and kibana
- Tracing with jaeger

Sample cluster url
- `jenkins.tooling.localtest.me`
- `grafana.tooling.localtest.me`
- `kibana.tooling.localtest.me`
- `alert.tooling.localtest.me`
- `trace.tooling.localtest.me`
- `es.tooling.localtest.me`

### dev
This environment will be used by application teams to deploy applications to different namespaces for development purpose

- `us-east-a`
    - Will be tear down daily and rebuild with latest master
- `us-east-b`
    - Will get updated daily and frequently as needed by teams

This environment will be rebuilt daily.

- `gloo.us-east-a.dev.localtest.me`
- `argocd.us-east-a.dev.localtest.me`
- `prom.us-east-a.dev.localtest.me`
- `alert.us-east-a.dev.localtest.me`

### test
This environment will be used by application teams to deploy applications to different namespaces for test purpose

### stage
This environment will be used by application teams to deploy applications to different namespaces for stage and qa purpose

### pre-prod
This environment will be used by application teams to deploy applications to different namespaces for demo and business for verify purpose

### prod
This environment will be used by application teams to deploy applications to different namespaces for live business for verify purpose

