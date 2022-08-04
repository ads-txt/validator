prep:
	sudo apt install python3.10-venv

env:
	python3 -m venv env

.PHONY: env

env2:
	cp -n .env.example .env

act:
	. ./env/bin/activate

act2:
	sudo source env/bin/activate

pip:
	pip install -r requirements.txt

build:
	docker-compose build

up:
	docker compose up -d

deploy:
	export DOCKER_CLIENT_TIMEOUT=120
	export COMPOSE_HTTP_TIMEOUT=120
	docker-compose build
	docker-compose up -d


down:
	docker-compose down -v --rmi all

app:
	docker-compose run app bash
#docker-compose run --name validator_container  -p 8000:8000 -e STATIC_ROOT=${APP_HOME}/static/ app
#./ads_validator/manage.py runserver

ansible:
	python3 -m pip install --user ansible

git:
	git add .
	git commit -m "${ARG}"
	git push

fix:
	sudo chown -R ${USER} .

deploy2:
	cp -n .env.example .env
	sudo apt install python3.10-venv
	python3 -m venv env
	. ./env/bin/activate
	docker-compose build
	docker-compose up -d
