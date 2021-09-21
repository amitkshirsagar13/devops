void call() {
  println "Building from maven"
  sh "mvn -Dmaven.test.skip=true clean install -f pom.xml"
}

