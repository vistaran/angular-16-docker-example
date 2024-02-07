## Requirements

- Docker Desktop for windows
- Docker for Ubuntu

## Steps

- Start docker desktop or docker daemon
- Clone the repo and run `docker build --pull --rm -f "Dockerfile" -t angularsample:latest "."` to build the docker image locally
- Once image is built then run `docker run --rm -d -p 80:80/tcp angularsample:latest` to run the project
