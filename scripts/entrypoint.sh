#!/usr/bin/env bash

airflow db migrate

airflow users create -r Admin -u admin -p admin -e admin@example.com -f admin -l airflow

airflow webserver
