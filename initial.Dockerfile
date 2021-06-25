FROM astronomerinc/ap-airflow:1.10.10-4-buster

COPY requirements.txt requirements.txt
COPY load_variables.py /usr/local/airflow/load_variables.py

USER root
RUN pip install -r requirements.txt --no-cache-dir && \
    apt-get update && \
    apt-get install -y git awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 
USER astro
