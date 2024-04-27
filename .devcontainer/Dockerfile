FROM mcr.microsoft.com/devcontainers/base:bookworm

COPY install.sh /
RUN /install.sh
ENV PATH="$PATH:/opt/sdk-manager/bin"
