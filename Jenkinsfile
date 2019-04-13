def exitCode = 0
node {
    stage('Build') {
        echo 'Building..'
        sh "sudo chown -R jenkins: ${WORKSPACE}" 
        deleteDir()
        checkout scm
        
        def ambiente = input id: 'test', message: 'Please Provide Parameters', ok: 'Next',
           parameters: [
              choice(name: 'Deseja continuar',
                  choices: ['Sim!','Não!'].join('\n'),
                  description: 'Selecione a opção desejada'),
              string(name: 'EXIT',
                  defaultValue: '0',
                  description: 'Informe o código para continuar.')
           ]
        exitCode = ambiente['EXIT']
        echo "${ambiente}"
        
        try {
            sh "exit ${exitCode}"
            echo 'Testes Unitários - Sucesso!'
        }
        catch (e) {
            echo 'Falha na execução!'
            // throw e
        }
        finally {
            echo '..'
       }
    }
    stage('Test') {
        echo 'Testing..'
        sh "sudo docker run -v /home/docker/devops/exercicio3/srv/jenkins/workspace/${JOB_NAME}:/workspace -w /workspace maven:latest mvn install"    
    }
    stage('Deploy') {
        echo 'Deploying....'
    }
}
