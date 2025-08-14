FROM alpine:latest

# Install wstunnel
RUN apk add --no-cache wget tar && \
    wget https://github.com/erebe/wstunnel/releases/download/v10.4.4/wstunnel_10.4.4_linux_amd64.tar.gz && \
    tar -xvzf wstunnel_10.4.4_linux_amd64.tar.gz && \
    mv wstunnel /usr/local/bin/wstunnel && \
    chmod +x /usr/local/bin/wstunnel && \
    rm -rf /var/cache/apk/* wstunnel_10.4.4_linux_amd64.tar.gz

# Render sets PORT environment variable
ENV PORT=10000

EXPOSE 10000

# Start wstunnel server
CMD ["sh", "-c", "wstunnel --server ws://0.0.0.0:$PORT"]
