#!/bin/bash

# Path to the HAProxy configuration file
HAPROXY_CFG="/etc/haproxy/haproxy.cfg"

# Switch HTTP backend group
if grep -q "default_backend container_group_01" "$HAPROXY_CFG"; then
    sudo sed -i 's/default_backend container_group_01/default_backend container_group_02/' "$HAPROXY_CFG"
    echo "Switched to container_group_02"
else
    sudo sed -i 's/default_backend container_group_02/default_backend container_group_01/' "$HAPROXY_CFG"
    echo "Switched to container_group_01"
fi

# Switch TCP backend group
if grep -q "default_backend tcp_container_group_02" "$HAPROXY_CFG"; then
    sudo sed -i 's/default_backend tcp_container_group_02/default_backend tcp_container_group_01/' "$HAPROXY_CFG"
    echo "Switched to tcp_container_group_01"
else
    sudo sed -i 's/default_backend tcp_container_group_01/default_backend tcp_container_group_02/' "$HAPROXY_CFG"
    echo "Switched to tcp_container_group_02"
fi

# Reload HAProxy to apply the changes
sudo systemctl reload haproxy