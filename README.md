# Docker Cloudera Quickstart

docker run -i -t -h quickstart.cloudera -p 2181:2181 -p 9092:9092 -p 7180:7180 -p 22:22 --name cm6 --entrypoint /bin/bash kumarsumit1/clouderaquickstart 



kumarsumit1/clouderaquickstart




---------------------------  Image from cloudera setup  ---------------------------------

docker pull cloudera/quickstart

docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 8888:8888 -p 80:80 -p 7180:7180 -p 22:22 -p 8088:8088 -p 4040:4040 -p 4141:4141 -p 8042:8042 -p 18088:18088 --name cdh cloudera/quickstart /usr/bin/docker-quickstart


Useful services/ports:

    8888 Hue
    7180 Cloudera Manager
    80 Tutorial
    8983 SolR
    8088 Hadoop MapReduce UI
    11000 Oozie
    9092 Kafka
    2181 Zookeeper
	8042



1. Configure NTPD. Start up ntpd process on every host. Otherwise, Clouder Manager could display a healthcheck failure: The host’s NTP service did not respond to a request for the clock offset.
	 service ntpd status
	 service ntpd start
	 chkconfig ntpd on
	 chkconfig --list ntpd
	 ntpdc -np

								OR Try disabling it --> host_clock_offset_thresholds 
 
2. (Optional for enabling ssh to Docker Image )
	yum -y install openssh-server openssh-clients
	service sshd status
    chkconfig sshd on
    service sshd start 
	
3. Start Cloudera Manager:
/home/cloudera/cloudera-manager --express

OR 

/home/cloudera/cloudera-manager --force --express


4. Login to Cloudera Manager:

	<HOST_IP>:7180 (username/password is cloudera/cloudera)

	Start all services in Cloudera Manager.

5. Root user does not have all the hadoop permission hence change the user to hdfs
	
	su - hdfs

	nc -lk 9999

spark-submit --name test --master yarn --deploy-mode client --num-executors 3 --conf  spark.dynamicAllocation.enabled=false  --class sparkTest.WordCountSocketEx /var/log/sparkTest-0.0.1-SNAPSHOT.jar 60 localhost 9999

 http://172.17.0.2:4040	
	
6. For Graceful shutdown using:

	docker stop --time=60 [CONTAINER ID]
	
	
7. 	Misc Docker command :
	
	Login to the Docker container:
	docker exec -it [CONTAINER ID] bash
			OR
	docker attach [CONTAINER HASH]		
	
	Memory and resource usage :
	docker stats [CONTAINER ID]

	Copy local files to docker image
	docker cp YOUR_FILE [CONTAINER ID]:/tmp/
	
	List of ports opened in Docker
	docker port [CONTAINER ID]	

	Details of Docker image
	docker inspect [CONTAINER ID]

	 
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