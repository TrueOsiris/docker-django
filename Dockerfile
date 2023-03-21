FROM ubuntu:22.10
ENV PYTHONUNBUFFERED 1
WORKDIR /app
VOLUME [ "/app" ]
COPY requirements.txt ./
COPY start.sh /start.sh
COPY . .
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      vim \
      python3 \
      python3-pip \
      python3-venv \
      python3-dev \
      wget \
      default-libmysqlclient-dev \
      build-essential \
      apache2 \
      apache2-dev \
      apache2-utils \
      libapache2-mod-wsgi-py3 \
      php \
      libapache2-mod-php \
      logrotate \
      php-mysql && \
    apt-get clean && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x ./start.sh
EXPOSE 80
CMD [ "/start.sh" ]
