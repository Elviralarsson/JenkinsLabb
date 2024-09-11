pipeline {
    agent any   
    stages {
        stage('Build Trailrunner') {
            steps {
                dir('Trailrunner') {
                    bat 'mvn clean compile'
                }
            }
        }
        stage('Test Trailrunner') {
            steps {
                dir('Trailrunner') {
                    bat 'mvn test'
                }
            }
        }
        stage('Trailrunner Result') {
            steps {
                jacoco(
                execPattern: '**/target/jacoco.exec',
                classPattern: '**/target/classes/se/iths',
                sourcePattern: '**/src/main/java/se/iths'
                )
                junit '**/target/surefire-reports/TEST*.xml'
            }
        }  






stage('Run Robot') {
            steps {
                bat 'python -m robot -o results Selenium‘       }
 
            post {
                always {
                    robot outputPath:results              }
                }
            }
        }
    }
}

