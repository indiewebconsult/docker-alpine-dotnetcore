### ASP.NET Environment with .NET Core 
FROM indiewebconsult/dotnetcore-sdk:latest
ARG aspenv="Development"
ENV ASPNETCORE_ENVIRONMENT $aspenv
ARG serverUrls="http://+:80"
ENV ASPNETCORE_URLS $serverUrls
# Install ASP.NET Core
# ASP .NET Core Version number is overridden by docker compose
ENV ASPNETCORE_VERSION 2.2.3

RUN apk add --update --no-cache --virtual .build-deps \
        openssl \
    && curl https://dotnetcli.blob.core.windows.net/dotnet/aspnetcore/Runtime/$ASPNETCORE_VERSION/aspnetcore-runtime-$ASPNETCORE_VERSION-linux-musl-x64.tar.gz -o aspnetcore.tar.gz\
    && aspnetcore_sha512='9d706c4916ef527ff93dbb2c7e774d6f0482e1d22a1a963fd7f13e7deaea8fd3ed754e46d104f9a921751fc83d1dcbd4e582591bb29966ec2a65903ca05a1b45' \
    && echo "$aspnetcore_sha512  aspnetcore.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && rm -rf /usr/bin/dotnet \
    && tar -zxf aspnetcore.tar.gz -C /usr/share/dotnet \
    && rm aspnetcore.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && apk del .build-deps

RUN apk add --update --no-cache libuv \
    && ln -s /usr/lib/libuv.so.1 /usr/lib/libuv.so \
    && mkdir /tmp/warmup \
    && cd /tmp/warmup \
    && dotnet new web --no-restore \
    && dotnet restore -p:RuntimeIdentifier=alpine.3.7-x64 \
        --source https://api.nuget.org/v3/index.json \
    && cd / \
    && rm -rf /tmp/warmup
EXPOSE 80