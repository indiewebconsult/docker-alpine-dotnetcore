### ASP.NET Core SDK 2.1.300-preview1-008174
FROM jonmcquade/dotnetcore-runtime-sdk-node-python:dotnetcore-runtime
WORKDIR /sdk
ENV DOTNET_SDK_VERSION 2.1.300-preview1-008174
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT false
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
RUN apk add --update wget icu-libs ca-certificates 
RUN echo -e "\n\n\n...Installing .NET Core $DOTNET_SDK_VERSION ...\n\n\n" \
				&& apk add --no-cache --virtual .build-deps \
        && wget -O dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-alpine.3.6-x64.tar.gz \
        && dotnet_sha512='7705aebf88264a4a2e65c7fac29de92aa5e21d49709494d2e3242d89af6a65c1ae101f6b8e822c0a097b4d7d490cb76ee7c716f949101d5eed746f2c0f43097e' \
        && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
        && mkdir -p /usr/share/dotnet \
        && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
        && rm /usr/bin/dotnet \
        && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
        && rm dotnet.tar.gz \
        && apk del .build-deps
ENV NUGET_XMLDOC_MODE skip
CMD dotnet help 