
This demo will show how to set up a Docker-based build and deploy pipeline in Jenkins using all open-source plugins.
- Master in DEV@cloud [here](https://partnerdemo.ci.cloudbees.com/job/Docker%20Pipeline/job/Pipeline-Docker-Demo/)
- Slave is an AWS EC2 instance with Docker, Maven, Git, and Java 7 installed on Amazon Linux connected to Jenkins with an SSH Connector

# Required Plugins
- CloudBees Docker Build and Publish Plugin
- CloudBees Docker Pipeline Plugin
- CloudBees Custom Build Environments Plugin
- Docker Plugin
- Pipeline Plugin

# Optional Plugins
- Pipeline Stage View Plugin

# Required tools for build agent
- Maven
- Java
- Git
- Docker w/ running Docker daemon

# Actual Flow
- A Jenkins pipeline job builds this project
- Any push to the source code will trigger pipeline to:
-- Pull the source code from this GitHub repostiory
-- Run the Maven tests
-- Build the application
-- Package the application in a Docker image using this repo's Dockerfile
-- Deploy the application's Docker image [to DockerHub with a "docker-demo" tag](https://hub.docker.com/r/lavaliere/couchbase/tags/)
-- Kill previously running container
-- Start a new container using this image

# Additional Reading
- [How to point to a custom registry (e.g. local](http://documentation.cloudbees.com/docs/cje-user-guide/docker-workflow.html)
