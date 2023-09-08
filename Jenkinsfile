pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.36.0-jammy-test' } }
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
