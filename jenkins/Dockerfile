FROM jenkins

USER root 

COPY ["entrypoint.sh", "/"]

RUN apt-get update && \
    apt-get install sudo && \
    chmod 755 /entrypoint.sh

# Defaults
ENV DOCKER_SOCKET "/var/run/docker.sock"
ENV DOCKER_GROUP "dockerhost"
ENV JENKINS_USER "jenkins"
ENV DOCKER_HOST "unix:///var/run/docker.sock"

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]