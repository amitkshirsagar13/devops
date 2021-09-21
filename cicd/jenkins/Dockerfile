FROM jenkins/jenkins:lts
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Install Plugins
COPY workflow-plugins.txt /usr/share/jenkins/ref/workflow-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/workflow-plugins.txt

COPY pipeline-plugins.txt /usr/share/jenkins/ref/pipeline-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/pipeline-plugins.txt

COPY pipeline-plugins.txt /usr/share/jenkins/ref/git-plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/git-plugins.txt

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Add JCasC
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs
COPY jcasc.yaml /var/jenkins_home/casc_configs/jcasc.yaml

EXPOSE 8080