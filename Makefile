name = mariadb-replication
user = ringo

# Build Container
build:
	docker build -t $(user)/$(name) .
.PHONY: build

# Publish Container
push:
	docker login -u $${DOCKER_HUB_USER} -p $${DOCKER_HUB_PASSWORD} && docker push $(user)/$(name)
.PHONY: push

# Run Container
up:
	docker-compose up -d
.PHONY: up

# Stop container
down:
	docker-compose down
.PHONY: down

# Login container
login:
	docker exec -it $$(docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}" | tail -n +2 | sort | fzf | tr -s ' ' | cut -d ' ' -f 4) bash
.PHONY: login
