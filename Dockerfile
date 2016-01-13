FROM node:5

ENV NPM_CONFIG_LOGLEVEL warn

# Install gulp and bower
RUN npm install -g gulp bower node-sass phantomjs

# Clean everything
RUN npm config set tmp /root/.tmp && npm cache clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && npm cache clear

VOLUME  ["/opt/build"]
WORKDIR /opt/build

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
