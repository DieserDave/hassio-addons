FROM raffi1337/hetzner-dyndns AS wraped_image

#COPY --from=wraped_image /app/hetzner-ddns /hetzner-ddns
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
