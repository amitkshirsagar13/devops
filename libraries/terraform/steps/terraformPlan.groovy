void call(module, action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        if (module == "all") {
          sh 'terragrunt run-all plan -var access_key=$AWS_ACCESS_KEY_ID -var access_key=$AWS_SECRET_ACCESS_KEY'
        } else {
          sh 'terragrunt plan -var access_key=$AWS_ACCESS_KEY_ID -var access_key=$AWS_SECRET_ACCESS_KEY'
        }
      }
    }
  }
}
