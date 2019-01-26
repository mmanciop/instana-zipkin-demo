#!/bin/bash

pushd client-app
./mvnw clean package -DskipTests
popd

pushd server-app
./mvnw clean package -DskipTests
popd

docker-compose build
