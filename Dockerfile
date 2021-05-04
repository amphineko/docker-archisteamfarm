FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim

RUN set -ex \
    && apt-get update \
    && apt-get install -y curl tini unzip

WORKDIR /asf

RUN set -ex \
    && curl -fL --retry 3 https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.0.5.6/ASF-generic.zip -o ASF.zip \
    && unzip ASF.zip \
    && rm ASF.zip

ENTRYPOINT [ "/usr/bin/tini", "--" ]

CMD [ "/usr/bin/dotnet", "ArchiSteamFarm.dll" ]
