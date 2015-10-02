#!/bin/bash
#
# Run some setup and start puppetserver

# set Java Ram in sysconfig script

cat << EOF > /etc/sysconfig/puppetserver
###########################################
# Init settings for puppetserver
###########################################

# Location of your Java binary (version 7 or higher)
JAVA_BIN="/usr/bin/java"

# Modify this if you'd like to change the memory allocation, enable JMX, etc
JAVA_ARGS="-Xms$PUPPETSERVER_JAVA_RAM -Xmx$PUPPETSERVER_JAVA_RAM -XX:MaxPermSize=256m"

# These normally shouldn't need to be edited if using OS packages
USER="$PUPPETSERVER_USER"
INSTALL_DIR="/usr/share/puppetserver"
CONFIG="/etc/puppetserver/conf.d"
BOOTSTRAP_CONFIG="/etc/puppetserver/bootstrap.cfg"
SERVICE_STOP_RETRIES=60

# START_TIMEOUT can be set here to alter the default startup timeout in
# seconds.  This is used in System-V style init scripts only, and will have no
# effect in systemd.
# START_TIMEOUT=120
EOF

cat << EOF > /etc/puppet/autosign.conf
$AUTOSIGN_DOMAIN
EOF

puppetserver foreground