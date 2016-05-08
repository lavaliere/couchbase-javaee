//Picking a build agent labeled "ec2" to run pipeline on
node ('ec2'){
  stage 'Pull from SCM'  
  //Passing the pipeline the ID of my GitHub credentials and specifying the repo for my app
  git credentialsId: '32f2c3c2-c19e-431a-b421-a4376fce1186', url: 'https://github.com/lavaliere/couchbase-javaee.git'
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
  docker.withRegistry ('https://index.docker.io/v1/', 'ed17cd18-975e-4224-a231-014ecd23942b') {
      sh 'ls -lart' 
      pkg.push 'docker-demo'
  }
}