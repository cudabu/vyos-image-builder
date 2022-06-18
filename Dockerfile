FROM debian:buster-20220527
RUN apt update
RUN apt-get update && apt-get install -y \
    python3 \
    ansible \
    git \
&& rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2
RUN git clone https://github.com/vyos/vyos-vm-images /vyos-vm-images
RUN mkdir /output
RUN touch /output/log
ADD run.sh run.sh
RUN chmod +x /run.sh
VOLUME /output
ENTRYPOINT /run.sh