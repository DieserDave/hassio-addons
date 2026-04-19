ARG BUILD_FROM

FROM raffi1337/hetzner-dyndns AS wraped_image

FROM $BUILD_FROM
COPY --from=wraped_image /app/hetzner-ddns /hetzner-ddns
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
