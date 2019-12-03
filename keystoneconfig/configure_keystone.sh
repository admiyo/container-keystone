#!/bin/bash

MYSQL_HOST=$1
MYSQL_PORT=$2


echo -n Database 
mysql -h $MYSQL_HOST  -P$MYSQL_PORT -uroot --password=my-secret-pw < keystone-configure.sql
echo " [COMPLETE]"
 
echo -n "configuration "
openstack-config  --set  /etc/keystone/keystone.conf database connection mysql+pymysql://keystone:keystone@$MYSQL_HOST/keystone
DATABASE_CONN=`openstack-config  --get  /etc/keystone/keystone.conf database connection `
echo $DATABASE_CONN
 
echo " [COMPLETE]"
 
echo -n "db-sync "
keystone-manage db_sync
echo " [COMPLETE]"
 
echo -n "bootstrap "
keystone-manage bootstrap --bootstrap-password=FreeIPA4All
echo " [COMPLETE]"
