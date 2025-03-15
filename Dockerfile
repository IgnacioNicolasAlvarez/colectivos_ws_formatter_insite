FROM python:3.12-slim-bookworm

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    tzdata

# Configurar la zona horaria a Buenos Aires
ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Verificar la conexión a internet
RUN curl -fsSL https://www.google.com -o /dev/null || (echo "No internet connection" && exit 1)

# Añadir el instalador de uv
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Ejecutar el instalador de uv y eliminar el instalador
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Configurar el PATH
ENV PATH="/root/.local/bin/:$PATH"

# Añadir la aplicación al contenedor
ADD . /app

# Establecer el directorio de trabajo
WORKDIR /app

# Sincronizar dependencias
RUN uv sync --frozen


# Ejecutar el comando para iniciar la aplicación
CMD ["uv", "run", "main.py"]