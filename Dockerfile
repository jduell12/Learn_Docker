# original full node image 
# FROM node:15
# using the image variant alpine
# FROM node:15-alpine 
# setting the alpine variant as a production image
FROM node:15-alpine as prod

ARG PORT=8000
ENV PORT=$PORT 

WORKDIR app 

# /app/src/index.js
COPY src src  
# /app/package.json
COPY package.json .

# original command
# RUN npm install 
#only install prod dependencies
RUN npm install --only=prod

EXPOSE $PORT 

# original command
# CMD npm start
# start the production image
CMD npm startprod

#create multi-layer image
FROM prod as dev 
RUN npm install --only=dev
CMD npm start 