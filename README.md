# Ads.txt Online Validator 

## How to run the project

### Preconditions:
Befor running you need to check that Makefile will work in your system.
Also you need enshure that docker works in your system.

## How to run? 

**Just use these comands**: 
make step1
make step2
. ./env/bin/activate
make step3
make step4



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



## IF Problem:
While running a docker command like docker-compose pull, you see an error message like

fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.txt📋 Copy to clipboard⇓ Download
Traceback (most recent call last):
  File "/usr/bin/docker-compose", line 33, in <module>
    sys.exit(load_entry_point('docker-compose==1.27.4', 'console_scripts', 'docker-compose')())
  File "/usr/lib/python3.8/site-packages/compose/cli/main.py", line 67, in main
    command()
  File "/usr/lib/python3.8/site-packages/compose/cli/main.py", line 123, in perform_command
    project = project_from_options('.', options)
  File "/usr/lib/python3.8/site-packages/compose/cli/command.py", line 60, in project_from_options
    return get_project(
  File "/usr/lib/python3.8/site-packages/compose/cli/command.py", line 131, in get_project
    client = get_client(
  File "/usr/lib/python3.8/site-packages/compose/cli/docker_client.py", line 41, in get_client
    client = docker_client(
  File "/usr/lib/python3.8/site-packages/compose/cli/docker_client.py", line 170, in docker_client
    client = APIClient(**kwargs)
  File "/usr/lib/python3.8/site-packages/docker/api/client.py", line 197, in __init__
    self._version = self._retrieve_server_version()
  File "/usr/lib/python3.8/site-packages/docker/api/client.py", line 221, in _retrieve_server_version
    raise DockerException(
docker.errors.DockerException: Error while fetching server API version: ('Connection aborted.', FileNotFoundError(2, 'No such file or directory'))
Solution:
This means you haven’t started your docker service!

First, try to start it using

fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.sh📋 Copy to clipboard⇓ Download
sudo systemctl start docker
or

fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.sh📋 Copy to clipboard⇓ Download
sudo service docker start
or

fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.sh📋 Copy to clipboard⇓ Download
sudo /etc/init.d/docker restart
(whatever works with your distribution).

After that, retry the command that originally caused the error message to appear.

In case it still shows the same error message, try the following steps:


First, check /var/log/docker.log using
fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.sh📋 Copy to clipboard⇓ Download
cat /var/log/docker.log
Check that file for errors during docker startup.

Also check if the user you’re running the command as is a member of the docker group. While insufficient permissions will not cause a FileNotFoundError(2, 'No such file or directory')), but a Permission denied, the error message might look similar in some cases.


### Additional info
Linked containers on the default bridge network share environment variables.
