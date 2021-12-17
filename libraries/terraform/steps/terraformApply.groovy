void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    withCredentials([string(credentialsId: "$KEY", variable: 'AWS_ACCESS_KEY_ID'),
                  string(credentialsId: "$SECRET", variable: 'AWS_SECRET_ACCESS_KEY')]) {
      dir("${modulePath}") {
        if (module == "all") {
          sh 'terragrunt run-all apply terraplan -auto-approve'
        } else {
          sh 'terragrunt apply terraplan -auto-approve'
        }
      }
    }
  }
}
