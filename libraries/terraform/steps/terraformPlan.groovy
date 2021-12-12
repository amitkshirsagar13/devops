void call(module, action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY'),
                        string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_KEY')]) {
        if (module == "all") {
          sh 'terragrunt run-all plan -var AWS_ACCESS_KEY=$AWS_ACCESS_KEY -var AWS_SECRET_KEY=$AWS_SECRET_KEY'
        } else {
          sh 'terragrunt plan -var AWS_ACCESS_KEY=$AWS_ACCESS_KEY -var AWS_SECRET_KEY=$AWS_SECRET_KEY'
        }
      }
    }
  }
}
