FROM jenkins/jenkins:latest

USER root
RUN apt-get update \
  && apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
VOLUME [ "/var/run/docker.sock:/var/run/docker.sock", "/usr/bin/docker:/usr/bin/docker" ]
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
EXPOSE 8080