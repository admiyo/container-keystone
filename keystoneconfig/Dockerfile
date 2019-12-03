FROM docker.io/centos:7
MAINTAINER Adam Young <adam@younglogic.com>
 
RUN yum install -y centos-release-openstack-stein &&\
    yum update -y &&\
    yum -y install openstack-keystone mariadb openstack-utils  &&\
    yum -y clean all
 
COPY ./keystone-configure.sql /
COPY ./configure_keystone.sh /
CMD /configure_keystone.sh 10.89.0.4 3306
