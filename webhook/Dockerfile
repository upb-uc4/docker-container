FROM ubuntu

LABEL version="0.13.0"

WORKDIR /opt/webhook

EXPOSE 80/tcp

# Commons
RUN apt-get update && apt-get install -y apt-transport-https \
    gnupg2 \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
RUN gpasswd -a root docker

# Kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# Kind
RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
RUN chmod +x ./kind
RUN mv ./kind /usr/bin/kind

# Webhook
RUN apt-get install webhook

COPY start.sh .
COPY webhook.template.json .
COPY lagom lagom
COPY vue vue

RUN chmod -R +rwx /opt/webhook/vue
RUN chmod -R +rwx /opt/webhook/lagom

CMD bash ./start.sh
