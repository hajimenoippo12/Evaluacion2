FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY index.html /var/www/html/

# Cambiar Apache a puerto 8888 de forma segura
RUN sed -i 's/Listen 80/Listen 8888/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8888>/' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 8888

CMD ["apache2ctl", "-D", "FOREGROUND"]
