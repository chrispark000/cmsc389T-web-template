#Use the node:10-alpine image as a base to
FROM node:10-alpine

#create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app 

#install all packages in package.json
RUN npm install

WORKDIR /home/node/app

COPY *.js ./
COPY *.json ./

EXPOSE 8080

RUN npm install

COPY --chown=node:node . .

CMD ["npm", "install"]

CMD ["node", "app.js"]
