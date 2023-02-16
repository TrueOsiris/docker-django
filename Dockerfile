FROM ubuntu:22.10
ENV PYTHONUNBUFFERED 1
WORKDIR /app
VOLUME [ "/app" ]
COPY requirements.txt ./
COPY . .
RUN apt-get update && \
    apt-get install -y \
      python3-pip \
      python3-venv \
      apache2 \
      apache2-dev \
      apache2-utils \
      libapache2-mod-wsgi && \
    apt-get clean && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
#CMD [ "python", "/app/start.py" ]
