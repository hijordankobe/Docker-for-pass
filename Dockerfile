FROM ubuntu
EXPOSE 5244
WORKDIR /app

COPY config.json /app/data/config.json

RUN apt-get update && \
    apt install -y wget tar && \
    wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-amd64.tar.gz && \
    tar -xzvf alist-linux-amd64.tar.gz && \
    rm -f alist-linux-amd64.tar.gz && \
    chmod +x alist
    
CMD ["./alist", "server"]
