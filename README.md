git clone https://github.com/akshay-goel-g/assignment.git

docker build -t image-name:version-name .

docker run -dt image-name

docker exec -it conatiner-name bash

/opt/kafka_2.12-2.5.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic number

bash /opt/assignment/go-redis-kafka-demo/start.sh
