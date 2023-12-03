#!/bin/sh
/etc/NX/nxserver --startup
sudo tail -f /usr/NX/var/log/nxserver.log
sudo tail -f /tmp/nxserver.log
