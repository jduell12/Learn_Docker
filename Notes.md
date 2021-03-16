# What is Docker
- Docker exists to address the issues of organizing the packages for an application and deploying it to a server
- Docker bundles runtime dependencies with application source code into an image 
    - creates a unified experience no matter where the application is being run

# Writing Dockerfile
- used to build a Docker image 
- plan-text file that contains a series of instructions that tells Docker what operating system, application dependencies and application source code is required to run the application
- docker image is a static artifact that is built from a Dockerfile and is tagged and publisehd to a registry where it can be shared 
- docker container is running an instance of a Docker image 

- From node:15 
    - run node application
- set up arg for port and environment variable port 
- set up a directory for the docker container 
- set up files to add in the base directory 
- run npm install to download dependencies
- expose the port in docker 
- start the application 

# Build and Run an image
- now that dockerfile is defined run docker build command in the terminal
    ```docker build -t my-node-image:v1 . ```
        - -t specifies what to call the image 
        - can sepcify the version with :v1 
            - if left blank docker with add a latest to the image 

- see list of docker images 
    ```docker image ls```

- create parent iamge 
    - create parent file by running command in terminal
    ```echo "FROM node:15" > Dockerfile.parent```

- update the dockerfile by replacing the first line from ```FROM node:15``` to ```FROM my-parent-image```

- rebuild image with new tag 
    ```docker build -t my-image:15 .```

- verify that the version 15 is being used 
    ```docker inspect my-image:13 | grep NODE_VERSION```

- run docker image 
```docker run --name my-container -p 8000:8000 -d my-node-image``

- see docker containers 
```docker ps```

# Docker commands to run an image
- build an image 
    - use -t tag to specific which image name and version 
```docker build -t my-node-app:latest .```
- check list of images on docker
```docker image ls```
- run a docker image
    - name tag specifies which container name we are running
    - p tag specific which port our local computer will run the docker application port
    - d tag specifies to run the image as detached 
    - naming the specific docker image and version to run
```docker run --name my-container -p 8000:8000 -d my-node-app:latest```
- check list of all running containers with docker
```docker ps``
- check log for a particular docker container that is running
    - my-container is the name of the docker container that we are running and wanting to look at their logs 
```docker logs my-container```
- stop running a container 
```docker rm -f my-container```

# Volumes and local development 
- volumes provide a persistent storage mechanism on Docker 
    - when a change is made to the code it is made to the server so you don't have to keep removing and re-running the container after each change 

# Docker Volume Commands
- use volumes with a docker container 
    - use the v flag to notify Docker using volumes
    - make the local directory source folder to the app's source folder
        - allows nodemon to detech the changes on the local computer in order the change the code in the docker container
```docker run --name my-container -p 8000:8000 -d -v $PWD/src:/app/src my-node-app:latest ```

# Production Readiness
- the base node package is very large and can be slimmed down using docker image variants 
    - dockerhub will have list of the current supported images and their various image variants 
- use multi-staged builds to build image in different ways depending if it's in development or production
    - multiple FROM statements in Dockerfile
    - can define multiple layers to run the app with
    - use the base image to build other layers onto the application

# Docker Production Readiness Commands
- get image variants from docker
```docker pull node:15-alpine```
- compare the docker image sizes 
    - node specifies which image and the variabnts we want to see 
```docker image ls node```
- run production image only (base image)
    - specify which image to run by the name and target
``` docker build -t my-node-app:prod --target=prod .```
- run dev image only (image build on prod)
```docker build -t my-node-app:dev --target=dev .  ```
# Docker Compose