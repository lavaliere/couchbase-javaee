node{
 stage 'build'
  withDockerContainer('kohsuke/acmecorp-buildenv') {
    sh "echo 'Running in container kohsuke/acmecorp-buildenv'"
  
      git 'https://github.com/lavaliere/couchbase-javaee.git'
      sh 'mvn install'
      archive 'target/*.war'
   }

  docker.withRegistry('https://index.docker.io/v1/', '15ca9c7c-3542-468e-83d6-010aaf7f1cc1') {
    sh "echo 'Connected to Docker registry'"
    stage 'package'
    sh 'ls -lart' 
    docker.build('lavaliere/acmecorp-app').push('demo')
    sh "echo 'Built and pushed image'"

    stage 'deploy'
    sh './deploy.sh'
    sh "echo 'Deployed image'"
   }
 }
