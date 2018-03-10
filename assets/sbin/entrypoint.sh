#!/usr/bin/env sh

set -eu

if [ -e apk-requirements.txt ]; then
	apk add --no-cache $(cat apk-requirements.txt) 
fi

if [ -e py3-requirements.txt ]; then
	pip2 install -r py3-requirements.txt
fi

case ${1} in
    app:start)        
        echo "[INFO] Running application in production mode"
        nginx && uwsgi --master --ini /etc/flask-app.ini
        ;;
    app:debug)        
        echo "[WARNING] Running application in debug mode"
        python3 /app/main.py
        ;;
    help)
        echo 'Available options:'
        echo ' app:start    - Application start'
        echo ' app:debug    - Application start in debug mode'
        echo ' help         - Displays the help'
        echo ' [command]    - Execute the specified command, eg. bash.'
        ;;
    *)
        exec "$@"
        ;;
esac 
