#!/bin/bash

# Function to check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# Checking if Node.js is installed
if ! command_exists node; then
  echo "Node.js is not installed. Please install Node.js and run this script again."
  exit 1
fi

# Checking if npm is installed
if ! command_exists npm; then
  echo "npm is not installed. Please install npm and run this script again."
  exit 1
fi

# Checking if npx is installed
if ! command_exists npx; then
  echo "npx is not installed. Please install npx and run this script again."
  exit 1
fi

# Checking if ganache-cli is installed
if ! command_exists npx ganache-cli; then
  echo "ganache-cli is not installed. Please install ganache-cli globally using: npm i -g ganache-cli and run this script again."
  exit 1
fi

# Start ganache-cli
npx ganache-cli --accounts 10 --gasLimit 6721975000 &

# Install dependencies
npm install

# Deploy with truffle
npx truffle deploy --network develop

# Change to client directory
cd client

# Install client dependencies
npm install

# Start the client
npm start
