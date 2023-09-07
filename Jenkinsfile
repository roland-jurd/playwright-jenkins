pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.36.0-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'pwd'
            sh 'npm config set cache  /Users/rolandjurd/.jenkins/npm/cache --global'
            sh 'ls -alh /Users/rolandjurd/'
            sh 'npx playwright test'
         }
      }
   }
}
