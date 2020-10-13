.PHONY: build_hadoop build_spark push_images stack_up stack_down

build_hadoop:
	@echo 'building hadoop containers'
	docker-compose -f docker-compose.yml build namenode
	docker-compose -f docker-compose.yml build datanode
	docker-compose -f docker-compose.yml build resourcemanager
	docker-compose -f docker-compose.yml build nodemanager
	docker-compose -f docker-compose.yml build historyserver

build_spark:
	@echo 'building spark containers'
	docker-compose -f spark/docker-compose.yml build spark-master
	docker-compose -f spark/docker-compose.yml build spark-worker
	docker-compose -f spark/docker-compose.yml build jupyter-lab

push_images:
	@echo 'pushing images to local repository'
	./push_hadoop_services.sh

stack_up:
	./stack_up.sh

stack_down:
	./stack_down.sh	
