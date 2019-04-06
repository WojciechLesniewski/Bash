#!/bin/bash

function generate () {
for i in {1..350}; do
  BLOCK_COUNT=$(($RANDOM % 100 + 5))
  NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9-+=;:' | fold -w 16 | head -1)
  $(dd if=/dev/zero of=$NAME count=$BLOCK_COUNT bs=1000KB)
done

return 0
}

generate

exit $?
