void call(module, action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      if (module == "all") {
        sh 'terragrunt run-all plan'
      } else {
        sh 'terragrunt plan'
      }
    }
  }
}
