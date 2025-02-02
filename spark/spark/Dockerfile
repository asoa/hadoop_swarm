FROM python:3.8-alpine3.11

ENV SPARK_VERSION=3.0.1

RUN apk --update add make automake gcc g++ subversion \
    curl tar bash openjdk8 nss libc6-compat && \
    ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

RUN curl -L http://apache.spinellicreations.com/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz -o spark-${SPARK_VERSION}-bin-hadoop2.7.tgz

RUN tar -xzf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop2.7 /spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    pip3 install --upgrade pip && \
    pip3 install wheel numpy pandas && \
    mkdir /etc/conf.d/hadoop

ENV SPARK_HOME="/spark"
ENV PYSPARK_PYTHON="/usr/local/bin/python"
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook"
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"
ENV HADOOP_CONF_DIR="/etc/conf.d/hadoop"

COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh
COPY ./conf/ /etc/conf.d/hadoop
