#/bin/bash -x

systemctl start firewalld

firewall-cmd  \
    --add-port=111/tcp \
    --add-port=111/udp \
    --add-port=892/tcp \
    --add-port=892/udp \
    --add-port=875/tcp \
    --add-port=875/udp \
    --add-port=662/tcp \
    --add-port=662/udp \
    --add-port=32769/udp \
    --add-port=32803/tcp \
    --permanent

firewall-cmd --permanent \
	--add-service=nfs \
	--add-service=mountd \
	--add-service=rpc-bind

firewall-cmd --reload
echo "$ROLE"
if [ "$ROLE" == "master" ]; then
    mkdir -p /exports/data
    chown -R 36:36 /exports/data
    chmod 0755 /exports/data
    echo "/exports/data   *(rw)" > /etc/exports
    systemctl enable --now nfs.service
    systemctl enable --now nfs-server.service
    exportfs -a
    showmount -e
fi

