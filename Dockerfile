FROM node:4.4.5

# Install essentials
RUN apt-get update && apt-get install -y git

RUN npm set progress=false && \
    npm install --global --progress=false gulp bower && \
    echo '{ "allow_root": true }' > /root/.bowerrc

# Binary may be called nodejs instead of node
RUN ln -s /usr/bin/nodejs /usr/bin/node


COPY ./ /app/
WORKDIR /app/server
ADD package.json /
RUN npm install
CMD ["node","/app/server/server.js","&"]

#EXPOSE 2016
EXPOSE 3000
# EXPOSE 28015
#EXPOSE 35729
