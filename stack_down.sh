#!/bin/bash

for x in $(docker service ls | grep hadoop | awk '{print $1}'); do docker service rm $x; done
