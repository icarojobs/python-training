.PHONY: up
up:
	@echo "--> Starting your docker infrastructure..."
	@docker compose up --force-recreate -d

.PHONY: ps
ps:
	@echo "--> Listing all containers available..."
	@docker compose ps

.PHONY: down
down:
	@echo "--> Shutting down all containers..."
	@docker compose down

.PHONY: restart
restart:
	@echo "--> Restarting all containers..."
	@docker compose down
	@docker compose up --force-recreate -d

.PHONY: project
project:
	@echo "--> Starting new django project with name '$(name)'..."
	@docker compose run --rm app django-admin startproject $(name) .

.PHONY: app
app:
	@echo "--> Creating new django app..."
	@docker compose run --rm app python manage.py startapp $(name)

.PHONY: server
server:	migrate up
	@echo "--> Starging django web-server..."
	@docker compose exec -it app python manage.py runserver 0.0.0.0:8001

.PHONY: migrations
migrations:
	@echo "--> Generating new migration files..."
	@docker compose run --rm app python manage.py makemigrations

.PHONY: migrate
migrate:	migrations
	@echo "--> Creating pending migrations and migrating pending tables..."
	@docker compose run --rm app python manage.py migrate

.PHONY: superuser
superuser:	migrate
	@echo "--> Creating new django superuser..."
	@docker compose exec -it app python manage.py createsuperuser

.PHONY: changepassword
changepassword:
	@echo "--> Changing user password..."
	@docker compose exec -it app python manage.py changepassword $(name)

.PHONY: build
build:
	@echo "--> Building new docker image without cache..."
	@docker compose build --no-cache

.PHONY: bash
bash:
	@docker compose exec -it app bash

.PHONY: shell
shell:
	@docker compose exec -it app python manage.py shell

.PHONY: poetry-init
poetry-init:
	@echo "--> Initializing poetry file."
	@docker compose run --rm app poetry init -vvv