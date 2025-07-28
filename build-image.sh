#!/bin/bash

uid=$(id -u)
username=$(id -un)
gid=$(id -g)


container_build_exec=("$@")
[[ ${#container_build_exec[@]} -eq 0 ]] && container_build_exec=(docker)

("${container_build_exec[@]}" build \
  --build-arg USERNAME=${username} \
  --build-arg UID=${uid} \
  --build-arg GID=${gid} \
  -t beets:local . )
