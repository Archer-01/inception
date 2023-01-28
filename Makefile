# ******************************* Docker Options *******************************
COMPOSE_FILE	:= ./srcs/docker-compose.yml
DOCKER_COMPOSE	:= docker-compose --file $(COMPOSE_FILE)

# ********************************** Targets ***********************************
all:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up --detach

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	docker system prune --force

re: fclean all

logs:
	$(DOCKER_COMPOSE) logs --follow

ps:
	docker ps --all

.PHONY: all clean fclean re logs ps
.SILENT: all clean fclean re logs ps
