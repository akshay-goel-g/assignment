# script to start kafka  and start httpd server

/opt/kafka_2.12-2.5.0/bin/zookeeper-server-start.sh -daemon /opt/kafka_2.12-2.5.0/config/zookeeper.properties &
/opt/kafka_2.12-2.5.0/bin/kafka-server-start.sh /opt/kafka_2.12-2.5.0/config/server.properties &

/usr/sbin/httpd


