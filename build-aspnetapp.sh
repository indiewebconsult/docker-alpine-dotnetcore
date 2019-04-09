#! /bin/bash
# If we don't have .NET Core project samples, clone them down
if [ ! -d /samples ]; then
  mkdir samples
fi
if [ ! -d "samples/dotnet-docker" ]; then
  git clone https://github.com/dotnet/dotnet-docker samples/dotnet-docker
  mv samples/dotnet-docker/samples/* samples/ 
  rm -rf samples/dotnet-docker
fi
sudo docker run --rm -ti -v $PWD/samples/aspnetapp/aspnetapp:/app indiewebconsult/aspdotnetcore dotnet restore

sudo docker run --rm -ti -v $PWD/samples/aspnetapp/aspnetapp:/app indiewebconsult/aspdotnetcore dotnet build /app -o /app/build -r linux-musl-x64 -c Release 
