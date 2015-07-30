#!/bin/sh

cd /home/vagrant

# Postgres Driver
FILE=postgresql-9.4-1201.jdbc41.jar

if [ -f $FILE ];
then
   echo "Postgresql jdbc driver already downloaded"
else
   wget https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc41.jar
fi

# Mysql Driver
FILE=mysql-connector-java-5.1.36.jar
  wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.36/mysql-connector-java-5.1.36.jar && echo "ANUBIIII"

