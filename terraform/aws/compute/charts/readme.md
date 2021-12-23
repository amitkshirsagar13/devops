### Create jenkins/helm/kubernetes service account
```
kubectl -n helm create serviceaccount jenkins-robot
kubectl -n helm create rolebinding jenkins-robot-binding --clusterrole=cluster-admin --serviceaccount=helm:jenkins-robot
kubectl -n helm get serviceaccount jenkins-robot -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'
kubectl -n helm get secrets jenkins-robot-token-d6d8z -o go-template --template '{{index .data "token"}}' | base64 -d
```