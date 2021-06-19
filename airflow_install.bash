#!/usr/bin/env bash
#
# Based on:
#    https://airflow.apache.org/docs/apache-airflow/stable/installation.html
#    https://airflow.apache.org/docs/apache-airflow/stable/start/local.html
#
#   "Airflow installation might be sometimes tricky because Airflow is a bit of
#  both a library and application. Libraries usually keep their dependencies 
#  open and applications usually pin them, but we should do neither and both at
#  the same time. We decided to keep our dependencies as open as possible (in 
#  setup.cfg and setup.py) so users can install different version of libraries 
#  if needed. This means that from time to time plain pip install apache-airflow
#  will not work or will produce unusable Airflow installation." --Airflow team
#
# Hence we will be pinning this install to Airflow 2.1.0 and the installed 
# Python3 version.  CHANGE THESE AS NECESSARY.

AIRFLOW_VERSION=2.1.0
PYTHON_VERSION="$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

# Install prerequisite packages first
sudo apt-get install -y --no-install-recommends \
        freetds-bin \
        krb5-user \
        ldap-utils \
        libffi6 \
        libsasl2-2 \
        libsasl2-modules \
        libssl1.1 \
        locales  \
        lsb-release \
        sasl2-bin \
        sqlite3 \
        unixodbc

# Python pip is required but not necessarily installed in Ubuntu server LTS
sudo apt install -y python3-pip

# It is also assumed you have a local private bin dir, we'll set that here but
# on Ubuntu LTS your should add this to your ~/.bashrc
#
# # set PATH so it includes user's private ~/.local/bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi

export PATH="$HOME/.local/bin:$PATH"

# Now we can do the pip install
pip install "apache-airflow[async,postgres,google]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

#
# Untested below here
#

# Setup the database, Postgres I believe
airflow db init

# Create the first user.  
# NOTE: This is interactive and asks for the password to be set, so it cannot be run unattended.
airflow users create \
    --username admin \
    --firstname Peter \
    --lastname Parker \
    --role Admin \
    --email spiderman@superhero.org

# start the web server, default port is 8080
airflow webserver -D --port 8080

# start the scheduler
# open a new terminal or else run webserver with ``-D`` option to run it as a daemon
airflow scheduler -D

# visit localhost:8080 in the browser and use the admin account you just
# created to login. Enable the example_bash_operator dag in the home page
