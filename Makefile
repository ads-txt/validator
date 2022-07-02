prep:
	sudo apt install python3.10-venv

env:
	python3 -m venv env

.PHONY: env

act:
	. ./env/bin/activate

pip:
	pip install -r requirements.txt

build:
	docker-compose up -d --build

up:
	docker-compose up -d

run:
	./ads_validator/manage.py runserver

git:
	git add .
	git commit -m "${ARG}"
	git push

deploy:
	cp -n .env.example .env
	pip install -r requirements.txt
	sudo apt install python3.10-venv
	python3 -m venv env
	. ./env/bin/activate
	docker-compose up -d --build
	./ads_validator/manage.py runserver
