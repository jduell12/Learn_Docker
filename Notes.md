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
# Volumes and local development 

# Production Readiness

# Docker Compose