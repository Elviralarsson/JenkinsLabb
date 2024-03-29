pipeline { 

    agent any 

    stages { 

        stage('Build') { 

            steps { 

	dir('TrailRunner') { 
                withMaven{
		sh 'mvn compile'
		}

		} 

            } 

        } 

  

stage('Test') { 

            steps { 

                dir('TrailRunner') { 

                    sh 'mvn test' 

		} 

            } 

        } 
    }
}
