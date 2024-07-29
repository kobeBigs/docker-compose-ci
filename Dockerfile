FROM docker:latest

ARG PUID=1000
RUN apk add --no-cache \
        bash \
        curl \
        wget \
        jq \
        git \
        make \
        rsync \
        python3 \
        py3-pip \
        libffi-dev \
        openssl-dev \
        openssh-client \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install --quiet \
        boto3 \
        awscli \
    && adduser -D -u ${PUID} -G ping -h /home/nonroot nonroot 

ENV PATH="/opt/venv/bin:$PATH"

CMD [ "dockerd" ]
RUN docker --version \
    && docker buildx version \
    && docker-compose --version \
    && docker compose version \
    && aws --version 

USER nonroot