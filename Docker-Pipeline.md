
This demo will show how to set up a Docker-based build and deploy pipeline in Jenkins using all open-source plugins.
- Master in AWS [here](http://52.72.46.249:8080) running Jenkins 2.1
- Slave is an AWS EC2 instance with Docker, Maven, Git, and Java 7 installed on Amazon Linux connected to Jenkins with an SSH Connector
- Staging server is [running in ECS](http://54.213.84.64:8091)
- Deployment server is running in ECS

# Required Plugins
- CloudBees Docker Pipeline Plugin
- Pipeline Plugin
- Docker Plugin

# Optional Plugins
- Pipeline Stage View Plugin
- CloudBees Docker Build and Publish Plugin
- CloudBees Custom Build Environments Plugin

# Required tools
- Maven
- Java
- Git
- Docker w/ running Docker daemon

# Actual Flow
- A Jenkins pipeline job builds this project
- Any push to the source code will trigger pipeline to:
- Pull the source code from this GitHub repostiory
- Run the Maven tests
- Build the application
- Package the application in a Docker image using this repo's Dockerfile
- Deploy the application's Docker image [to DockerHub with a "docker-demo" tag](https://hub.docker.com/r/lavaliere/couchbase/tags/)
- Deploy the image to a staging server in Amazon's container service (ECS) and prompt for manual approval
- Kill the previously running production container in ECS
- Deploy the latest image into ECS

# Additional Reading
- [How to point to a custom registry (e.g. local)](http://documentation.cloudbees.com/docs/cje-user-guide/docker-workflow.html)
