void call(gitUrl) {
  sh "git clone ${gitUrl}"
  sh "ls -ltr"
}

