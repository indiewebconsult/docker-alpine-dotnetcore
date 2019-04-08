# docker-alpine64-dotnetcore
Staged builder for Docker on Alpine x64, with images for 1) .Net Core Runtime, 2) Runtime with SDK, 3) ASP.NET Core (w/ Runtime and SDK) and 4) All with Nginx baked in for reverse proxy into your ASP.NET Core Web App.

This builder will generate a Docker image that can run a full build of a standalone ASP .NET Core 2.2 Web App. Runtime dependencies for using the full .NET Core SDK and `dotnet` cli are included in the .NET Core SDK Dockerfile.

The ASP.NET Core image builds with the full SDK and .NET Core runtime. It's not intended for standalone applications, and is considerably more bulky. Instead, the ASP.NET Core image can be used to build a standalone Web app with all required dependencies, including Nginx as a reverse proxy. 

The final stage of the build creates a Docker image named `indiewebcsonult/aspdotnetcore:{version}`.  This image allows you to build your solution down to a minimal x64 Alpine .Net Core Console or Web application without ever opening an install executable for the .Net Core platform (Runtime, SDK, ASP.NET, etc). Everything you need to build a self contained app is included. 

For more information about building a self contained app, visit [this MSDN blog article](https://blogs.msdn.microsoft.com/luisdem/2017/03/19/net-core-1-1-how-to-publish-a-self-contained-application/).

# Some helpful hints about this project's organization
* Compiled .Net Core versions are named in Docker Compose files for easy build maintenance, based on what .NET Core version your solution needs to target.
* build.sh builds all images without using Docker cache. This implements our most recent successful build of .Net Core in this project.
* By default, NodeJS 11.0, Python (v2) and Pip (v2) are packaged inside the base stage of the build.
* Dockerfiles for each build sequence are nested in the ./base directory
* We'll eventually get around to adding .Net Core v3.0 when it leaves preview.

# Example of how to use
To build the latest version of these images:
```shell
sh ./build.sh
```
or a custom version ...
```shell
sudo docker-compose -f docker-compose-r2.2.3_sdk2.2.202.yml build
```
To build your ASP .NET Core application:
```shell
sudo docker -v ./solution-folder:/app run indiewebconsult/aspdotnetcore:2.2.3-alpine-nginx dotnet build -o /app -r linux-musl-x64 -c Release 
```
