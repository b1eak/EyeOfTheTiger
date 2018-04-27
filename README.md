Для экономии времени и ресурсов разворачиваем salt-master/minion на докере за основу буду использовать образ с Docker Hub:
mbologna/saltstack-master
запускать будем с кастомными портами 
docker run -d --hostname saltmaster --name saltmaster -v `pwd`/srv/salt:/srv/salt -p 8000:8000 -ti mbologna/saltstack-master
mbologna/saltstack-minion
запуск клиента  с помощью команды
docker run -d --hostname saltminion --name saltminion --link saltmaster:salt mbologna/saltstack-minion

