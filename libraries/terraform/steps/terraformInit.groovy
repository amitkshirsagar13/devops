void call(action, modulePath) {
  stage("Terraform Init") {
    println "Init Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      sh "car ~/.terraformrc"
      sh "terraform init"
    }
  }
}

