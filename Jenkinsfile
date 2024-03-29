pipeline { 

    agent any 

    stages { 

        stage('Build') { 

            steps { 

	dir('TrailRunner') { 
                 bat 'mvn compile' 

		} 

            } 

        } 

  

stage('Test') { 

            steps { 

                dir('TrailRunner') { 

                    bat 'mvn test' 

		} 

            } 

        } 
