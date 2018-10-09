#stage 0
FROM microsoft/aspnetcore-build
COPY . /app
WORKDIR /app
CMD ["dotnet","run"]
