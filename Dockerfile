ARG NODE_VERSION=10.15.0
FROM node:${NODE_VERSION}

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red
RUN mkdir -p /usr/src/node-red/projects

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN useradd --home-dir /usr/src/node-red --no-create-home node-red \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install

# This command has to be run after npm install. It overwrites the settings.js with
#  share-research specific settings
COPY settings.js /usr/src/node-red
COPY bin/node-red-projects.sh /usr/src/node-red

# User configuration directory volume
EXPOSE 1880

CMD ["npm", "start", "--", "--userDir", "/usr/src/node-red"]
