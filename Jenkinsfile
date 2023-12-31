pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.37.1-jammy-3' } }
   stages {
   stage('install dependencies') {
         steps {
            sh 'npm --version'
            sh 'npx --version'
            sh 'tsc --version'
            sh 'npm ci'
            sh 'ls blob-report'
            sh 'rm -rf blob-report'
         }
      }
      stage('build') {
         steps {
            sh 'npm run build'
         }
      }
      stage('eslint') {
         steps {
            sh 'npm run eslint-report'
         }
         post {
            always {
                recordIssues enabledForFailure: true, aggregatingResults: true, tool: checkStyle(pattern: 'eslint-report.xml')
            }
        }
      }
      stage('smoke') { steps { script {
         parallel "Test 1": {
               sh 'npm run smoke-1'
         }, "Test 2": {
               sh 'npm run smoke-2'
         }, failFast: true
      }}}
      stage('sanity') { steps { script {
         parallel "Test 1": {
               sh 'npm run sanity-1'
         }, "Test 2": {
               sh 'npm run sanity-2'
         }, failFast: true
      }}}
      stage('regression') { steps { script {
         parallel "Test 1": {
               sh 'npm run regression-1'
         }, "Test 2": {
               sh 'npm run regression-2'
         }, failFast: true
      }}}
      stage('generate reports') {
         steps {
            sh 'ls blob-report'
            sh 'npm run merge-reports'
            publishHTML (target : [allowMissing: false,
                      alwaysLinkToLastBuild: true,
                      keepAll: true,
                      reportDir: 'playwright-report',
                      reportFiles: 'index.html',
                      reportName: 'Playwright Report',
                      reportTitles: 'Jenkins Playwright Report'])
         }
      }
   }
}
