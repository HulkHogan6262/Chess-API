FROM python:3.13.5-alpine3.22

RUN apk add stockfish --repository=http://dl-cdn.alpinelinux.org/edge/testing

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

ENV STOCKFISH_PATH='/usr/bin/stockfish'
ENV PORT=8000
ENV HOST=0.0.0.0

ENV UVICORN_PORT=$PORT
ENV UVICORN_HOST=$HOST

EXPOSE $PORT

CMD ["uvicorn", "main:app"]