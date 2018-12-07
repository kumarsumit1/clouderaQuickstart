# Docker Cloudera Quickstart

docker run -i -t -h quickstart.cloudera -p 2181:2181 -p 9092:9092 -p 7180:7180 -p 22:22 --name cm6 --entrypoint /bin/bash kumarsumit1/clouderaquickstart 



kumarsumit1/clouderaquickstart




---------------------------  Image from cloudera setup  ---------------------------------

docker pull cloudera/quickstart

docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 8888:8888 -p 80:80 -p 7180:7180 -p 22:22 cloudera/quickstart /usr/bin/docker-quickstart




------------------------------------------------------------------------

docker run -i -t -h node.monocluster.com -p 2181:2181 -p 9092:9092 -p 8080:8080 --name amb1 --entrypoint /bin/bash kumarsumit1/dockerambari 

docker run -i -t -h node.monocluster.com -p 2181:2181 -p 9092:9092 -p 8080:8080 --name amb ambari /bin/bash

docker run -i -t --network=host ubuntu:16.04 /bin/bash


docker run -i -t --network=host ubuntu:16.04 /bin/bash


docker exec -it --privileged=true ubuntu:16.04 /bin/bash

docker exec -it --privileged=true amb1 /bin/bash



To use the default PostgreSQL database, named ambari, with the default username and password (ambari/bigdata)


apt-get install libpostgresql-jdbc-java

ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql.jar



psql -U ambari -h 127.0.0.1 ambari