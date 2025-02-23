pipeline {
    agent any  
   tools {
       maven 'M2_HOME'  // Nom de l'installation Maven dans Jenkins

        jdk 'JDK21'  
    }

    stages {
        // Étape 1 : Vérification du code source
        stage('Checkout') {
            steps {
               
                git branch: 'main', url: 'https://github.com/Warda127/devops.git'
            }
        }
        stage('Build') {
            steps {
                
                sh 'mvn clean install'
            }
        }

           }

    post {
        success {
            echo 'Build réussi !'  // Message si le pipeline réussit
        }
        failure {
            echo 'Le build a échoué.'  // Message si le pipeline échoue
        }
    }
}
