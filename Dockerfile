# Use Node.js LTS alpine version as base image
FROM node:lts-alpine

# Make a directory in the Docker container where our app will live
WORKDIR /usr/src/app

# Copy our app into that directory
COPY . /usr/src/app

# Install Ganache CLI and other dependencies
RUN npm install -g ganache-cli
RUN npm install
RUN cd client && npm install

# Give the script the right permissions
RUN chmod +x /usr/src/app/start_ganache_and_deploy.sh

# Run the script
RUN /usr/src/app/start_ganache_and_deploy.sh

# Expose port 3000 for the client application and 8545 for Ganache CLI
EXPOSE 3000 8545

# Start the client application
CMD cd client && npm start
