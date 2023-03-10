# ******************************* Docker Options *******************************
COMPOSE_FILE	:= ./srcs/docker-compose.yml
DOCKER_COMPOSE	:= docker-compose --file $(COMPOSE_FILE)

# ******************************** Directories *********************************
WORDPRESS_DIR	:= /home/hhamza/data/wordpress
MARIADB_DIR		:= /home/hhamza/data/mariadb
PORTAINER_DIR	:= /home/hhamza/data/portainer

# ********************************** Targets ***********************************
all: | $(WORDPRESS_DIR) $(MARIADB_DIR) $(PORTAINER_DIR)
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up --detach

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	docker system prune --force
	sudo rm -rf /home/hhamza/data

re: fclean all

logs:
	$(DOCKER_COMPOSE) logs --follow

ps:
	$(DOCKER_COMPOSE) ps --all

$(WORDPRESS_DIR):
	mkdir -p $@

$(MARIADB_DIR):
	mkdir -p $@

$(PORTAINER_DIR):
	mkdir -p $@

.PHONY: all clean fclean re logs ps
.SILENT: all clean fclean re logs ps $(WORDPRESS_DIR) $(MARIADB_DIR) $(PORTAINER_DIR)
