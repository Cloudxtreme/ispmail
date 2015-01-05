#!/bin/bash
#
# ISPmail Install Script for Ubuntu 14.04 LTS
#
# Based on https://workaround.org/book/export/html/447
# Created by Marcel Bischoff <https://github.com/herrbischoff>

# Update system
aptitude update && \
aptitude upgrade -y && \
aptitude dist-upgrade -y && \

# Install software
aptitude install ssh postfix postfix-mysql swaks mysql-server dovecot-mysql dovecot-pop3d dovecot-imapd dovecot-managesieved roundcube roundcube-plugins -y && \

# Generate self-signed certificate
openssl req -new -x509 -days 3650 -nodes -newkey rsa:4096 -out /etc/ssl/certs/mailserver.pem -keyout /etc/ssl/private/mailserver.pem && \

# Setup Apache for SSL
sed -i 's|/etc/ssl/certs/ssl-cert-snakeoil.pem|/etc/ssl/certs/mailserver.pem|' /etc/apache2/sites-available/default-ssl.conf && \
sed -i 's|/etc/ssl/private/ssl-cert-snakeoil.key|/etc/ssl/private/mailserver.pem|' /etc/apache2/sites-available/default-ssl.conf && \
a2ensite default-ssl && \
a2enmod ssl && \
service apache2 reload && \

# Setup database
mysql -u root -proot < db.sql && \

# Setup Postfix
cp mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf && \
postconf -e virtual_mailbox_domains=mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf && \

cp mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf && \
postconf -e virtual_mailbox_maps=mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf && \

cp mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf && \
postconf -e virtual_alias_maps=mysql:/etc/postfix/mysql-virtual-alias-maps.cf && \

# Check Postfix config
#echo "This should output '1':" && \
#postmap -q example.org mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf && \
echo "This should output '1':" && \
postmap -q john@example.org mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf && \
echo "This should output 'john@example.com':" && \
postmap -q jack@example.org mysql:/etc/postfix/mysql-virtual-alias-maps.cf && \

# Setup Dovecot
groupadd -g 5000 vmail && \
useradd -g vmail -u 5000 vmail -d /var/vmail -m && \
chown -R vmail:vmail /var/vmail && \
chmod u+w /var/vmail && \
cp -r conf.d /etc/dovecot
