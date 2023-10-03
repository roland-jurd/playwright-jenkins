FROM mcr.microsoft.com/playwright:v1.37.1-jammy

USER 501:20

RUN mkdir /.npm
RUN npm install -g @playwright/test
RUN npm i typescript -g

