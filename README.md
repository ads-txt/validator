# Ads.txt Online Validator 

## How to run the project

### Preconditions:
Befor running you need to check that Makefile will wark in your system.
Also you need to be sure that docker works in your system.

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
