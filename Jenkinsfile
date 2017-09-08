pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'httpCallumj', passwordVariable: 'password', usernameVariable: 'username')]) {
		    sh 'ls -l "$PWD/deploy/buildIIB.sh"'
		    sh 'echo $PWD'
		    sh 'chmod a+xwr deploy/buildIIB.sh'
		    sh 'ls -l "$PWD/deploy/buildIIB.sh"'
		    sh 'cat "$PWD/deploy/buildIIB.sh"'
		    sh '"$PWD/deploy/buildIIB.sh" $password'
		}
        
      }
    }
  }
}