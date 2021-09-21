void call(gitUrl) {
  stage('Git Clone') {
    steps {
      sh 'git clone gitUrl $(pwd)'
    }
  }
}

