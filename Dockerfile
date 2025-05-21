FROM apicurio/apicurio-registry:latest-release

COPY registry-export.zip /opt/apicurio/registry/data/artifact-data.zip

ENV QUARKUS_PROFILE=prod
ENV apicurio.import.url=file:///opt/apicurio/registry/data/artifact-data.zip
ENV apicurio.import.requireEmptyRegistry=true
