FROM library/debian:stretch
MAINTAINER jaume@globalzitro.com
RUN apt-get update && \
    apt-get -y install libapache2-mod-php7.0 php-mysql php-gd &&\
    rm -rf /var/lib/dpkg /var/lib/apt /var/cache/apt /var/www/html/index.html && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log 

COPY index.html /var/www/html/
#ADD web.tgz /var/www/html
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
#CMD [ "8.8.8.8" ]
#EXPOSE 80
