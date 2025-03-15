FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    tzdata

ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


ADD https://astral.sh/uv/install.sh /uv-installer.sh


RUN sh /uv-installer.sh && rm /uv-installer.sh


ENV PATH="/root/.local/bin/:$PATH"


ADD . /app


WORKDIR /app


RUN uv sync --frozen


CMD ["uv", "run", "main.py"]