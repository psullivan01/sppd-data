FROM python:3.7.3-alpine

RUN mkdir /app
ADD requirements.txt $EXTRA_REQUIREMENTS /app/
WORKDIR /app

ENV PATH=/opt/local/bin:$PATH \
	 PYTHONPATH=/app/ \
	 PYTHONUNBUFFERED=1
	 
RUN apk --no-cache add \
	 bash \
	 git \
	 curl \
	 python3 \
	 gcc \
	 python3-dev \
	 libffi-dev \
	 build-base \
	 py-pip && \
	 pip install --upgrade pip
	 
RUN pip install --no-cache-dir -r /app/${EXTRA_REQUIREMENTS:-requirements.txt}

ENV GUNICORN_CMD_ARGS=$GUNICORN_CMD_ARGS \
    APP_NAME=sppd-data

ADD . /app/

EXPOSE 5000

STOPSIGNAL SIGINT
