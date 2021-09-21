void call(appEnv) {
  // String nodeLabel = config.nodeLabel ?: { error "You need to define nodeLabel"}()
  Stage("Deploy to ${appEnv.short_name}") {
    // node(nodeLabel) {
      appEnv.ip_addresses.each { ip -> 
        println "deploying to ${ip}"
      }
    // }
  }
}

