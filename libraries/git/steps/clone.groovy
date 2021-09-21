void call(gitUrl) {
  sh '''srcDir=`pwd`
        git clone ${gitUrl} $srcDir
        ls -ltr'''
}

