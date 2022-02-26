// userInfo
void call(key) {
  wrap([$class: 'BuildUser']) {
    if (key == 'USER') {
      return env.BUILD_USER
    }
    if (key == 'USERID') {
      return env.BUILD_USER
    }
    if (key == 'EMAIL') {
      return env.BUILD_USER_EMAIL
    }
  }
}

