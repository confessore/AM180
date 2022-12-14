#!/bin/sh

read -p "please enter the postgres user : " postgresUser
read -p "please enter the postgres password : " postgresPassword
read -p "please enter the azure appconfig connection string : " appConfig

if [ "$(dirname $0)" = "." ]
then
    mkdir -p ../secrets
    cd ../secrets
else
    parent=$(dirname $(dirname "$0"))
    mkdir -p "$parent"/secrets
    cd "$parent"/secrets
fi

echo "generating secrets..."
echo "$postgresUser" > postgres-user
echo "$postgresPassword" > postgres-password
echo "$appConfig" > azure-appconfig
echo "secrets generated!"
