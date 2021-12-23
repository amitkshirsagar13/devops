void call(action, modulePath) {
  stage("Terraform Init") {
    println "Init Terraform ${action} for ${modulePath}"
    dir("${modulePath}") {
      sh "whoami"
      sh "ls -ltra /root"
      sh "terraform init"
    }
    withCredentials([string(credentialsId: "kubernetes-jenkins-robot", variable: 'AWS_SECRET_ACCESS_KEY')]) {
      sh 'export TF_VAR_KUBE_TOKEN'
    }
    
  }
}

