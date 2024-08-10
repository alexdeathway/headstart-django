FROM certbot/certbot:v1.27.0

RUN apk --no-cache add gettext

COPY certify-init.sh /opt/
RUN chmod +x /opt/certify-init.sh

ENTRYPOINT ["/opt/certify-init.sh"]
