#!/bin/bash

CurrentPath=$(pwd)

xhost +

if [ "$1" == "eclipse" ]; then
	sudo docker run -P --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $CurrentPath/project:/root -v $CurrentPath/.ssh:/root/.ssh -v $CurrentPath/rose/edg4x-rose:/home/ROSE/BuildFolder/edg4x-rose development/dockerrosebuild  /bin/sh -c 'eclipse'
else
	sudo docker run -P  -t -i --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $CurrentPath/project:/root -v $CurrentPath/.ssh:/root/.ssh -v $CurrentPath/rose/edg4x-rose:/home/ROSE/BuildFolder/edg4x-rose development/dockerrosebuild  /bin/bash
fi

xhost -

