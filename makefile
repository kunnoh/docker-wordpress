ENV=./local.env

.DEFAULT_GOAL := help

.PHONY: build start stop restart rebuild destroy

build:
	@echo ""
	@echo "[+] BUILDING. using $(ENV) compose file..."
	@docker-compose --env-file=$(ENV) -f docker-compose.yml build
	@echo "[+] images built:"
	@echo "[+]    - wordpress -> wpapp"
	@echo "[+]    - mysql -> mysqldb"
	@echo ""

start:
	@echo ""
	@echo "[*] STARTING: building containers..."
	@echo ""
	@docker-compose --env-file=$(ENV) -f docker-compose.yml up -d
	@echo "[*] Containers started"
	@echo ""
	@echo ""


stop:
	@echo ""
	@echo "[*] STOPPING: stopping containers"
	@docker-compose --env-file=$(ENV) -f docker-compose.yml down
	@echo ""

restart: stop start

rebuild:
	@echo ""
	@echo "[*] REBUILDING"
	@make stop
	@docker-compose --env-file=$(ENV) -f docker-compose.yml up --build -d
	@make start
	@echo ""

destroy:
	@echo ""
	@echo "[*] DESTROYING ALL CONTAINERS AND VOLUMES"
	@docker-compose --env-file=$(ENV) -f docker-compose.yml down -v
	@echo ""
	@docker rmi docker-wordpress-pgdb:latest docker-wordpress-pgadmin4:latest docker-wordpress-pgdb:latest
	@echo "[+] complete!"
	@echo ""
	@echo ""

help:
	@echo ""
	@echo "[*] USAGE .."
	@echo ""
	@echo "    make [ options ]"
	@echo "        - [ start | stop | restart | rebuild | destroy ]"
	@echo "    example:"
	@echo "        make start - start system using docker-compose.yml"
	@echo ""
