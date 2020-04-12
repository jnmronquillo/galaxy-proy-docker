# https://hub.docker.com/_/microsoft-dotnet-core
 # Stage 1
 FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder
 WORKDIR /source

 # caches restore result by copying csproj file separately
 COPY *.csproj .
 RUN dotnet restore

 # copies the rest of your code
 COPY . .
 RUN dotnet publish --output /app/ --configuration Release

 # Stage 2
 FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic
 WORKDIR /app
 ENTRYPOINT ["./proy-docker"]
 COPY --from=builder /app .