# joshes/jenkins

Simple extension to the base Jenkins image that will allow connecting to the hosts Docker via the hosts docker socket.

Build:

```
docker build -t joshes/jenkins:latest .
```

Run:

```
docker run -d --rm -p 8080:8080 joshes/jenkins
```

Use the `-e` environment flag to override the following defaults:

```
ENV DOCKER_SOCKET "/var/run/docker.sock"
ENV DOCKER_GROUP "dockerhost"
ENV JENKINS_USER "jenkins"
ENV DOCKER_HOST "unix:///var/run/docker.sock"
```

Known Issues:

If you need to pass additional entrypoint arguments (e.g. `--prefix=/jenkins`), there is a [bug](https://github.com/docker/compose/issues/3140) where you will need to override the entrypoint explicitly.

For example: 

```
docker run --rm \
    --entrypoint '/bin/tini -- /usr/local/bin/jenkins.sh --prefix=/jenkins' \
    joshes/jenkins
```