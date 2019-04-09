#! /bin/bash

# If we don't have .NET Core project samples, clone them down
if [ ! -d "samples/dotnet-docker" ]; then
  git clone https://github.com/dotnet/dotnet-docker samples/dotnet-docker
  mv samples/dotnet-docker/samples/* samples/ 
  rm -rf samples/dotnet-docker
fi

# Run builder
sudo docker-compose -f docker-compose-latest.yml build
