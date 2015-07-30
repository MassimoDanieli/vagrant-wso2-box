#!/bin/bash


curl -sSL https://get.docker.com/ | sh
sudo service docker start
docker run --rm --name test-dev-am -p 9445:9443 massimodanieli/wso2apim
docker run --rm --name test-andy -p 9443:9443 massimodanieli/wso2ebs
