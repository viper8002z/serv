# Base image
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV XUI_PORT=54321

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget curl sudo lsb-release gnupg2 software-properties-common nginx iproute2 && \
    apt-get clean

# Install X-UI from working repository
RUN bash <(curl -Ls https://raw.githubusercontent.com/alireza0/x-ui/master/install.sh)

# Remove default Nginx site
RUN rm /etc/nginx/sites-enabled/default

# Copy Nginx config
COPY nginx/xui.conf /etc/nginx/sites-available/xui.conf
RUN ln -s /etc/nginx/sites-available/xui.conf /etc/nginx/sites-enabled/xui.conf

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Start services
CMD ["/start.sh"]
