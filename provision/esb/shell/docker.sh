#!/bin/bash


curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo service docker start
docker run -d --name test-dev-am -p 9445:9443 massimodanieli/wso2apim 
docker run -d --name test-dev-ebs -p 9443:9443 massimodanieli/wso2esb 
docker run -d --name test-dev-dss -p 9444:9443 massimodanieli/wso2dss 
