#!/bin/bash
dnf install python3.13-pip -y
pip3.13 install ansible
ansible-pull -i localhost, -U https://github.com/Sandeepkumar0088/roboshop-ansible-roles-v2.git main.yml -e component=${component} -e env=${env} | tee /root/user_data.log