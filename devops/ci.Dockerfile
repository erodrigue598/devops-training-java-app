FROM python:3.6-slim

# Instalar make
RUN apt-get update && \
    apt-get install -y --no-install-recommends make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.txt /tmp/requirements.txt

# Instalar dependencias del proyecto + herramientas de lint
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt flake8 mypy

WORKDIR /app
