Для экономии времени и ресурсов разворачиваем salt-master/minion на докере за основу буду использовать образ с Docker Hub:
  mbologna/saltstack-master
запускать будем с кастомным портом 8000
  docker run -d --hostname saltmaster --name saltmaster -v `pwd`/srv/salt:/srv/salt -p 8000:8000 -ti mbologna/saltstack-master

  mbologna/saltstack-minion
запуск клиента  с помощью команды

  docker run -d --hostname saltminion --name saltminion --link saltmaster:salt mbologna/saltstack-minion
  
  
  В Dockerfile находится приложение вебчат
  для его сборки необходимо ( при наличии Docker host)
  docker build -t websocketchat . (создается контейнер с именем websocketchat )
  запуск контейнера можно произвести с помощью команды
  docker run -p 1337:8080 -itd 353683459bca (порт 1337 указал потому что 8080 у меня был занят в контейнере будет 8080)
  для проверки работоспособности контейнера вводим в браузере адрес  dockerhost:1337 чат откроется
  
  
  

