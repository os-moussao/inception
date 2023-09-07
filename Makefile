DOCKER_COMPOSE=docker compose -f ./srcs/docker-compose.yml -p inception

all: build up

build:
	mkdir -p /home/omoussaoui/data/wordpress
	mkdir -p /home/omoussaoui/data/mariadb
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down -v

logs-wp:
	$(DOCKER_COMPOSE) logs wordpress 

logs-db:
	$(DOCKER_COMPOSE) logs mariadb

logs-serv:
	$(DOCKER_COMPOSE) logs nginx

ps:
	docker ps

clean: down
	sudo rm -rf /home/omoussaoui/data/wordpress/* 
	sudo rm -rf /home/omoussaoui/data/mariadb/* 

fclean: clean
	docker system prune -af --volumes

re: clean all


