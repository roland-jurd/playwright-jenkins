pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.37.1-jammy_local' } }
   stages {
   stage('install dependencies') {
         steps {
            sh 'npm --version'
            sh 'npx --version'
            sh 'tsc --version'
            sh 'npm ci'
            sh 'npm i -D @playwright/test'
         }
      }
      stage('build') {
         steps {
            sh 'npm run build'
         }
      }
      stage('smoke') { steps { script {
         parallel "Test 1": {
               sh 'npx playwright test --grep "@smoke" --grep-invert "@test2" --max-failures=1'
         }, "Test 2": {
               sh 'npx playwright test --grep "@smoke" --grep-invert "@test1" --max-failures=1'
         }, failFast: true
      }}}
      stage('sanity') { steps { script {
         parallel "Test 1": {
               sh 'npx playwright test --grep "@sanity" --grep-invert "@test2" --max-failures=1'
         }, "Test 2": {
               sh 'npx playwright test --grep "@sanity" --grep-invert "@test1" --max-failures=1'
         }, failFast: true
      }}}
      stage('regression') { steps { script {
         parallel "Test 1": {
               sh 'npx playwright test --grep "@regression" --grep-invert "@test2" --max-failures=1'
         }, "Test 2": {
               sh 'npx playwright test --grep "@regression" --grep-invert "@test1" --max-failures=1'
         }, failFast: true
      }}}
   }
}
