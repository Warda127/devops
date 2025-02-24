pipeline {
    agent any  
    tools {
        maven 'M2_HOME'  
        jdk 'JDK21'  
    }

    environment {
        SONARQUBE = 'SonarQube' 
    }

    stages {
        stage('GIT') {
            steps {
echo "Getting Project from Git"
                git url: 'https://github.com/Warda127/devops.git', branch: 'warda'

                            }
        }

        stage('MVN CLEAN') {
            steps {
                sh 'mvn clean' 
            }
        }

        stage('MVN COMPILE') {
            steps {
                sh 'mvn compile' 
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_AUTH_TOKEN')]) {  // Correction ici
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn sonar:sonar -Dsonar.projectKey=devops -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${SONAR_AUTH_TOKEN}'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                sh 'mvn install' 
            }
        }
    }

    post {
        success {
            echo 'Build et analyse SonarQube réussis !'  // Message si le pipeline réussit
        }
        failure {
            echo 'Le build ou l\'analyse SonarQube a échoué.'  // Message si le pipeline échoue
        }
    }
}
