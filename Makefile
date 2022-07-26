prep:
	sudo apt install python3.10-venv

env:
	python3 -m venv env

.PHONY: env

env2:
	cp -n .env.example .env

act:
	. ./env/bin/activate

pip:
	pip install -r requirements.txt

build:
	docker-compose up --build

build2:
	docker-compose up -d --build

up:
	docker compose up -d

down:
	docker compose down

run:
	./ads_validator/manage.py runserver

ansible:
	python3 -m pip install --user ansible

git:
	git add .
	git commit -m "${ARG}"
	git push

fix:
	sudo chown -R $USER .

deploy:
	cp -n .env.example .env
	pip install -r requirements.txt
	sudo apt install python3.10-venv
	python3 -m venv env
	. ./env/bin/activate
	docker-compose up -d --build
	./ads_validator/manage.py runserver
