#!/usr/bin/env bash

set -e

cd util;                                              gradle --daemon --parallel clean build publishToMavenLocal; cd -

cd microservices/core/product-service;                gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/core/recommendation-service;         gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/core/review-service;                 gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/composite/product-composite-service; gradle --daemon --parallel clean build buildDockerImage; cd -

cd microservices/support/auth-server;                 gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/support/config-server;               gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/support/discovery-server;            gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/support/edge-server;                 gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/support/monitor-dashboard;           gradle --daemon --parallel clean build buildDockerImage; cd -
cd microservices/support/turbine;                     gradle --daemon --parallel clean build buildDockerImage; cd -

find . -name *SNAPSHOT.jar -exec du -h {} \;