#!/usr/bin/env sh

set -eu

source /etc/profile.d/conda.sh

IP_ADDR=$(hostname -i)

if [ -e apk-requirements.txt ]; then
	apk add --no-cache $(cat apk-requirements.txt) 
fi

if [ -e py3-requirements.txt ]; then
	pip2 install -r py3-requirements.txt
fi

case ${1} in
    notebook:start)        
        echo "[INFO] Running Jupyter notebook"
        jupyter notebook --ip ${IP_ADDR}
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
