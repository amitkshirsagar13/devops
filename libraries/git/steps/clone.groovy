void call(gitUrl) {
  stage("Clone Repo") {
    println "Cloning repo"
    sh "rm -rf *"
    sh "rm -rf .git"
    sh "rm -rf .gitignore"
    sh "git clone ${gitUrl} ."
    sh "ls -ltra"
  }
}

