void call(gitUrl) {
  sh "git clone ${gitUrl} $pwd"
  sh "ls -ltr"
}

