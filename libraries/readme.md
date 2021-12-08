### Libraries for JTE template Engine
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