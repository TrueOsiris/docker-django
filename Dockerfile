FROM ubuntu:22.10
ENV PYTHONUNBUFFERED 1
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /app
VOLUME [ "/app" ]
COPY requirements.txt ./
COPY . .
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      python3 \
      python3-pip \
      python3-venv \
      apache2 \
      apache2-dev \
      apache2-utils \
      libapache2-mod-wsgi-py3 && \
    apt-get clean && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
#CMD [ "python", "/app/start.py" ]
