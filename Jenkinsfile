node("docker-agent") {
    def app
    
    stage('Prepare enviorenment') {
        checkout scm
    }
     stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("shidima/seaside-example:${env.BUILD_ID}")
    }
    
    stage('Push Image') {
        docker.withRegistry('', 'dockerhub') {
            app.push()  
            app.push('latest')
        }
    }
    
    stage('Deploy') {
        try {
            sh "docker stop seaside-example"
            sh "docker rm seaside-sexample"
        }
        catch (error) {

        }
        sh "docker run -d --name=seaside-example -e VIRTUAL_HOST=seaside-example.drunkturtle.com -e VIRTUAL_PORT=8080  shidima/seaside-example"
    }
}
