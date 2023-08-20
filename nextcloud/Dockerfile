ARG BUILD_VERSION
FROM nextcloud:$BUILD_VERSION

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y jq smbclient \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache
 
RUN  sed -i "s|/var/www|/share/nextcloud|g" /etc/apache2/sites-enabled/000-default.conf \
  && sed -i "s|/var/www|/share/nextcloud|g" /etc/apache2/apache2.conf \
  && sed -i "s|/var/www|/share/nextcloud|g" /etc/apache2/conf-enabled/docker-php.conf \
  && sed -i "s|/var/www/html|/share/nextcloud/html|g" /entrypoint.sh \
  && sed -i "s|/var/www/html|/share/nextcloud/html|g" /usr/src/nextcloud/config/autoconfig.php \
  && sed -i "s|AllowOverride None|AllowOverride All|g" /etc/apache2/apache2.conf

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]
CMD ["apache2-foreground"]
