//Picking a build agent labeled "ec2" to run pipeline on
node ('ec2'){
  stage 'Pull from SCM'  
  //Passing the pipeline the ID of my GitHub credentials and specifying the repo for my app
  git credentialsId: '42411e53-3b6a-4aa2-a4e6-1b57f2e44085', url: 'https://github.com/lavaliere/couchbase-javaee.git'
  stage 'Test Code'  
  sh 'mvn install'

  stage 'Build app'  
  //Running the maven build and archiving the war
  sh 'mvn install'
  archive 'target/*.war'
  
  stage 'Package Image'
  //Packaging the image into a Docker image
  def pkg = docker.build ('lavaliere/couchbase', '.')

  
  stage 'Push Image'
  //Pushing the packaged app in image into DockerHub
  docker.withRegistry ('https://index.docker.io/v1/', '15ca9c7c-3542-468e-83d6-010aaf7f1cc1') {
      sh 'ls -lart' 
      pkg.push 'docker-demo'
  }
}
