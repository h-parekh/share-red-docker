# share-red-docker
A repository to run node-red in Docker for share-research customizations

## Project Layout

This repository contains Dockerfile to build the share-red Docker image.

Build these images with the following command...

        $ docker build -f <version>/Dockerfile -t mynodered:<version> .

### package.json

The package.json is a metafile that downloads and installs the required version
of Node-RED and any other npms you wish to install at build time. During the
Docker build process, the dependencies are installed under `/usr/src/node-red`.

The main sections to modify are:
#### Upgrading node-red and adding dependencies
```console
"dependencies": {
    "node-red": "0.20.x",       <-- set the version of Node-RED here
    "node-red-node-rbe": "*"    <-- any extra npm packages you want installed and built into the image by default
  }
```

#### Start script
This is the command that starts Node-RED when the container is run.
```console
"scripts": {
    "start": "node $NODE_OPTIONS node packages/node_modules/node-red/red.js"
}
```
## Starting an instance
To run this directly in docker at it's simplest just run
```console
    docker run -it -p 1880:1880 --name <a-container-name> mynodered:<version>
```

## Load a project from github (WIP - script needs parameterization)
```console
    docker exec -d <a-container-name> ./node-red-projects.sh
```
