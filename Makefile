


name = inception

DC_FILE := ./srcs/docker-compose.yml

all:
	@printf "Launching ${name}\n"
#	if [ ! -d "./srcs/requirements/mariadb/conf/db-volume" ]; then \
#		mkdir ./srcs/requirements/mariadb/conf/db-volume \
#	fi
	@docker-compose -f $(DC_FILE) up -d
	

build:
	@printf "Building ${name}...\n"
	@docker-compose -f $(DC_FILE) up -d --build

# Target to stop the configuration
down:
	@printf "Downing ${name}...\n"
	@docker-compose -f $(DC_FILE) down

# Target to rebuild the configuration
re:	down
	@printf "Rebuild ${name}...\n"
	@docker-compose -f $(DC_FILE) up -d --build

stop:
	@printf "stopping ${name}...\n"
	@docker-compose -f $(DC_FILE) stop

dockersp:
	docker-compose -f $(DC_FILE) $(ARGS)
# Prune if needed
prune:
	@docker-compose -f $(DC_FILE) stop
	docker system prune -af
prune-up: prune all

# Declare phony targets to avoid conflicts with file names
.PHONY	: all build down re stop