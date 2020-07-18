FROM centos

RUN yum update -y
RUN yum install -y wget git java-1.8.0-openjdk-1.8.0.252.b09-3.el8_2 redis httpd

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk
ENV JRE_HOME=/usr/lib/jvm/jre

# Installing go

RUN wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
RUN tar -C /opt/ -xvf go1.13.4.linux-amd64.tar.gz
RUN mkdir -p /opt/go_projects/{bin,src,pkg}
ENV PATH=$PATH:/opt/go/bin
ENV GOPATH="/opt/go_projects"
ENV GOBIN="$GOPATH/bin"
ENV GOROOT=/opt/go
ENV PATH=$PATH:$GOROOT/bin
RUN yum install golang -y

# installing Kafka 

RUN wget https://mirrors.estointernet.in/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz 
RUN tar -C /opt/ -xvf kafka_2.12-2.5.0.tgz

RUN git clone https://gitlab.com/melwyn95/go-redis-kafka-demo.git  /opt/go-redis-kafka-demo

ENV REDIS_HOST="redis"
ENV REDIS_PORT="6379"
ENV REDIS_PASSWORD=""

ENV KAFKA_HOST="kafka"
ENV KAFKA_PORT="9092"
ENV KAFKA_TOPIC="number"
ENV KAFKA_CONSUMER_GROUP="numbers-group"

ENV HTTP_SERVER_PORT="8080"
ENV HTTP_SERVER_TIMEOUT="10000"

ENV GO111MODULE=on

# script to start kafka services

COPY kafka-init.sh /opt/
RUN chmod +x /opt/kafka-init.sh

CMD /opt/kafka-init.sh ; sleep infinity
