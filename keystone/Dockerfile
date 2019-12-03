FROM index.docker.io/centos:7
MAINTAINER Adam Young <adam@younglogic.com>
 
RUN yum install -y centos-release-openstack-newton &&\
    yum update -y &&\
    yum -y install openstack-keystone httpd mariadb openstack-utils mod_wsgi &&\
    yum -y clean all
 
RUN openstack-config --set /etc/keystone/keystone.conf database connection mysql+pymysql://keystone:keystone@172.17.0.2/keystone &&\
    cp /usr/share/keystone/wsgi-keystone.conf /etc/httpd/conf.d
 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
 
CMD ["/run-httpd.sh"]