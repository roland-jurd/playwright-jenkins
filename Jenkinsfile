pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.37.1-jammy_local' } }
   stages {
   stage('install dependencies') {
         steps {
            sh 'npm ci'
            sh 'npm i -D @playwright/test'
         }
      }
      stage('playwright test') {
         steps {
            sh 'npx playwright test'
         }
      }
   }
}
