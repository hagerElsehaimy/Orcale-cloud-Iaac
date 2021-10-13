#! /bin/bash
sudo yum install -y nginx
sudo systemctl start nginx
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload