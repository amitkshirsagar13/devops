void call(gitUrl) {
  sh "srcDir=`pwd`"
  sh "git clone ${gitUrl} $srcDir"
  sh "ls -ltr"
}

