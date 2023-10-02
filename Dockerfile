FROM mcr.microsoft.com/playwright:v1.37.1-jammy-1

RUN mkdir /.npm
RUN chown -R 994:990 /.npm
RUN chown -R 501:20 /.npm
RUN npm install -g @playwright/test
RUN npm i typescript -g
