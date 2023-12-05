FROM node:16-alpine 

WORKDIR /usr/src/app

COPY package*.json ./ 

RUN npm install

COPY src /usr/src/app

EXPOSE 3000

CMD ["node", "app.js"]