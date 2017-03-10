FROM joshes/docker-jenkins

# Install dotnet
# https://github.com/dotnet/dotnet-docker/blob/master/1.0/debian/sdk/Dockerfile
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libcurl3 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu52 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        libunwind8 \
        libuuid1 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

# Install .NET Core SDK
ENV DOTNET_SDK_VERSION 1.0.1
ENV DOTNET_SDK_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-dev-debian-x64.$DOTNET_SDK_VERSION.tar.gz

RUN curl -SL $DOTNET_SDK_DOWNLOAD_URL --output dotnet.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Trigger the population of the local package cache
ENV NUGET_XMLDOC_MODE skip
RUN mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch

# Install mono + nuget
RUN sudo apt-get -qq update && \
    sudo apt-get -qq install -y \
        mono-devel \
        nuget

# Upgrade nuget
RUN (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://nuget.org && \
    (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://go.microsoft.com && \
    (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://nugetgallery.blob.core.windows.net && \
    nuget update -self

# Grab the ca-certificates package
# Fixes: https://github.com/travis-ci/travis-ci/issues/7010 (Not specific to travis-ci)
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list && \
    sudo apt-get update && \
    sudo apt-get install -y ca-certificates-mono