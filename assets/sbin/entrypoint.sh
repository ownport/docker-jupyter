#!/usr/bin/env bash

set -eu

source /etc/profile.d/conda.sh

IP_ADDR=$(hostname -i)


if [ -e apk-packages.req ]; then
    echo '[INFO] Install additional Alpine packages' && \
	apk add --no-cache $(cat apk-packages.req) 
fi

if [ -e conda-packages.req ]; then
    echo '[INFO] Install additional Conda packages' && \
	conda install --yes --file conda-packages.req
fi


USER_ID=${HOST_USERID:=}
GROUP_ID=${HOST_GROUPID:=}

if [ ! -z "${USER_ID}" -a ! -z "${GROUP_ID}" ]; then
    PWD_LINE=$(grep -F "jupyter" /etc/passwd)
    FIELDS=( ${PWD_LINE//:/ } )
    USER_HOME=${FIELDS[5]}
    sed -i -e "s/^jupyter:\([^:]*\):[0-9]*:[0-9]*/jupyter:\1:${USER_ID}:${GROUP_ID}/"  /etc/passwd
    sed -i -e "s/^jupyter:\([^:]*\):[0-9]*/jupyter:\1:${GROUP_ID}/"  /etc/group
    chown -R ${USER_ID}:${GROUP_ID} ${USER_HOME}
fi

case ${1} in
    notebook:start)        
        echo "[INFO] Running Jupyter notebook"
        su -c "jupyter notebook --ip ${IP_ADDR}" -s /bin/bash jupyter
        ;;
    help)
        echo 'Available options:'
        echo ' notebook:start   - Jupyter Notebook start'
        echo ' help             - Displays the help'
        echo ' [command]        - Execute the specified command, eg. bash.'
        ;;
    *)
        exec "$@"
        ;;
esac 
