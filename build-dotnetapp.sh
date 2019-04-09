#! /bin/bash
# If we don't have .NET Core project samples, clone them down
if [ ! -d /samples ]; then
  mkdir samples
fi
if [ ! -d "samples/dotnetapp" ]; then
  git clone https://github.com/dotnet/dotnet-docker samples/dotnet-docker
  mv samples/dotnet-docker/samples/* samples/ 
  rm -rf samples/dotnet-docker
fi
sudo docker run --rm -ti -v $PWD/samples/dotnetapp:/app indiewebconsult/dotnetcore-sdk dotnet restore /app/dotnetapp
sudo docker run --rm -ti -v $PWD/samples/dotnetapp:/app indiewebconsult/dotnetcore-sdk dotnet build /app/dotnetapp -o /app/build -c Release 
