#!/bin/bash
#PASSWORD=${1:-oracle}

unzip -o /files/ords-19.2.0.199.1647.zip -d /u01/ords

sed -i -E 's:oracle:'$PASSWORD':g' /scripts/ords_unlock_account.sql
sqlplus -S sys/$PASSWORD@XE as sysdba @/scripts/ords_unlock_account.sql < /dev/null

sed -i -E 's:oracle:'$PASSWORD':g' /scripts/ords_params.properties
cp -rf /scripts/ords_params.properties /u01/ords/params
cd /u01/ords
java -jar ords.war configdir /u01
java -jar ords.war install simple

# solution for the problem with timezone
#dpkg-reconfigure tzdata
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

cp -rf /u01/ords/ords.war /tomcat/webapps/
cp -rf /u01/app/oracle/apex/images /tomcat/webapps/i
