#!/bin/bash

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y python-pip
sudo apt-get install -y python-m2crypto
sudo apt-get install -y supervisor

export LC_ALL=C

pip install --upgrade pip
pip install setuptools
pip install shadowsocks

cat >>/etc/shadowsocks.json<<EOF
{
    "server": "0.0.0.0",
    "port_password": {
        "8381": "ps1",
        "8382": "ps2"
    },
    "timeout": 300,
    "method": "aes-256-cfb"
}
EOF

sudo ssserver -c /etc/shadowsocks.json -d start

# sed '/exit 0/i\ssserver -c /etc/shadowsocks.json -d start' -i /etc/rc.local

cat >>/etc/supervisor/conf.d/shadowsocks.conf<<EOF
[program:shadowsocks]
command=ssserver -c /etc/shadowsocks.json -d start
autostart=true
autorestart=true
user=root
log_stderr=true
logfile=/var/log/shadowsocks.log
EOF

sudo service supervisor start

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
sudo ./bbr.sh
