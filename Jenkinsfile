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
                bat 'python -m robot                   path till robot projekt ‘        }
 
            post {
                always {
                    robot outputPath:  path till din resultat av test               }
            }
        }





inne i stage vill han ha en post  
        stage('Run Robot Framework') {
            steps {
                dir('Selenium') {
                   bat
                }
            }
        }
        stage('Robot Result') {
            steps {
                dir('Selenium') {
                    robot outputPath: 'testresult'
                }
            }
           

