# README

This is a Docker image for [Regulatory Genomics Toolbox](https://www.regulatory-genomics.org/).
We use [Jupyter data science notebook](https://hub.docker.com/r/jupyter/datascience-notebook/dockerfile) as the base image and pip/conda installed the relevant packages.

## Build the Docker image
To build the Docker image, run the command

```
docker build .
```

For convenience, the Docker image can be found in [Dockerhub](https://hub.docker.com/r/yosuketanigawa/rgt).

To pull from Dockerhub, you can simply run:

```
docker pull yosuketanigawa/rgt
```

## Set up the reference dataset

```
mount_dir=@@@ # specify the directory that you'd like to mount for the analysis with RGT
rgtdata_dir=@@@ # specify the directory where you installed your local copy of the reference data for RGT
```

### Download the genomic reference data

```
docker run --rm -w /home/jovyan/rgtdata --user=$(id -u):$(id -g) -e NB_USER=jovyan -e NB_UID=$(id -u) -e NB_GID=$(id -g) --mount type=bind,src=${rgtdata_dir},dst=/home/jovyan/rgtdata yosuketanigawa/rgt python setupGenomicData.py --all
```

### Download the logo data

```
docker run --rm -w /home/jovyan/rgtdata --user=$(id -u):$(id -g) -e NB_USER=jovyan -e NB_UID=$(id -u) -e NB_GID=$(id -g) --mount type=bind,src=${rgtdata_dir},dst=/home/jovyan/rgtdata yosuketanigawa/rgt python setupLogoData.py --all
```

### Running motif analysis

```
docker run --rm -w $(readlink -f $(pwd)) --user=$(id -u):$(id -g) -e NB_USER=jovyan -e NB_UID=$(id -u) -e NB_GID=$(id -g) --mount type=bind,src=${mount_dir},dst=${mount_dir} --mount type=bind,src=${rgtdata_dir},dst=/home/jovyan/rgtdata yosuketanigawa/rgt rgt-motifanalysis
```

## Acknowledgement

[![Wold you buy me some coffee?](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/yosuketanigawa)
