void call(module, action, modulePath) {
  stage("Terraform Plan") {
    println "Terraform ${action} for ${modulePath}"

    if (action == 'destroy') {
      planCmd = "plan -destroy"
    } else {
      planCmd = "plan"
    }

    withCredentials([string(credentialsId: "$KEY", variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: "$SECRET", variable: 'AWS_SECRET_ACCESS_KEY'),
                      string(credentialsId: "$KUBEHOST", variable: 'KUBE_HOST'),
                      string(credentialsId: "$KUBETOKEN", variable: 'KUBE_TOKEN')]) {
      dir("${modulePath}") {
        if (module == "all") {
          sh "terragrunt run-all $planCmd -lock=false -out=terraplan"
        } else {
          sh "terragrunt $planCmd -lock=false -out=terraplan"
        }
      }
    }
  }
}
