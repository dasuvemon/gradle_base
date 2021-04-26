pipeline {
    agent any
    environment {
        registry = "dasu0000/dockergradle"
        registryCredential = 'dockerhub'
    }
    stages {
        stage('Clone repo') {
            steps {
                echo 'Cloning'
                checkout scm
            }
        }

        stage('build') {

            steps {
              script{
                echo 'Building'
                dockerImage = docker.build(registry + ":$BUILD_ID")
              }
            }
        }
        
      stage('deploy') {
            steps {
              script{
                echo 'Deploy'
                docker.withRegistry('', registryCredential){
                  dockerImage.push()
                }
              }
            }
        }
    }
}
