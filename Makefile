step1:
	docker-compose build

step2:
	READ_TIMEOUT=180
	docker compose up -d

run:
	READ_TIMEOUT=180
	docker compose up -d

deploy:
	export DOCKER_CLIENT_TIMEOUT=300
	export COMPOSE_HTTP_TIMEOUT=300
	export READ_TIMEOUT=300
	docker-compose build
	docker-compose up -d
	echo -e "\a"

down:
	docker-compose down -v --rmi all

cont-bash:
	docker-compose exec app bash

ansible:
	python3 -m pip install --user ansible

git:
	git add .
	git commit -m "${ARG}"
	git push

chown:
	sudo chown -R ${USER}:${USER} ads_validator manage.py
# sudo chown -R ${USER} .

deploy2:
	cp -n .env.example .env
	sudo apt install python3.10-venv
	docker-compose run python3 -m venv env
	. ./env/bin/activate
	docker-compose build
	docker-compose up -d

port:
	fuser -vn tcp ${PORT}

port2:
	sudo kill -9 ${PROC}