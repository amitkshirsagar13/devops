void call(var) {
  wrap([$class: 'BuildUser']) {
    if (var == 'USER') {
      return env.BUILD_USER
    }
    if (var == 'EMAIL') {
      return env.BUILD_USER_EMAIL
    }
  }
}