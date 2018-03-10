# docker-jupyter

Docker image for Jupyter notebooks, Alpine bases

## How to build image
```sh
$ make build-image
```

## How to run Jupyter notebook
```sh
$ docker run -ti --rm --name jupyter-notebook ownport/jupyter:latest notebook:start
[INFO] Running Jupyter notebook
[I 09:43:02.981 NotebookApp] Writing notebook server cookie secret to /home/jupyter/.local/share/jupyter/runtime/notebook_cookie_secret
[I 09:43:03.221 NotebookApp] Serving notebooks from local directory: /data
[I 09:43:03.221 NotebookApp] 0 active kernels
[I 09:43:03.221 NotebookApp] The Jupyter Notebook is running at:
[I 09:43:03.221 NotebookApp] http://172.17.0.2:8888/?token=233e218539d8720dcd3d5ab50a06e4c8fe21dfb1324cd1c8
[I 09:43:03.221 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 09:43:03.221 NotebookApp] No web browser found: could not locate runnable browser.
[C 09:43:03.221 NotebookApp] 
    
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://172.17.0.2:8888/?token=233e218539d8720dcd3d5ab50a06e4c8fe21dfb1324cd1c8
```
to run bash session
```sh
docker run -ti --rm --name conda ownport/jupyter:latest /bin/bash
```
