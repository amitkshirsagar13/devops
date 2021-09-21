void call(gitUrl) {
  sh "ls -ltra"
  sh "rm -rf *"
  sh "rm -rf .git"
  sh "git clone ${gitUrl} ."
  sh "ls -ltra"
}

