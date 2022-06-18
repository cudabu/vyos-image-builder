#! /bin/bash

SOURCE_DIR=/vyos-vm-images
OUTPUT_DIR=/output
LOGFILE=$OUTPUT_DIR/log
PLAYBOOK_FILE=$SOURCE_DIR/qemu.yml
HOST_FILE=$SOURCE_DIR/hosts

EXTRA_ARGS="-e cloud_init=$VYOS_CLOUD_INIT -e guest_agent=$VYOS_GUEST_AGENT -e disk_size=$VYOS_DISK_SIZE -e enable_ssh=$VYOS_ENABLE_SSH"

# execute ansible playbook to build qemu image
echo "Starting log" >> $LOGFILE
ansible-playbook $PLAYBOOK_FILE -i $HOST_FILE $EXTRA_ARGS >> $LOGFILE

# get the created file and save to $OUTPUT_DIR
VYOS_FILE=( /tmp/*.qcow2 )
echo "Copying $VYOS_FILE to $OUTPUT_DIR..." >> $LOGFILE
cp $VYOS_FILE $OUTPUT_DIR
echo "Copied $VYOS_FILE"  >> $LOGFILE

# End logging
echo "Ending log" >> $LOGFILE