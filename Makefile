default: start

.PHONY: clean start

PROJECT_NAME = craft-node
DB_NAME = initialDB.sql

rebuild:
	docker-compose stop $(container) && docker-compose rm -f $(container) && docker-compose build --no-cache $(container) && docker-compose up -d $(container)

restart:
	docker-compose stop $(container) && docker-compose rm -f $(container) && docker-compose up -d $(container)

db_dump:
	docker exec $(PROJECT_NAME).mariadb mysqldump --databases -ucraft -ppassword $(PROJECT_NAME) > ./backend/data/$(DB_NAME)


db_restore:
	docker exec $(PROJECT_NAME).mariadb mysql -ucraft -ppassword $(PROJECT_NAME) < ./backend/$(DB_NAME)
