void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      if (module == "all") {
        sh 'terragrunt run-all apply -auto-approve'
      } else {
        sh 'terragrunt apply -auto-approve'
      }
    }
  }
}
