#!/bin/sh

adduser testuser
echo "testuser:testuser"|chpasswd
echo "testuser" |  tee -a /etc/vsftpd.userlist
mkdir /home/testuser/ftp
chown nobody:nogroup /home/testuser/ftp
chmod a-w /home/testuser/ftp

mkdir /home/testuser/ftp/upload
chown testuser:testuser /home/testuser/ftp/upload
echo "vsftpd test file" | tee /home/testuser/ftp/upload/test.txt
rc-service vsftpd start
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random