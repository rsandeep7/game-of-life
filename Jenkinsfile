pipeline {
agent any
stages {
        stage('Clone sources') {
            steps {
                git 'https://github.com/rsandeep7/game-of-life.git'
            }
        }
        stage('Maven build') {
            steps {
                sh 'cd maven-example; mvn -Dmaven.test.failure.ignore clean package'
            }
        }
        stage('Test report') {
            steps {
                junit 'maven-example/**/target/surefire-reports/TEST-*.xml'
            }
        }
        stage('Archive') {
            steps {
                archive 'maven-example/**/target/*.war'
            }
        }
    }
}
