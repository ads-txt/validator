#### Additional info

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

## Fixing Error while fetching server API version: ('Connection aborted.', ConnectionRefusedError(111, 'Connection refused'))
Solution: This means you haven’t started your docker service!

First, try to start it using

１．sudo systemctl start docker

２．sudo service docker start

３．sudo /etc/init.d/docker restart



## IF Problem:
While running a docker command like docker-compose pull, you see an error message like


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
### fix-docker-errors-dockerexception-error-while-fetching-server-api-version-connection-aborted-filenotfounderror2-no-such-file-or-directory.sh📋 Copy to clipboard⇓ Download
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