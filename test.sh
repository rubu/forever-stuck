#!/usr/bin/env bash

npx forever start --uid test -a --killSignal SIGTERM --minUptime 2000 --spinSleepTime 10000 src/index.js

npx forever list

tail -f ~/.forever/test.log &

sleep 5

npx forever stopall