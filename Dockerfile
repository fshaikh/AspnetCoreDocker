# Stage 0 - Build
FROM microsoft/aspnetcore-build as builder
WORKDIR /publish
COPY aspnetcore.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish --output ./out

# Stage 1- PRod
FROM microsoft/aspnetcore
LABEL author="Furqan Shaikh"
WORKDIR /app
COPY --from=builder /publish/out .
ENTRYPOINT [ "dotnet","aspnetcore.dll" ]

