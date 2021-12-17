void call(module, action, modulePath) {
  stage("Terraform Apply") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      if (module == "all") {
        sh 'terragrunt run-all destroy -auto-approve'
      } else {
        sh 'terragrunt destroy -auto-approve'
      }
    }
  }
}
