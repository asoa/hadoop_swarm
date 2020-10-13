hadoop_services=(namenode \
datanode \
resourcemanager \
nodemanager \
historyserver
)

spark_services=(spark-master \
spark-worker \
jupyter-lab
)

for service in ${hadoop_services[@]};
do 
  docker-compose -f docker-compose.yml push $service
done;

for service in ${spark_services[@]};
do
  docker-compose -f spark/docker-compose.yml push $service
done;
