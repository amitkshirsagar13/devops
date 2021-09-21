void call(gitUrl) {
  sh "rm -rf *"
  sh "rm -rf .git"
  sh "rm -rf .gitignore"
  sh "git clone ${gitUrl} ."
  sh "ls -ltra"
}

