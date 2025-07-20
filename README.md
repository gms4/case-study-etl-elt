
# ETL/ELT Pipeline Project

This project implements an ETL (Extract, Transform, Load) and ELT (Extract, Load, Transform) pipeline for data processing. Below are the necessary steps to set up the environment and execute the pipelines.

## Environment Setup

### 1. Install Python
**Python** is a widely used programming language for data analysis. Before proceeding, ensure that Python is installed on your computer. You can download and install it from the official website:  
[https://www.python.org](https://www.python.org).

### 2. Install the Kaggle Library
Since the data cannot be downloaded directly via a browser, we use Python to automate the process. To do this, install the `kaggle` library using the following command:

```bash
pip install kaggle
```

### 3. Configure the Kaggle API
Kaggle requires an API key to allow downloading datasets without manually visiting the site. This key can be obtained by following the instructions in the official documentation:  
[https://www.kaggle.com/docs/api](https://www.kaggle.com/docs/api).

### 4. Install and Configure PostgreSQL
To store data in an organized manner and facilitate its manipulation, we use **PostgreSQL**, a relational database. You can download and install PostgreSQL from the official website:  
[https://www.postgresql.org](https://www.postgresql.org).

### 5. Install Jupyter Notebook
**Jupyter Notebook** is a tool that allows interactive coding and data analysis. To install it, use the following command:

```bash
pip install notebook
```

After installation, start Jupyter Notebook with:

```bash
jupyter notebook
```

This will open an interface in your browser where you can write and execute code interactively. You could also add Jupyter Notebook's extension to your VSCode and run the project locally.

### 6. Install and Configure dbt
**dbt** (Data Build Tool) is a tool used to transform and organize data within the database. It enables efficient data pipeline creation. To install dbt, use:

```bash
pip install dbt-core dbt-postgres
```

Detailed dbt configuration instructions can be found in the official documentation:  
[https://docs.getdbt.com](https://docs.getdbt.com).

### 7. Configure dbt to Connect to PostgreSQL

After installing dbt, you need to configure the connection to your PostgreSQL database using the `profiles.yml` file.

1. Locate or create the `profiles.yml` file:
   - **Linux/macOS:** `~/.dbt/profiles.yml`
   - **Windows:** `%USERPROFILE%\.dbt\profiles.yml`

2. Add the following configuration, replacing the placeholders with your own database credentials:

```yaml
my_dbt_project:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: your_username
      password: your_password
      port: 5432
      dbname: your_database
      schema: analytics
      threads: 4
```

3. To test your connection, run:

```bash
dbt debug
```

4. If you haven’t created your project yet, you can initialize one with:

```bash
dbt init my_dbt_project
```

This will create the standard folder structure for a dbt project.

---

## Running the Pipelines

### ETL Pipeline
To run the ETL Pipeline, follow these steps:

1. Execute the `estudo_de_caso_etl.ipynb` script.
2. Check the `analytics.etl_clean_fifa_model` table in the PostgreSQL database to see the processed data.

### ELT Pipeline
To run the ELT Pipeline, follow these steps:

1. Execute the `estudo_de_caso_elt.ipynb` script.
2. Navigate to the `my_dbt_project` directory.
3. Run the following command to run tests:
   ```bash
   dbt test
   ```
4. Run the following command to generate and visualize documentation:
   ```bash
   dbt docs generate && dbt docs serve
   ```
5. Run the following command to run the full project:
   ```bash
   dbt run
   ```
6. Check the `staging.staging_fifa_model_elt` table in the PostgreSQL database to see the raw data.
7. Check the `analytics.elt_clean_fifa_model` table in the PostgreSQL database to see the processed data.

---

## Final Considerations
This project demonstrates the implementation of ETL and ELT pipelines for data processing using tools such as Python, Kaggle, PostgreSQL, Jupyter Notebook, and dbt. Follow the steps above to set up your environment and execute the pipelines.
