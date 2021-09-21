void call() {
  println "Building from maven"
  sh "mvn -ntp -Dmaven.test.skip=true clean install -f pom.xml"
}

