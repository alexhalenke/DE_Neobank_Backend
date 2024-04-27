# Transactions ELT Pipeline for a Neobank
(This is the backend of our project. For accessing the frontend https://github.com/alexhalenke/DE_Neobank_Frontend)

## Table of Contents
- [Project Goal]
- [Set Up and Installation]
- [Usage]
- [Features]
- [Future improvements]
- [Code Example]
- [Credits]
  
  
## Project Goal

A neobank gathered data of 2.7 million transactions. In this project we create a ELT pipeline for the data to enable the use of data analytics and visualization. 
The engineering challenges are the following: 
  - Extracting the data from the different data sources (csv files)
  - Storing the data in a datalake and a data warehouse
  - Data modelling according to business requirements: This has been done with dbt through the creation of different layers (Bronze, Silver & Gold)
  - Orchestrate the transformations with Airflow
  - Connecting to an interactive Dashboard 
  - Connecting a LLM to the datawarehouse
  - Making the process scalable and auto scheduled


## Set Up and Installation

Steps to install your project:
  - git clone the project
  - create a .env file with: LAKE_BUCKET, POSTGRES_PASSWORD, DATASET, GCP_LOCATION, GCP_PROJECT_ID
  - create a datalake bucket to store data
  - "python de_neobank_backend/datalake/main_datalake.py" for uploading data into bucket
  - "python de_neobank_backend/pipeline/create_tables.py" for creating a dataset
  - "python de_neobank_backend/pipeline/upload_data.py" for uploading into the dataset
  - go into dbt folder and run "dbt run --target prod
   

## Usage

How to use your project:


## Features

![Neo Bank](https://github.com/alexhalenke/DE_Neobank_Backend/assets/109359407/e7967894-8103-4b58-a960-b8af83acca6e)
Technologies used: 
  - GCP, BigQuery, dbt, Airflow, Docker, Streamllit, OpenAI


## Future improvements 
  - inject .env with docker compose (https://docs.docker.com/compose/environment-variables/set-environment-variables/)
  - Own usage of OpenAI key
  - Terraform
  - CloudSQL
  - Orchestration of extract and load process
  - CI/CD pipeline
  - Build an API with different endpoints that trigger different dbt commands (https://medium.com/@ivan_toriya/step-by-step-guide-to-run-dbt-in-production-with-google-cloud-platform-fb1f035f3c7b)
    

## Credits  
Following persons have contributed to this project:
  - Enrico Dainelli
  - Ikechi Ochulo
  - Luiggi Navilys
  - Marlin Akhter
  - Alexander Halenke


## User Interface


