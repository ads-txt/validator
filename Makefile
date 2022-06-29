prep:
	sudo apt install python3.10-venv

pyenv:
	python3 -m venv env

# doesn`t work. So, lets do it manually. Deactivate is the same way but deactivate. 
activ:
	cd env/
	source ./bin/activate
	cd ..

pip:
	pip install -r requirements.txt

build:
	docker-compose up -d --build

up:
	docker-compose up -d

run:
	./ads_validator/manage.py runserver