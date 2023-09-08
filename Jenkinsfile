pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.37.1-jammy_local' } }
   stages {
   stage('install dependencies') {
         steps {
            sh 'npm ci'
            sh 'npm i -D @playwright/test'
         }
      }
      stage('smoke test') { steps { script {
         parralel: 
            "Test 1": {
               sh 'npx playwright test --grep "@smoke" --grep-invert "@test2" --max-failures=1'
         }, "Test 2": {
               sh 'npx playwright test --grep "@smoke" --grep-invert "@test1" --max-failures=1'
         }, failFast: true
      }
   }
}
