# OS
FROM ubuntu:16.04

# Hostname Help
ENV HOSTNAME quickstart.cloudera
#ADD set_host.sh /tmp/
#ADD startServices.sh /tmp/
#RUN chmod 777 /tmp/startServices.sh
#RUN sh /tmp/set_host.sh

# Download and install packages
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get -qq -y install apt-utils  ntp iputils-ping wget curl unzip sudo tar vim-tiny openssl ssh openssh-client

#Specifically to cloudera
RUN apt-get -y install apt-transport-https 
#RUN apt-get -y install grub 
#RUN apt-get -y install selinuxs


#RUN apt-get -qq -y install libmysql-java libpostgresql-jdbc-java

# MySQL
#ENV MYSQL_PWD kylo
#RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections
#RUN apt-get -y install mysql-server


#check/update services
RUN update-rc.d ntp defaults && \
service ntp start && \
service ssh start


RUN mkdir -p /opt/cm
RUN wget https://archive.cloudera.com/cm6/6.0.1/cloudera-manager-installer.bin -O /opt/cm/cloudera-manager-installer.bin
RUN chmod 777 /opt/cm/cloudera-manager-installer.bin


#Setup password less ssh
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P "" && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
chmod 600 ~/.ssh/authorized_keys
#RUN ssh -T -o "StrictHostKeyChecking no" root@localhost

# Install Ambari server


# Setup env
ENV JAVA_HOME /usr/jdk64/jdk1.8.0_112
ENV PATH $JAVA_HOME/bin:$PATH
WORKDIR /tmp

# External resources exposure
VOLUME /var/log
EXPOSE 7180

ENTRYPOINT ["/bin/sh"] 
#CMD ["ambari-server start"]