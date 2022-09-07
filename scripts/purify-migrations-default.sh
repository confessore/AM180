#!/bin/sh

if [ "$(dirname $0)" = "." ]
then
    cd ../src/TheRightCareer
else
    parent=$(dirname $(dirname "$0"))
    cd "$parent"/src/TheRightCareer
fi
dotnet ef database drop --force --context DefaultDbContext
for file in ./migrations/*
do
	if [[ "$file" = *Global* || "$file" = *Designer* || "$file" = *Snapshot* ]]
	then
		continue
	fi
	dotnet ef migrations remove --context DefaultDbContext
done
dotnet ef migrations add init --context DefaultDbContext
