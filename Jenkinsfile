pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'httpCallumj', passwordVariable: 'password', usernameVariable: 'username')]) {
		    sh 'deploy/buildIIB.sh $password'
		}
        
      }
    }
  }
}