pipeline {
   agent { docker { image 'us-east1-docker.pkg.dev/impact-ami/docker-snapshots/playwright:v1.37.1-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'pwd'
            sh 'npm ci'
            sh 'npx playwright test'
         }
      }
   }
}
