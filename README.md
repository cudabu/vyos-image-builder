# Template for building vyOS and deploying to Proxmox
This is a container release featuring:

* Build VyOS 1.4 latest build cloud-init QEMU image
* Completely automatic without a need to build from source

## Installation

### Dependencies
You need docker to make this work.

### Build Docker Image
Start by building the docker image.

```
docker build -t vyos-image-builder:latest .
```

### Run Container

Change output directory if needed. Otherwise the qcow2 image and log will be outputed in project directory.

```
docker run -d --rm \
    -v /mnt:/mnt \
    -v "$(pwd):/output" \
    --privileged \
    -e VYOS_CLOUD_INIT="true" \
    -e VYOS_GUEST_AGENT="qemu" \
    -e VYOS_DISK_SIZE="2" \
    -e VYOS_ENABLE_SSH="true" \
    vyos-image-builder:latest
```