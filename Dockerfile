FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /app
VOLUME [ "/app" ]
COPY requirements.txt ./
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN adduser -D user
USER user
CMD [ "python", "/app/start.py" ]
