FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2

RUN apt-get install -y php libapache2-mod-php mysql-server php-mysqli

RUN rm /var/www/html/index.html

COPY ./index.php /var/www/html

#Rajouter les scripts d'execution
ADD mysql-scripts/CreateDatabase.sql /docker-entrypoint-initdb.d/CreateDatabase.sql

ADD mysql-scripts/CreateTable.sql /docker-entrypoint-initdb.d/CreateTable.sql

ADD mysql-scripts/CreateUser.sql /docker-entrypoint-initdb.d/CreateUser.sql

ADD execute.sh /root/execute.sh

RUN chmod +x /root/execute.sh

ENTRYPOINT ["/root/execute.sh"]

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND

#CMD /bin/bash
