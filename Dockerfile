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
    \
    && pip3 install --upgrade pip \
    \
    && pip3 install --quiet \
        boto3 \
        awscli \
    \
    && adduser -D -u ${PUID} -G ping -h /home/nonroot nonroot 

CMD [ "dockerd" ]
RUN docker --version \
    && docker buildx version \
    && docker-compose --version \
    && docker compose version \
    && aws --version 

USER nonroot
#CMD ["dockerd"]