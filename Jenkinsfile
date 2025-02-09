pipeline {
    agent any

    parameters {
        string(name: 'NAME', defaultValue: 'User123', description: 'Enter your name')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-repo/jenkins-job-example.git', branch: 'main'
            }
        }

        stage('Run Script') {
            steps {
                sh 'chmod +x script.sh && ./script.sh ${NAME}'
            }
        }

        stage('Generate HTML Output') {
            steps {
                sh 'echo "<html><body><h1>Job Output</h1><pre>$(cat output.txt)</pre></body></html>" > output.html'
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportName: 'Job Output',
                    reportDir: '.',
                    reportFiles: 'output.html',
                    alwaysLinkToLastBuild: true
                ])
            }
        }
    }
}
