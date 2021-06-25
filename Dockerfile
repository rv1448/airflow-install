# For a Debian-based image
FROM astronomerinc/ap-airflow:1.10.10-4-buster

COPY requirements.txt requirements.txt
COPY load_variables.py /usr/local/airflow/load_variables.py
USER root

RUN apt-get update && apt-get -y install libicu-dev libffi-dev && apt-get -y install gcc && \
    apt-get -y install gcc python-dev libc-dev libxml2-dev libxslt1-dev zlib1g-dev g++ && \
    apt-get -y install g++ && \
    apt-get -y install pkg-config libicu-dev && \
    pip install -r requirements.txt --no-cache-dir && \
    apt-get install -y git awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 
USER astro

# EXPOSE 8080
# CMD ["supervisord", "-c", "supervisord.conf"]
