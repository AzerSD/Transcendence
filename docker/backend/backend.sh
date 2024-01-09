#!/bin/bash


############################################
# python environment                       #
############################################
cd /app/backend

apt install python3.11-venv -y

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo 'source /app/backend/venv/bin/activate' >> /root/.bashrc

echo "alias migrate='python manage.py makemigrations && python manage.py migrate'" >> /root/.bashrc
echo "alias get='http --follow --timeout 6'" >> /root/.bashrc


############################################
# gunicorn server                          #
############################################
mkdir -pv /var/{log,run}/gunicorn/
gunicorn -c config/gunicorn/dev.py 


############################################
# nginx server                             #
############################################
apt install nginx -y
service nginx start
service nginx status

cp /app/docker/backend/config/nginx.conf /etc/nginx/nginx.conf
cp /app/docker/backend/config/backend.conf /etc/nginx/sites-available/backend

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout /etc/ssl/localhost.key -out /etc/ssl/localhost.pem -subj "/C=DE/CN=localhost"
openssl x509 -outform pem -in /etc/ssl/localhost.pem -out /etc/ssl/localhost.crt

cd /etc/nginx/sites-enabled
ln -s ../sites-available/backend .

service nginx restart
service nginx status

tail -f /var/log/gunicorn/dev.log




# todo:  
# oragnize structure: nginx.conf, sites-available.conf certs location
# check cors problem
# setup a firewall only 443 is allowd and 80 is redirected to 443
# change ip to environment variable
# check the redirect loop
# make it frontend compatible
# add a rebuild rule in makefile


