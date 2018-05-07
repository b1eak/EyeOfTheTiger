salt master и minion были так же развернуты в уже существующем у меня докере использовал
mbologna/saltstack-master и minion с hub.docker.com

salt * dockerng.build /root/websocket_chat image=websocket:latest для сборки из докерфайла использовал команду

для запуска и полной работоспособности не нашел обхода при условии занятого порта 8080 пришлось запустить без использования sls

docker run -p 8081:8080 -td 353683459bca

для проверки зашел в браузере вбил ip  dockerhost:8081 

увидел окно авторизации,далее зайти не смог
