FROM jenkins/jenkins:lts
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Install Plugins
COPY workflow-plugins.txt /usr/share/jenkins/ref/workflow-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/workflow-plugins.txt

COPY pipeline-plugins.txt /usr/share/jenkins/ref/pipeline-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/pipeline-plugins.txt

COPY git-plugins.txt /usr/share/jenkins/ref/git-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/git-plugins.txt

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY user-auth.plugins.txt /usr/share/jenkins/ref/user-auth.plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/user-auth.plugins.txt

COPY job-plugins.txt /usr/share/jenkins/ref/job-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/job-plugins.txt

# Add JCasC
ENV CASC_JENKINS_CONFIG=/var/casc/casc_configs
COPY jcasc.yaml /var/casc/casc_configs/jcasc.yaml

# RUN apt-get update && apt-get install -y maven

ENV SECRETS="/var/secrets/seed_secrets"
ENV CASC_VAULT_FILE="/var/secrets/seed_secrets/jcasc_vault"
COPY secrets /var/secrets/seed_secrets

EXPOSE 8080