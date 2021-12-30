#!/bin/sh
cat > jenkins-robot.yml << EOF
apiVersion: v1
kind: Namespace
metadata:
  name: ci
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins-robot
  namespace: ci
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: jenkins-admin
rules:
- apiGroups:
  - ""
  resources:
  - pods
  - secrets
  - services
  - configmaps
  - serviceaccounts
  - persistentvolumeclaims
  verbs:
  - get
  - list
  - watch
  - create
  - update
  - patch
  - delete
- apiGroups:
  - extensions
  - apps
  resources:
  - deployments
  - replicasets
  verbs:
  - get
  - list
  - watch
  - create
  - update
  - patch
  - delete
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: jenkins-robot-binding
roleRef:
  kind: ClusterRole
  name: jenkins-admin
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: jenkins-robot
  namespace: ci
EOF
kubectl apply -f jenkins-robot.yml
JENKINS_ROBOT=`kubectl -n ci get serviceaccount jenkins-robot -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'`
echo `kubectl -n ci get secrets $JENKINS_ROBOT -o go-template --template '{{index .data "token"}}' | base64 -d`

