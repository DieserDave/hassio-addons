FROM raffi1337/hetzner-dyndns AS wraped_image

#COPY --from=wraped_image /App /App
COPY run.sh /run.sh
RUN chmod a+x /run.sh

#ENTRYPOINT [ "/run.sh" ]
CMD ["/run.sh"]
