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
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs
COPY jcasc.yaml /var/jenkins_home/casc_configs/jcasc.yaml

ENV SECRETS="/var/jenkins_home/seed_secrets"
COPY secrets /var/jenkins_home/seed_secrets

EXPOSE 8080