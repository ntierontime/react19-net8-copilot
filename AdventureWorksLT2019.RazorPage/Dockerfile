# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["AdventureWorksLT2019.RazorPage/AdventureWorksLT2019.RazorPage.csproj", "AdventureWorksLT2019.RazorPage/"]
COPY ["AdventureWorksLT2019.Services/AdventureWorksLT2019.Services.csproj", "AdventureWorksLT2019.Services/"]
COPY ["AdventureWorksLT2019.ServiceInterfaces/AdventureWorksLT2019.ServiceInterfaces.csproj", "AdventureWorksLT2019.ServiceInterfaces/"]
COPY ["AdventureWorksLT2019.Models/AdventureWorksLT2019.Models.csproj", "AdventureWorksLT2019.Models/"]
COPY ["AdventureWorksLT2019.MSSqlRepositories/AdventureWorksLT2019.MSSqlRepositories.csproj", "AdventureWorksLT2019.MSSqlRepositories/"]
COPY ["AdventureWorksLT2019.RepositoriesInterfaces/AdventureWorksLT2019.RepositoriesInterfaces.csproj", "AdventureWorksLT2019.RepositoriesInterfaces/"]
COPY ["AdventureWorksLT2019.Utilities/AdventureWorksLT2019.Utilities.csproj", "AdventureWorksLT2019.Utilities/"]
COPY ["AdventureWorksLT2019.Shared/AdventureWorksLT2019.Shared.csproj", "AdventureWorksLT2019.Shared/"]
RUN dotnet restore "./AdventureWorksLT2019.RazorPage/AdventureWorksLT2019.RazorPage.csproj"
COPY . .
WORKDIR "/src/AdventureWorksLT2019.RazorPage"
RUN dotnet build "./AdventureWorksLT2019.RazorPage.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./AdventureWorksLT2019.RazorPage.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AdventureWorksLT2019.RazorPage.dll"]