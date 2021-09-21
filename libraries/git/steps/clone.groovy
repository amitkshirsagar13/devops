void call(gitUrl) {
  sh "rm -rf *"
  sh "git clone ${gitUrl} ."
  sh "ls -ltr"
}

