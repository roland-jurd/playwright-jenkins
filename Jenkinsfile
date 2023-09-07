pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.36.0-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'pwd'
            sh 'ls'
            sh 'chown -R 501:20 ~/.npm'
            sh 'npx playwright test'
         }
      }
   }
}
