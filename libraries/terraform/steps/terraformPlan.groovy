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
                      string(credentialsId: "kubernetes-jenkins-robot", variable: 'KUBE_TOKEN')]) {
      dir("${modulePath}") {
        sh "export TF_VAR_KUBE_TOKEN=$KUBE_TOKEN"
        if (module == "all") {
          sh "terragrunt run-all $planCmd -lock=false -out=terraplan -var KUBE_TOKEN=$KUBE_TOKEN -var TF_VAR_KUBE_TOKEN=$KUBE_TOKEN"
        } else {
          sh "terragrunt $planCmd -lock=false -out=terraplan -var KUBE_TOKEN=$KUBE_TOKEN -var TF_VAR_KUBE_TOKEN=$KUBE_TOKEN"
        }
        // sh "terragrunt show plan"
      }
    }
  }
}
