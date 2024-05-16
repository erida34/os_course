#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <PID> <signal>"
    echo "signal: 1 for SIGUSR1, 2 for SIGUSR2"
    exit 1
fi

PID=$1
SIGNAL=$2

if [ "$SIGNAL" -eq 1 ]; then
    kill -SIGUSR1 $PID
elif [ "$SIGNAL" -eq 2 ]; then
    kill -SIGUSR2 $PID
fi

echo "Signal sent to process $PID"