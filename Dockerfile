FROM jenkins/jenkins:latest

USER root
RUN apt-get update \
  && apt-get upgrade \
  && apt-get install vim \
  && apt-get install yum \
  && apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
VOLUME [ "/var/run/docker.sock", "/usr/bin/docker" ]
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# ENTRYPOINT ["sudo sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' /var/jenkins_home/updates/default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' /var/jenkins_home/updates/default.json","sudo apt-get update && sudo apt-get install -y docker.io"]
EXPOSE 8080