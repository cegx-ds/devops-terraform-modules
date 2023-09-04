FROM mcr.microsoft.com/devcontainers/base:debian-11

SHELL ["/bin/bash", "-c"]

ENV TERRAFORM_VERSION=1.5.2 \
    PYTHON_VERSION=3.11.1 \
    DEBIAN_FRONTEND=noninteractive \
    GCLOUD_CLI_VERSION=438.0.0 \
    PATH=$PATH:/usr/local/gcloud/google-cloud-sdk/bin \
    CLOUDSDK_CORE_DISABLE_PROMPTS=1 \
    TERRAFORM_DOCS_VERSION=v0.16.0

RUN sudo apt update && sudo apt install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    wget \
    libbz2-dev \
    yamllint \
    apt-transport-https \
    ca-certificates \
    gnupg \
    jq

# Install Python and awscli
RUN sudo apt install -y python3 \
    python3-pip \
    awscli && \
    apt autoremove -y && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then ARCH=arm64; fi && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip && sudo mv terraform /usr/local/bin && \
    sudo rm -f terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip

# Install Terraform docs
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then ARCH=arm64; fi && \
    curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/${TERRAFORM_DOCS_VERSION}/terraform-docs-${TERRAFORM_DOCS_VERSION}-$(uname)-${ARCH}.tar.gz && \
    tar -xzf terraform-docs.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/local/bin/terraform-docs && \
    rm -rf terraform-docs*

RUN mkdir -p /usr/local/gcloud && \ 
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GCLOUD_CLI_VERSION}-linux-x86_64.tar.gz && \
    tar -C /usr/local/gcloud -xf google-cloud-cli-${GCLOUD_CLI_VERSION}-linux-x86_64.tar.gz && \
    /usr/local/gcloud/google-cloud-sdk/install.sh && \
    rm -rf google-cloud*

# AWS CLI Tabcompletion
RUN complete -C $(which aws_completer) aws