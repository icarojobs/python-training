# Obtém imagem docker levíssima, baseada em debian (slim) já com python 3.10.2
FROM python:3.10.2-slim

# Define variáveis de ambiente disponíveis na imagem docker
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1s
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100
ENV POETRY_VERSION=1.7.1
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_CACHE_DIR='/var/cache/pypoetry'

# Instala dependências do sistema
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    curl \
    gettext \
    git \
    libpq-dev \
    wget \
    # Cleaning cache:
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
    && pip install "poetry==$POETRY_VERSION" && poetry --version

# Copia arquivos do projeto para o container
COPY . .

# Altera o diretório de trabalho
WORKDIR /app

# Instala o Django dentro do container docker
RUN poetry add Django=5.0.2

# Comando para manter o container de pé.
CMD [ "tail", "-f", "/dev/null" ]