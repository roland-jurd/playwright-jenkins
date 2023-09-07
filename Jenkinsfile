pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.36.0-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'npm cache clean --force'
            sh 'npx playwright test'
         }
      }
   }
}
