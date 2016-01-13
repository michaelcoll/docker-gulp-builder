FROM debian:jessie

# Update system libraries
RUN apt-get update && apt-get upgrade -y

# Build requirements
RUN apt-get install -y curl

# Environment variables
ENV NODE_VERSION 5.4.1
ENV NODE_PATH /usr/local/lib/node_modules/
ENV NPM_VERSION 3.5.3

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && npm install -g npm@"$NPM_VERSION"

RUN npm install -g gulp bower

# Clean everything
RUN npm config set tmp /root/.tmp && npm cache clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && npm cache clear

VOLUME  ["/opt/build"]
WORKDIR /opt/build

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
