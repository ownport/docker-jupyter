#!/bin/sh

source /etc/profile.d/conda.sh

echo '[INFO] Creating jupyter user' && \
    adduser -S jupyter

echo '[INFO] Install Jupyter' && \
    conda install jupyter

echo '[INFO] Update scripts and configs' && \
    mv /tmp/assets/sbin/entrypoint.sh /sbin

echo "[INFO] Remove build deps and clear temp files" && \
    # apk del .build-deps && \
    rm -rf \
        /tmp/* \
        /opt/conda/pkgs/*


