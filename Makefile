DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml -p inception

all: build up

build:
	mkdir -p /home/omoussao/data/wordpress
	mkdir -p /home/omoussao/data/mariadb
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down -v

wp-logs:
	$(DOCKER_COMPOSE) logs wordpress 

db-logs:
	$(DOCKER_COMPOSE) logs mariadb --follow
logs:
	$(DOCKER_COMPOSE) logs nginx

ps:
	$(DOCKER_COMPOSE) ps

stop:
	$(DOCKER_COMPOSE) stop

clean: down
	rm -rf /home/omoussao/data/wordpress/* 
	rm -rf /home/omoussao/data/mariadb/* 

re: clean all


