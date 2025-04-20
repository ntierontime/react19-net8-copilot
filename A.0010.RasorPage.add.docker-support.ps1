# Define the project directory
$projectPath = "AdventureWorksLT2019.RazorPage"

# Define the Dockerfile content
$dockerfileContent = @"
# Use the official .NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use the official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the main project file and restore dependencies
COPY ["$projectPath/$projectPath.csproj", "./"]
RUN dotnet restore "./$projectPath.csproj"

# Copy all referenced projects' files
COPY . .

# Build the main project and all referenced projects
WORKDIR "/src/$projectPath"
RUN dotnet build -c Release -o /app/build

# Publish the application, including referenced projects
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish

# Final stage: runtime
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "$projectPath.dll"]
"@

# Define the .dockerignore content
$dockerignoreContent = @"
bin/
obj/
*.user
*.vs
*.dbmdl
*.jfm
"@

# Create the Dockerfile
$dockerfilePath = Join-Path -Path $projectPath -ChildPath "Dockerfile"
Set-Content -Path $dockerfilePath -Value $dockerfileContent -Force
Write-Host "Dockerfile created at $dockerfilePath"

# Create the .dockerignore file
$dockerignorePath = Join-Path -Path $projectPath -ChildPath ".dockerignore"
Set-Content -Path $dockerignorePath -Value $dockerignoreContent -Force
Write-Host ".dockerignore created at $dockerignorePath"

Write-Host "Docker support with referenced projects has been added to the Razor Pages project."