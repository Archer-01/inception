# ******************************* Docker Options *******************************
DOCKER_COMPOSE := docker-compose --file "./srcs/docker-compose.yml"

# ********************************** Targets ***********************************
all:
	$(DOCKER_COMPOSE) up --detach

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	docker system prune --force --all

re: fclean all

.PHONY: all clean fclean re
.SILENT: all clean fclean re
