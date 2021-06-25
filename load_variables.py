#!/bin/python
import json
from airflow.models import Variable
import glob
import os

print("Starting Variable Import")
file_list = glob.glob(f"{os.environ['AIRFLOW_HOME']}/config-global/*.json")
file_list.extend(glob.glob(f"{os.environ['AIRFLOW_HOME']}/config/*.json"))

print(f"{file_list}")
for file in file_list:
    with open(file) as _:
        value = json.dumps(json.load(_))
        key = file.split(".")[0].split("/")[-1]
        print(f"Load Variable Key: {key} Value: {value}")
        Variable.set(key, value)
