void call(action, modulePath) {
  stage("Terraform Init") {
    println "Init Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      sh "terraform init"
    }
  }
}

