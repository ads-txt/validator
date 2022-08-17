step1:
	sudo apt install python3.10-venv

step2:
	python3 -m venv env

# run command:   . ./env/bin/activate

step3:
	docker-compose build

step4:
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
	docker-compose up


down:
	docker-compose down -v --rmi all

bash:
	docker-compose run app bash
#docker-compose run --name validator_container  -p 8000:8000 -e STATIC_ROOT=${APP_HOME}/static/ app
#./ads_validator/manage.py runserver

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

project:
	docker-compose run python3 -m django-admin startproject ads_validator