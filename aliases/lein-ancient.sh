#!/bin/sh

SCRIPT="$(basename "$0")"

if [ "$1" = "upgrade" ]; then
    lein ancient upgrade :interactive
    exit 0
fi

if [ "$1" = "upgrade-clojure" ]; then
    lein ancient upgrade :check-clojure :interactive
    exit 0
fi

lein ancient
if [[ ($? -ne 0) || (`uname` -eq "Darwin") ]]; then
    echo "if you want to apply changes, use: ${SCRIPT} upgrade"
    echo "to upgrade clojure  use: ${SCRIPT} upgrade-clojure"
fi
