pipeline {
    agent any

    parameters {
        string(name: 'user_input', defaultValue: '0', description: 'A numeric parameter')
    }

    environment {
       output HTML = 'Fibonacci number.'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Netanelsamson/end-prj/blob/main/script.bat'  
            }
        }

        stage('Run Shell Script') {
            steps {
                script {
                    def output = sh(script: "bash script.sh ${params.user_input}", returnStdout: true).trim()
                    writeFile file:  output HTML, text: "<html><body><h1>Fibonacci number.</h1><p>${Fibonacci number}</p></body></html>"
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "Numeric parameter is ${params.user_input}"
                }
            }
        }

        stage('Verify Parameter on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.user_input}")) {
                        echo "Parameter ${params.user_input} exists on the web page."
                    } else {
                        error "Parameter ${params.user_input} does not exist on the web page."
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: Fibonacci number, fingerprint: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: Fibonacci number,
                reportName: 'Shell Script Output'
            ])
        }
    }
}

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportName: 'Job Output',
                    reportDir: '.',
                    reportFiles: 'Fibonacci number',
                    alwaysLinkToLastBuild: true
                ])
            }
        }
    }
}
