deploy:
	cp -T example.env .env
	export DOCKER_CLIENT_TIMEOUT=300
	export COMPOSE_HTTP_TIMEOUT=300
	export READ_TIMEOUT=300
	docker-compose build
	docker-compose up -d
	echo -e "\a"

up:
	docker-compose up -d

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

port:
	fuser -vn tcp ${ARG}

port2:
	sudo kill -9 ${ARG}