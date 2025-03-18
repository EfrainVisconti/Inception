COMPOSE_FILE=srcs/docker-compose.yml

all: build up

# Construye las imágenes
build:
	@echo "Construyendo imágenes..."
	docker-compose -f $(COMPOSE_FILE) build
# @sudo mkdir -p /home/eviscont/data/mariadb/
# @sudo mkdir -p /home/eviscont/data/wordpress/
# @sudo chown -R 1000:1000 /home/eviscont/data/wordpress
# @sudo chown -R 1000:1000 /home/eviscont/data/mariadb

# Levanta todos los servicios en segundo plano.
up:
	@echo "Iniciando servicios..."
	docker-compose -f $(COMPOSE_FILE) up -d

# Detiene y elimina todos los servicios.
down:
	@echo "Deteniendo servicios..."
	docker-compose -f $(COMPOSE_FILE) down

# Reinicia los servicios.
re: down up

# Limpia el sistema Docker eliminando contenedores detenidos,
# imágenes no referenciadas y sin uso, redes no utilizadas y
# volúmenes no utilizados.
prune: down
	@echo "Limpiando Docker..."
	docker system prune -a --volumes -f
# @sudo m -fr /home/eviscont/data/wordpress
# @sudo rm -fr /home/eviscont/data/mariadb

.PHONY: all up down re prune
