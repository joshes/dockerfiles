# joshes/dotnet

Extension to the base Microsoft Dotnet image that includes Mono/Nuget as well.

Building:

```
docker build -t joshes/dotnet:latest .
```

Usage:

```
# Use Nuget
docker run --rm joshes/dotnet:latest nuget restore

# Use Dotnet
docker run --rm joshes/dotnet:latest dotnet restore
```
