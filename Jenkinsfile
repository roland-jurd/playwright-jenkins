pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.36.0-jammy-test_2' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'pwd'
            sh 'npm i -D @playwright/test'
            sh 'npx playwright test'
         }
      }
   }
}
