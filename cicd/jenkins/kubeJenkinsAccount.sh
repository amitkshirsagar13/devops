#!/bin/sh
kubectl create namespace ci
kubectl -n ci create serviceaccount jenkins-robot
kubectl -n ci create rolebinding jenkins-robot-binding --clusterrole=cluster-admin --serviceaccount=ci:jenkins-robot
kubectl -n ci get serviceaccount jenkins-robot -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'
kubectl -n ci get secrets `kubectl -n ci get serviceaccount jenkins-robot -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'` -o go-template --template '{{index .data "token"}}' | base64 -d