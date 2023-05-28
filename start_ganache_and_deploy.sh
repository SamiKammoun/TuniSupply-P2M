#!/bin/bash

# Start Ganache CLI in the background and save its PID
ganache-cli --accounts 10 --gasLimit 6721975000 > /dev/null &
ganache_pid=$!

# Give Ganache CLI some time to start
sleep 5

# Deploy the contracts
npx truffle deploy --network develop

# Keep Ganache CLI running
wait "$ganache_pid"
