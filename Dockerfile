FROM mcr.microsoft.com/playwright:v1.37.1-jammy-1

RUN mkdir /.npm
RUN npm install -g @playwright/test
RUN npm i typescript -g
CMD chown -R 501:20 /.npm
