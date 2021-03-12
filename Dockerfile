FROM node: 15

ARG PORT=8000
ENV PORT=$PORT

#create a directory /app
#every instruction will be run inside the /app directory 
WORKDIR app

#copy source 
# /app/src
COPY src src 

#copy package.json
# /app/package.json
COPY package.json . 

# COPY . . 
# copies all the files in the directory of the Dockerfile to the Docker image 
# best not to do this because can add unneeded files 

#run npm install
#install all dependencies 
RUN npm install

#tell the container which port to expose to the network 
EXPOSE $PORT

#
CMD npm start 
