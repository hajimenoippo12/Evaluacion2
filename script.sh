echo "FROM ubuntu:22.04" > Dockerfile
echo "RUN apt-get update && apt-get install -y --no-install-recommends apache2 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*" >> Dockerfile
echo "COPY index.html /var/www/html/" >> Dockerfile
echo "RUN sed -i 's/80/8888/g' /etc/apache2/ports.conf && sed -i 's/:80/:8888/g' /etc/apache2/sites-enabled/000-default.conf" >> Dockerfile
echo "EXPOSE 8888" >> Dockerfile
echo 'CMD ["apache2ctl", "-D", "FOREGROUND"]' >> Dockerfile
