pipeline {
    agent any

    stages {
        stage('Deploy To Kubernetes') {
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'stage-goofy', contextName: '', credentialsId: 'k8s-token', namespace: 'webapps', serverUrl: 'https://C7C38C5B17C3F5925099D8A1F5254950.yl4.ap-southeast-4.eks.amazonaws.com']]) {
                    sh "kubectl apply -f deployment-service.yml"
                    
                }
            }
        }
        
        stage('verify Deployment') {
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'stage-goofy', contextName: '', credentialsId: 'k8s-token', namespace: 'webapps', serverUrl: 'https://C7C38C5B17C3F5925099D8A1F5254950.yl4.ap-southeast-4.eks.amazonaws.com']]) {
                    sh "kubectl get svc -n webapps"
                }
            }
        }
    }
}
