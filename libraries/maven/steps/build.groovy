void call() {
  println "Building from maven"
  sh "mvn -B -Dmaven.test.skip=true clean install -f pom.xml"
}

