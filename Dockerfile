FROM ubuntu:18.04
USER root
WORKDIR /TLE

RUN apt-get update
RUN apt-get install -y git apt-utils sqlite3
RUN apt-get install -y python3.8
RUN python3.8 -m pip install poetry
RUN python3.8 -m poetry install

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libcairo2-dev libgirepository1.0-dev libpango1.0-dev pkg-config python3-dev gir1.2-pango-1.0 python3.8-venv libpython3.8-dev libjpeg-dev zlib1g-dev python3-pip


COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml


COPY . .

ENTRYPOINT ["/TLE/run.sh"]
