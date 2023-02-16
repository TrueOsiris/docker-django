FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /app
VOLUME [ "/app" ]
COPY requirements.txt ./
COPY . .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
CMD [ "python", "/app/start.py" ]
