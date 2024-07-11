#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# the line below seems to work
# npx forever start --uid test -a --killSignal SIGTERM --minUptime 2000 -l ${SCRIPT_DIR}/.forever/test.log --pidFile ${SCRIPT_DIR}/.forever/index.js.pid src/index.js
# the line below seems to cause forever stopall to get stuck
npx forever start --uid test -a --killSignal SIGTERM --minUptime 2000 --spinSleepTime 10000 -l ${SCRIPT_DIR}/.forever/test.log --pidFile ${SCRIPT_DIR}/.forever/index.js.pid src/index.js

npx forever list

tail -f ${SCRIPT_DIR}/.forever/test.log &

sleep 5

npx forever stopall &
stopall_pid=$!
echo ${stopall_pid} > stopall.pid
echo "forever stopall pid: ${stopall_pid}"
wait $stopall_pid