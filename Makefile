COMPOSE_FILE=srcs/docker-compose.yml

all: build up

# Construye las imágenes
build:
	@echo "Construyendo imágenes..."
	docker-compose -f $(COMPOSE_FILE) build

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

.PHONY: all up down re prune
