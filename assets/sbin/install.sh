#!/bin/bash

source /etc/profile.d/conda.sh

echo '[INFO] Creating jupyter user and group' && \
    addgroup -S jupyter && \
    adduser -S jupyter -G jupyter -g jupyter_user && \
    chown -R jupyter:jupyter /data

echo '[INFO] Install Jupyter' && \
    conda install --yes jupyter

echo '[INFO] Update scripts and configs' && \
    mv /tmp/assets/sbin/entrypoint.sh /sbin

echo "[INFO] Remove build deps and clear temp files" && \
    # apk del .build-deps && \
    rm -rf \
        /tmp/* \
        /opt/conda/pkgs/*


