pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.37.1-jammy_local' } }
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
