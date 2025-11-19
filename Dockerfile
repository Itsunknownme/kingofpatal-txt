# Use Python 3.9 on slim-buster
FROM python:3.9.7-slim-buster

WORKDIR /app

# Point to archived Buster repositories and install dependencies
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    apt-get update -qq -o Acquire::Check-Valid-Until=false && \
    apt-get install -y --no-install-recommends \
        git \
        wget \
        pv \
        jq \
        python3-dev \
        ffmpeg \
        mediainfo && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Default command
CMD ["python3", "main.py"]
