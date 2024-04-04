pipeline { 

    agent any 

    stages { 

        stage('Build') { 

            steps { 

	dir('TrailRunner') { 
                
		sh 'mvn clean install'
		

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
