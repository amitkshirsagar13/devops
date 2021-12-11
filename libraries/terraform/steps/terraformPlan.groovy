void call(action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"
    steps {
      dir("${modulePath}") {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                          string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
          // sh 'terraform plan -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_access_key=$AWS_SECRET_ACCESS_KEY'
          sh """
            pwd
            ls -ltr
          """
          sh 'terragrunt plan -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_access_key=$AWS_SECRET_ACCESS_KEY'
        }
      }
    }
  }
}
