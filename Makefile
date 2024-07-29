
name = inception

all:
	@printf "Launch configuration ${name}\n"
#	if [ ! -d "./srcs/requirements/mariadb/conf/db-volume" ]; then \
#		mkdir ./srcs/requirements/mariadb/conf/db-volume \
#	fi
	@docker-compose -f srcs/docker-compose.yml up -d

build:
	@printf "Building configuration ${name}...\n"
	if [ ! -d "./srcs/requirements/mariadb/conf/db-volume" ]; then \
		mkdir ./srcs/requirements/mariadb/conf/db-volume \
	fi
	@docker-compose -f srcs/docker-compose.yml up -d --build

# Target to stop the configuration
down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

# Target to rebuild the configuration
re:	down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

# Target to clean up unused Docker images
clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

# Target to perform a full clean of all Docker configurations
fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

dockersp:
	docker-compose -f ./srcs/docker-compose.yml $(ARGS)

# Declare phony targets to avoid conflicts with file names
.PHONY	: all build down re clean fclean