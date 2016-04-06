#!/bin/bash

CurrentPath=$(pwd)

#copy the ssh keys folder. we need to do this because a Dockerfile can add just files in the same root as the Dockerfile
sudo cp -r ~/.ssh ssh/

git clone https://github.com/naomilwx/fyp-arduino-code-transformer.git project/development/codeTransformer

#docker pull naomilwx/dockerrosebuild
docker build -t development/dockerrosebuild .

OUT=$?

if [ $OUT -ne 0 ]; then
	echo "This try has failed!"
	exit 1
else
	docker run -P -e --rm -v $CurrentPath/project:/root -v $CurrentPath/.ssh:/root/.ssh development/dockerrosebuild /bin/sh -c 'echo SUCCESS '
	exit 0
fi
