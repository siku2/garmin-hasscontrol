FROM mcr.microsoft.com/devcontainers/base:bookworm

COPY install-sdk.sh /
RUN sh /install-sdk.sh
ENV PATH="$PATH:/opt/sdk-manager/bin"
