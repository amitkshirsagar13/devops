void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        if (module == "all") {
          sh 'terragrunt run-all destroy-all -auto-approve'
        } else {
          sh 'terragrunt destroy -auto-approve'
        }
      }
    }
  }
}
