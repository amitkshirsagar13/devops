void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    withCredentials([string(credentialsId: "$KEY", variable: 'AWS_ACCESS_KEY_ID'),
                  string(credentialsId: "$SECRET", variable: 'AWS_SECRET_ACCESS_KEY')]) {
      dir("${modulePath}") {
        if (module == "all") {
          sh "terragrunt run-all destroy -lock=false -auto-approve -var KUBE_TOKEN=$KUBE_TOKEN"
        } else {
          sh "terragrunt destroy -lock=false -auto-approve -var KUBE_TOKEN=$KUBE_TOKEN"
        }
      }
    }
  }
}
