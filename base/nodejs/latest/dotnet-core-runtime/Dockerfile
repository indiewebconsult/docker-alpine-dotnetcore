### ASP.NET Core Runtime LATEST (includes full runtime and dependencies)
FROM indiewebconsult/nodejs:latest
WORKDIR /

# Version numbers are replaced by docker compose
ENV DOTNET_VERSION 2.2.3
ENV ASPNETCORE_VERSION 2.2.3
ENV URL https://dotnetcli.blob.core.windows.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-musl-x64.tar.gz
RUN apk add --no-cache \
    ca-certificates \
    curl \
    \
    # .NET Core dependencies
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    lttng-ust

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Set the invariant mode since icu_libs isn't included (see https://github.com/dotnet/announcements/issues/20)
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

# Install .NET Core
RUN curl https://dotnetcli.blob.core.windows.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-musl-x64.tar.gz -o dotnet.tar.gz \
    && dotnet_sha512='b11e8731dd2e6b8738fb3a2762ed90de08df6661a8720ed76ef9429b99d763d0913ee100042a2995d72a13b50394a7e357397cecb23402c3104075efda04f62b' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && rm -rf /usr/bin/dotnet \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz
