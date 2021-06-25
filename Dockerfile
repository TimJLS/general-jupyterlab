FROM timsu27/base-jupyterlab:1.0.1-python3.8

# Airflow
ENV AIRFLOW_DEPS="async,amazon,celery,cncf.kubernetes,docker,dask,elasticsearch,ftp,grpc,hashicorp,http,ldap,google,microsoft.azure,mysql,postgres,redis,sendgrid,sftp,slack,ssh,statsd,virtualenv"
ENV AIRFLOW_VERSION="2.1.0"
#ARG PYTHON_VERSION=$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)
ENV CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-3.8.txt"

USER root

RUN sudo -E apt-get install -y python3-dev default-libmysqlclient-dev build-essential libffi-dev gcc g++
RUN sudo -E apt-get install -y libsasl2-dev

RUN pip install "apache-airflow[apache.beam,apache.cassandra,apache.druid,apache.hdfs,apache.atlas,apache.webhdfs,apache.spark,apache.hive,apache.sqoop,tableau,microsoft.mssql,async,amazon,celery,cncf.kubernetes,docker,dask,elasticsearch,ftp,grpc,hashicorp,http,google,microsoft.azure,mysql,postgres,redis,sendgrid,sftp,slack,ssh,statsd,virtualenv]==2.1.0" \
    --constraint  "https://raw.githubusercontent.com/apache/airflow/constraints-2.1.0/constraints-3.8.txt"

USER maker
