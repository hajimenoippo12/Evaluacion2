echo "FROM ubuntu:22.04" > Dockerfile
   echo "RUN apt-get update && \
   apt-get install -y --no-install-recommends apache2 && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*" >> Dockerfile
   
   echo "COPY index.html /var/www/html/" >> Dockerfile
   echo "EXPOSE 80 " >> Dockerfile
   echo 'CMD ["apache2ctl", "-D", "FOREGROUND"]' >> Dockerfile
  
  docker build -t web2 .
  docker run -d -p 8888:80 --name web2 web2
  docker ps -a
