#!/bin/bash
 
echo -n Database 
mysql -h 172.18.0.2  -P3306 -uroot --password=my-secret-pw < keystone-configure.sql
echo " [COMPLETE]"
 
echo -n "configuration "
openstack-config  --set  /etc/keystone/keystone.conf database connection mysql+pymysql://keystone:keystone@172.17.0.2/keystone
DATABASE_CONN=`openstack-config  --get  /etc/keystone/keystone.conf database connection `
echo $DATABASE_CONN
 
echo " [COMPLETE]"
 
echo -n "db-sync "
keystone-manage db_sync
echo " [COMPLETE]"
 
echo -n "bootstrap "
keystone-manage bootstrap --bootstrap-password=FreeIPA4All
echo " [COMPLETE]"
