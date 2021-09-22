### Nice refence:

[Nice JTE Demo](https://www.youtube.com/watch?v=FYLaoqn0pDE)

### JTE template setup
- Plugin: `templating-engine:latest`
  
  ```
  templateGlobalConfig:
    tier:
      configurationProvider: "null"
      librarySources:
      - libraryProvider:
          scm:
            baseDir: "libraries"
            scm:
              git:
                branches:
                - name: "*/main"
                buildChooser: "default"
                userRemoteConfigs:
                - credentialsId: "github-ci-user"
                  url: "https://github.com/amitkshirsagar13/devops.git"
  ```
  <img src="./img/jte-settings.png" width="600">



