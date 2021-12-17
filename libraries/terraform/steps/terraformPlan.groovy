void call(module, action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"

    if (action == 'destroy') {
      planCmd = "plan -destroy"
    } else {
      planCmd = "plan"
    }
    
    withCredentials([string(credentialsId: "$KEY", variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: "$SECRET", variable: 'AWS_SECRET_ACCESS_KEY')]) {
      dir("${modulePath}") {
        if (module == "all") {
          sh "terragrunt run-all $planCmd -out=terraplan"
        } else {
          sh "terragrunt $planCmd -out=terraplan"
        }
        sh "terragrunt show plan"
      }
    }
  }
}
