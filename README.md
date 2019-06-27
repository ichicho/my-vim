# my-vim

## Dockerfile instruction
**_Caution: Container built from this Dockerfile is designed to run on a Linux machine._**

#### Build Image
Please build the docker image from root directory of the repository.(change directory to the repository in advance: `cd $PATH_TO_REPO`)

If you build the image and run the container on **same** machine, execute:
```
docker build -t my-vim -f ./docker/Dockerfile . \
       --build-arg user=$(id -un) \
       --build-arg uid=$(id -u) \
       --build-arg group=$(id -gn) \
       --build-arg gid=$(id -g)
```

If you build the image and run the container on **different** machine, please check user, uid, group, gid of the machine which will run the container later. And then replace `$USER`, `$UID`, `$GROUP`, `$GID` with them in following command and execute it:
```
docker build -t my-vim -f ./docker/Dockerfile . \
       --build-arg user=$USER \
       --build-arg uid=$UID \
       --build-arg group=$GROUP \
       --build-arg gid=$GID
```
If DNS of image doesn't work, add `--network host` option to `docker build` command.

#### Start Container
```
docker run --runtime=nvidia -d -p 18888:8888 --name my-vim --rm my-vim:torch
```

#### Run Bash in Container
```
docker exec -it my-vim /bin/bash
```

#### Run JupyterLab in Container
```
docker exec -d my-vim /bin/bash -c "jupyter lab --notebook-dir=/home/vimmer/project --ip=0.0.0.0 --no-browser"
```

### Docker Appendix
#### Split a file
```
split --bytes=3G image.tar splited_file
```

#### Join files
```
cat splited_file* > image.tar
```

#### Save image
```
docker save --output image.tar image_tag
```

#### Load image
```
docker load --input image.tar
```

