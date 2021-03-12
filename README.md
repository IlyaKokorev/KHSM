# Игра "Кто хочет стать миллионером?"

Учебное приложение "Кто хочет стать миллионером?"

На основе этого приложения были закреплены навыки тестирования. 

А именно тестирование: 
* Моделей (при помощи `factory_bot`);
* Контроллеров;
* Шаблонов;
* TDD;
* Интеграционные тесты (при помощи `capybara`).

## Установка и запуск

* ```git clone git@github.com:IlyaKokorev/khsm.git```
* ```bundle install```
* ```bundle exec rake db:migrate```
* ```yarn```
* ```bundle exec rails s```
* ```http://localhost:3000/```