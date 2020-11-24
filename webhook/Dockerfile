FROM ubuntu

LABEL version="0.13.0"

WORKDIR /opt/webhook

COPY webhook.json .
COPY lagom .
COPY vue .

EXPOSE 80/tcp

RUN apt-get update && apt-get install -y apt-transport-https gnupg2 curl \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    apt-get update \
    apt-get install -y kubectl

RUN apt-get install webhook

CMD webhook -hooks webhook.json -verbose -port 80 -urlprefix ""