FROM debian:bookworm

ARG TERRAFORM_VERSION=1.5.5-1 # last MPL-licensed version
ARG AWSCLI_VERSION=2.13.1

ARG USER_UID=1000 \
  USER_GID=1000 \
  USER_NAME=newredo

ADD hashicorp-archive-keyring.asc /etc/apt/keyrings/

RUN export DEBIAN_FRONTEND=noninteractive ARCH=$(dpkg --print-architecture) \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  git \
  groff-base \
  less \
  lsb-release \
  nano \
  openssh-client \
  unzip \
  && groupadd -o --gid ${USER_GID} ${USER_NAME} \
  && useradd -o --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USER_NAME} \
  # Terraform
  && echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.asc] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
  && apt-get update \
  && apt-get install terraform=${TERRAFORM_VERSION} \
  # AWS CLI
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-$(arch)-${AWSCLI_VERSION}.zip" -o "/tmp/awscliv2.zip" \
  && unzip -q /tmp/awscliv2.zip -d /tmp \
  && /tmp/aws/install \
  && rm -rf /tmp/aws /tmp/awscliv2.zip
