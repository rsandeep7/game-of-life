pipeline{
    agent any

    stages{

        stage('Pull Repo'){
            steps {
                git 'https://github.com/rsandeep7/game-of-life.git'
                
            }
        }

        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Publish'){
            steps{
                junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
            }
            
        }
        
        stage('Archive') {
            steps {
                archive 'maven-example/**/target/*.war'
            }
        }
        
        stage('Docker Build') {
            steps {
               sh 'sudo docker build -t rsandeep7/sandydev:v2 .'
      }
    }
        stage('Push image') {
      steps {
        withDockerRegistry([credentialsId: 'docker', url: "https://cloud.docker.com/u/rsandeep7/repository/docker/rsandeep7/sandydev"]) {
          sh 'sudo docker push rsandeep7/sandydev:v2'
        }
      }
    }
  } 
}
    
