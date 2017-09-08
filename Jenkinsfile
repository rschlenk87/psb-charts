pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'httpCallumj', passwordVariable: 'password', usernameVariable: 'username')]) {
		    sh 'ls -lR'
		    sh 'echo $PWD'
		    sh 'chmod a+xwr $PWD/deploy/buildIIB.sh'
		    sh '$PWD/deploy/buildIIB.sh $password'
		}
        
      }
    }
  }
}