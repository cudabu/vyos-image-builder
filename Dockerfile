FROM debian:buster-20220527
ADD run.sh /run.sh
RUN \
    echo "**** Installing packages ****" && \
    apt update \
    apt-get install -y \
        python3 \
        ansible \
        git && \
    rm -rf /var/lib/apt/lists/* && \
    echo "**** Setting Python3 as default and cloning repo ****" && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 2 \
    git clone https://github.com/vyos/vyos-vm-images /vyos-vm-images && \
    echo "**** Set permissions on run.sh ****" && \
    chmod +x /run.sh
VOLUME /output
ENTRYPOINT /run.sh