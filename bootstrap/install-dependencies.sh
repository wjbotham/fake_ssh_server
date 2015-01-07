#!/bin/bash

apt-get update
# apparently we already have openssh-server by default in this box
apt-get install openssh-server vim -y
CONFIG=/etc/ssh/sshd_config
echo "PasswordAuthentication no" >> $CONFIG
echo "AllowUsers openvas" >> $CONFIG

adduser --disabled-password --gecos "OpenVAS Local Security Checks" openvas

cd /home/openvas
if [ ! -d .ssh ]
then
  mkdir .ssh
  chown openvas:openvas .ssh 
fi

# this key's passphrase is `password`
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkrj7h2GrWQbkQKVDNZh3sYOdWeajPrzs+nyRdMhMPNCaljb3GSLFOzRyZ3S8pG6FqpEXwGDT8vSVUGj0L6c0sulrEskterpasy9bMajuOi4D/gz9fn9saWj5NkLZ4/D9oH2rMnbl+hsxaF1G4X9cTcIftvwU7QGPHloyvmIZreUnwwFAQdw15Lars3FnuZSDV6Qo4jb7VpFIwy3gm9/9pM/uNee/pRf0BOSn4MDa3qDZvOiqimFjWSOW+ZDS6VlVlwTQuyrSuWyX1CJSu0D/OEndOG4FUJy9vRkur2EBYr2jFhxyyYm0zPyTMbylzlFlhllaWnoBuPobYKRTv+xDz wesley@wesley-motion" > .ssh/authorized_keys
chown openvas:openvas .ssh/authorized_keys

chmod 500 .ssh
chmod 400 .ssh/authorized_keys

restart ssh
