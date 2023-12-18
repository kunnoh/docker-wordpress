FROM wordpress:latest

ENV  WORDPRESS_DB_HOST: $WORDPRESS_DB_HOST
ENV  WORDPRESS_DB_USER: $WORDPRESS_DB_USER
ENV  WORDPRESS_DB_PASSWORD: $WORDPRESS_DB_PASSWORD

RUN mkdir -p /var/log/wordpress/
RUN chown -R wpress:wpress /var/log/wordpress/

CMD [ "wordpress" ]