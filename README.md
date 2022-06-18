# VyOS image builder
This is a container release featuring:

* Build VyOS 1.4 latest build cloud-init QEMU image
* Completely automatic without a need to build from source

# Credits
This is build from https://github.com/vyos/vyos-vm-images

# Installation

## Dependencies
You need docker to make this work.

## Run the container

Change output directory if needed. Otherwise the qcow2 image and log will be outputed in project directory.

```bash
docker run -d --rm \
    -v /mnt:/mnt \
    -v "$(pwd):/output" \
    --privileged \
    -e VYOS_CLOUD_INIT="true" \
    -e VYOS_GUEST_AGENT="qemu" \
    -e VYOS_DISK_SIZE="2" \
    -e VYOS_ENABLE_SSH="true" \
    cudabu/cudabu:vyos-rolling

# Versions

* **18.06.22:** - Pushed docker image to hub https://hub.docker.com/repository/docker/cudabu/cudabu
* **17.06.22:** - Initial version