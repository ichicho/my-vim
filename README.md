# my-vim

## Dockerfile instruction
### Build Image
```
docker build -t my-vim:torch --no-cache -f ./docker/Dockerfile .
```
If DNS of image doesn't work, add `--network host` option to `docker build` command.

### Start Container
```
docker run --runtime=nvidia -d -p 18888:8888 --name my-vim --rm my-vim:torch
```

### Run Bash in Container
```
docker exec -it my-vim /bin/bash`
```

### Run Jupyter in Container
```
docker exec -d my-vim /bin/bash -c "jupyter lab --notebook-dir=/home/vimmer/project --ip=0.0.0.0 --no-browser
```

## Appendix
### Split a file
```
split --bytes=3G image.tar splited_file
```

### Join files
```
cat splited_file* > image.tar
```

### Save image
```
docker save --output image.tar image_tag
```

### Load image
```
docker load --input image.tar
```

