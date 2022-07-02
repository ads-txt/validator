prep:
	sudo apt install python3.10-venv

pyenv:
	python3 -m venv env

activ:
	cd ./env/ |	source ./bin/activate | cd ..

pip:
	pip install -r requirements.txt

build:
	docker-compose up -d --build --remove-orphans

up:
	docker-compose up -d

run:
	./ads_validator/manage.py runserver

git:
	git add .
	git commit -m "${ARGS}"
	git push

deploy:
	pip install -r requirements.txt
	sudo apt install python3.10-venv
	python3 -m venv env
	cd env/
	source ./bin/activate
	cd ..
	docker-compose up -d --build
	./ads_validator/manage.py runserver
