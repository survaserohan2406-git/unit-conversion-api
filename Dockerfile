# Build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY global.json Directory.Build.props Directory.Packages.props ./
COPY src/UnitConversion.Domain/UnitConversion.Domain.csproj src/UnitConversion.Domain/
COPY src/UnitConversion.Api/UnitConversion.Api.csproj src/UnitConversion.Api/
RUN dotnet restore src/UnitConversion.Api
COPY src/ src/
RUN dotnet publish src/UnitConversion.Api -c Release -o /app --no-restore

# Run
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app .
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080
USER $APP_UID
ENTRYPOINT ["dotnet", "UnitConversion.Api.dll"]
