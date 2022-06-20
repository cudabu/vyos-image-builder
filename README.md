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
docker run --rm \
    -v /mnt:/mnt \
    -v "$(pwd):/output" \
    --privileged \
    -e VYOS_CLOUD_INIT="true" \
    -e VYOS_GUEST_AGENT="qemu" \
    -e VYOS_DISK_SIZE="2" \
    -e VYOS_ENABLE_SSH="true" \
    -e VYOS_LATEST_FILENAME="vyos-1.4-latest.qcow2" \
    cudabu/cudabu:vyos-rolling
```

### Environment Variable breakdown
| Value | Description |
| ----- | ----------- |
| VYOS_CLOUD_INIT | Enable cloud init|
| VYOS_GUEST_AGENT | Install QEMU agent tools|
| VYOS_DISK_SIZE | Default is 10G |
| VYOS_ENABLE_SSH | Allow SSH to image after install |
| VYOS_LATEST_FILENAME | When image is complete this will be a static name to automate with Proxmox|

# Versions

* **20.06.22:** - Copy file at end to fixed name for further automation. Not using symbolic hardlinks due to lack of support in unRAID.
* **18.06.22:** - Pushed docker image to hub https://hub.docker.com/r/cudabu/cudabu
* **17.06.22:** - Initial version