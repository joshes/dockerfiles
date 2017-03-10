FROM microsoft/dotnet:1.0-sdk

# Install mono + nuget
RUN apt-get -qq update && \
    apt-get -qq install -y \
        mono-devel \
        nuget

# Upgrade nuget
RUN (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://nuget.org && \
    (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://go.microsoft.com && \
    (echo "Yes\nYes\n" && cat) | certmgr -ssl -m https://nugetgallery.blob.core.windows.net && \
    nuget update -self

# Grab the ca-certificates package
# Fixes: https://github.com/travis-ci/travis-ci/issues/7010 (Not specific to travis-ci)
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
    apt-get update && \
    apt-get install -y ca-certificates-mono