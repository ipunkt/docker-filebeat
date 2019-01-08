FROM docker.elastic.co/beats/filebeat:6.5.3

COPY filebeat.yml /var/filebeat.yml

COPY start.sh /usr/local/bin/start.sh

USER root

RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]

CMD ["-e"]

