ARG BUILD_FROM

FROM kutzilla/hetzner-ddns AS wraped_image

FROM $BUILD_FROM
COPY --from=wraped_image /app/hetzner-ddns /hetzner-ddns
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
