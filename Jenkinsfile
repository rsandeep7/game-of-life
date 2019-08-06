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
               sh 'docker build -t rsandeep7/sandydev:v1 .'
      }
    }
        stage('Push image') {
          steps {
              docker.withRegistry("https://hub.docker.com/r/rsandeep7/sandydev", docker) {
            sh 'docker push rsandeep7/sandydev:v1'
        }
      }
    }
  } 
}
    
