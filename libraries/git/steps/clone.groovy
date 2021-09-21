void call(gitUrl) {
  sh "rm -rf *"
  sh "ls -ltr"
  sh "git clone ${gitUrl} ."
  sh "ls -ltr"
}

