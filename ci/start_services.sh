#!/bin/bash

echo 'starting config server......'
pushd configserver-jar
java -jar configserver*.jar &

until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8888 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done
popd
echo 'config server started!'

echo 'starting eureka server'
pushd eureka-jar
java -jar eureka*.jar &

until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8761 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done
popd
echo 'eureka server started!'

echo 'starting apigateway'
pushd apigateway-jar
java -jar apigateway*.jar &
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:9000 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done
popd
echo 'apigateway started!'

echo 'starting auth server'
pushd authserver-jar
java -jar authserver*.jar &
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:9999 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done
popd
echo 'auth server started!'

echo 'starting catalog server'
pushd catalog-jar
java -jar catalog*.jar &
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8080 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done
popd
echo 'catalog server started!'