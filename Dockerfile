FROM python:3.7.3-stretch

RUN apt install gcc git

RUN pip install --upgrade pip

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir pyarrow
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir aioredis
RUN pip install --no-cache-dir boto3
# RUN pip install --no-cache-dir arctic
RUN pip install --no-cache-dir git+https://github.com/manahl/arctic.git
RUN pip install --no-cache-dir git+https://github.com/bmoscon/cryptofeed.git

## Add any extra dependencies you might have
# eg RUN pip install --no-cache-dir boto3

COPY config-docker.yaml /config.yaml
COPY setup.py /
COPY cryptostore /cryptostore

## Add any keys, config files, etc needed here
# COPY access-key.json /

RUN pip install -e .

ENTRYPOINT [ "cryptostore" ]
