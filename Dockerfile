FROM debian:bullseye

ARG TERRAFORM_VERSION="1.4.0"

LABEL org.opencontainers.artifact.description="Ansible and Terraform combined in a single docker image"
LABEL org.opencontainers.image.source="https://github.com/mmafshari77/fautomation"
LABEL terraform_version=${TERRAFORM_VERSION}
# LABEL ansible_version=${ANSIBLE_VERSION}

ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}


RUN apt-get update \
    && apt-get install -y ansible curl unzip  \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.zip