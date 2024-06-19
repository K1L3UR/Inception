FROM debian:bullseye

# Install nginx and vim
RUN apt update && apt upgrade && apt install -y nginx
RUN apt install -y vim
RUN apt install -y openssl

# Secure key then SSL certificat signed by myself
RUN mkdir -p /etc/nginx/ssl

# je n'arrive pas a chmod, je ne suis peut etre pas root quand je lance le container
# TEST CHMOD
#RUN touch test.txt
#RUN CHMOD 777 test.txt

#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#-out /etc/nginx/ssl/arnduran.crt \
#-keyout /etc/nginx/ssl/arnduran.key \
#-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=arnduran/CN=arnduran/"

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/arnduran.crt -keyout /etc/nginx/ssl/arnduran.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=arnduran.42.fr/UID=arnduran"
RUN mkdir -p /var/run/nginx

# Copy nginx base conf to my nginx conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
#RUN chmod 755 /var/www/htlm
#RUN chown -R www-data:www-data /var/www/htlm

# Port where were listening to
EXPOSE 443

# Start nginx permet de start nginx en arriere plan
#CMD ["nginx", "-g", "daemon off;"]