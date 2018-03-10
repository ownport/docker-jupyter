FROM ownport/miniconda:4.4.10

COPY assets/ /tmp/assets/

RUN echo '[INFO] Configure environment' && \
    /tmp/assets/sbin/install.sh 

# USER jupyter
WORKDIR /data        
ENTRYPOINT ["/sbin/entrypoint.sh"]
