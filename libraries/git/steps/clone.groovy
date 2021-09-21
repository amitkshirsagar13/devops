void call(gitUrl) {
  sh 'git clone gitUrl $(pwd)'
}

