# Nice refence:

Below link is to youtube video, nice demo and explaination for JTE [Nice JTE Demo](https://www.youtube.com/watch?v=FYLaoqn0pDE)

## Jenkins Setup
- Use Jcasc
- Add plugings during startup
- Use `jcasc.yaml` to define setup
- Add secrets to `secrets` folder in correct directory structure in plain text files. (Need to move to read from Vault for future)
- Use separate `*-plugins.txt` to enable setup of plugins in layer

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


### JTE Pipeline Sample-Service


