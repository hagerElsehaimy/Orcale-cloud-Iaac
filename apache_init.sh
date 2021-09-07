#! /bin/bash
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
sudo yum install -y nginx
sudo systemctl start nginx
