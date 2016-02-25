
This demo will show how to set up a Docker-based build and deploy pipeline in Jenkins using all open-source plugins.
- Master in DEV@cloud [here | https://partnerdemo.ci.cloudbees.com/job/Docker%20Pipeline/job/Pipeline-Docker-Demo/]
- Slave is an AWS EC2 instance with Docker, Maven, Git, and Java 7 installed on Amazon Linux connected to Jenkins with an SSH Connector

# Required Plugins
- CloudBees Docker Build and Publish Plugin
- CloudBees Docker Pipeline Plugin
- CloudBees Custom Build Environments Plugin
- Docker Plugin
- Pipeline Plugin

# Optional Plugins
- Pipeline Stage View Plugin

# Desired Flow
- Use the project https://github.com/arun-gupta/couchbase-javaee
- Any push to the source code should
-- Build the workspace
-- Run the tests
-- Build Docker image using Dockerfile
-- Deploy it to a local Docker registry
-- Kill previously running container
-- Start a new container using this image
