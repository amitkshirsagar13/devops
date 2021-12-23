void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    withCredentials([string(credentialsId: "$KEY", variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: "$SECRET", variable: 'AWS_SECRET_ACCESS_KEY'),
                      string(credentialsId: "kubernetes-jenkins-robot", variable: 'KUBE_TOKEN')]) {
      dir("${modulePath}") {
        if (module == "all") {
          sh "terragrunt run-all apply -lock=false -auto-approve"
        } else {
          sh "terragrunt apply -lock=false -auto-approve"
        }
      }
    }
  }
}
