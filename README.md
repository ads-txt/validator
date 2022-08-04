# Ads.txt Online Validator 

## How to run the project

### Preconditions:
Befor running you need to check that Makefile will work in your system.
Also you need enshure that docker works in your system.

## First way for installation

Steps:
1. In console go to the project folder using **cd** command.
Investigate and use **Makefile** as your map.
2. Run command **make deploy**

If it's not work please run commands from Makefile manually. 

## Second way for installation
Most important commands you can see in the **Makefile** file. 
For start docker container please run the commands:

~~~
make build  #Only first time for build docker container and after thet you need run second and 3th comand only
make up
make run
~~~

## Contribution
Please send a message to us if you found any issues/bugs
Danil Merkurev +7 916 836 16 65 (Telegram, WatsApp), danil.merkurev@yandex.com

### Команды для работы с Docker Compose
# Собирает сервисы, описанные в конфигурационных файлах
docker-compose build

# Запускает собранные сервисы
docker-compose up

# Запуск контейнеров на фоне с флагом -d
docker-compose up -d

# Если какой-то из сервисов завершит работу,
# то остальные будут остановлены автоматически
docker-compose up --abort-on-container-exit

# Запустит сервис application и выполнит внутри команду make install
docker-compose run application make install

# А так мы можем запустить сервис и подключиться к нему с помощью bash
docker-compose run application bash

# Со флагом --rm запускаемые контейнеры будут автоматически удаляться
docker-compose run --rm application bash

# Останавливает и удаляет все сервисы,
# которые были запущены с помощью up
docker-compose down

# Останавливает но не удаляет сервисы, запущенные с помощью up
# Их можно запустить снова с помощью docker-compose start
docker-compose stop

# Перезапускает все остановленные и запущенные сервисы
docker-compose restart




## Fixing connection error

sudo gpasswd -a $USER docker
newgrp docker
If you still have the problem, you may try after logging out and login back, or reboot. Or simply do:

sudo su $USER
Note: this may also happens if docker is not running on your machine. For linux with sytemd service manager, you could verify using command:

systemctl status docker.service

# or 
sudo usermod -aG docker $USER

## Fixing DockerException: Error while fetching server API version: UnixHTTPConnectionPool(host='localhost', port=None): Read timed out. (read timeout=60)

sudo systemctl restart docker

## Fixing Error while fetching server API version: ('Connection aborted.', ConnectionRefusedError(111, 'Connection refused'))
Solution: This means you haven’t started your docker service!

First, try to start it using

１．sudo systemctl start docker

２．sudo service docker start

３．sudo /etc/init.d/docker restart

