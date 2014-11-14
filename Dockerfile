FROM ubuntu:14.04
MAINTAINER david.siaw@mobingi.com

RUN apt-get update
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

RUN apt-get install -y apache2
RUN mkdir -p /var/lock/apache2 /var/run/apache2

RUN apt-get install -y python python-django python-pip libapache2-mod-passenger 
RUN apt-get install -y libapache2-mod-wsgi
RUN a2enmod rewrite
RUN a2enmod passenger

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY config /config

ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 22 80
CMD ["/run.sh"]
