pipeline {
    agent any
    environment {
        registry = "dasu0000/dockergradle"
        registryCredential = 'dasu0000-dockerhub'
        dockerImage = ''
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
                //dockerImage = docker.build(registry + ":$BUILD_ID")
                 sh "chmod +x gradlew"
                sh "./gradlew clean build --no-daemon"
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }
        stage('Docker'){
            steps {
                echo 'Testing docker installation'
                sh 'docker ps -a'
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
