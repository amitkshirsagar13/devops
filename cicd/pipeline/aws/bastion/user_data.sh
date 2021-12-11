#!/bin/bash
# add ssh key to authorized_keys at /tmp
echo ${ssh_pub_key} > /tmp/authorized_keys
# Move authorized_keys to user home's .ssh folder
sudo cp /tmp/authorized_keys /home/ec2-user/.ssh/
# Power off the machine, and let user take over
sudo shutdown --poweroff ${timeout}