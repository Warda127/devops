pipeline {
    agent any  // Utilise n'importe quel agent disponible pour l'exécution du pipeline

    tools {
        maven 'M3'  // Nom de l'installation Maven dans Jenkins
        jdk 'JDK21' // Nom de l'installation JDK dans Jenkins
    }

    stages {
        // Étape 1 : Vérification du code source
        stage('Checkout') {
            steps {
                // Récupère le code source depuis ton dépôt GitHub
                git branch: 'main', url: 'https://github.com/Warda127/devops.git'
            }
        }

        // Étape 2 : Compilation et tests
        stage('Build') {
            steps {
                // Exécute Maven pour compiler et tester l'application
                sh 'mvn clean install'
            }
        }

        // Étape optionnelle : Déploiement ou autres étapes de pipeline
        // stage('Deploy') {
        //     steps {
        //         // Ajouter des étapes pour déployer ton application
        //     }
        // }
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
